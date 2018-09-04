/*----------------------------------------------------------------------------------*/
/* GENERAL ESTIMATING EQUATION MODELS												*/
/*																					*/
 
/*----------------------------------------------------------------------------------*/
/*	Baseline-Change simple GEE; anticipated a binomial distribution, two timepoints,*/
/*	and attempts to correct exponential output for scale based on 0-100 range.		*/
/*																					*/
/*	Sample usage:																	*/
/*		%modl(isClinical,KNOW_Non_medication_approaches_f--KNOW_Problematic_medications_and,timepoint);*/
%macro modl(outcome, var, timepoint);
	title &var;
	proc genmod data=GWEP.modanal descending;
		/*class class1 class2;*/ /*add custom classes as needed*/
		where &outcome ne .;
		model &outcome = &var &timepoint &var*&timepoint / dist=binomial link=logit;
		/*repeated subject=repeat1; */ /*add repeated subjects as needed*/
		estimate 'bl' &var 10/exp;
		estimate 'change' &var*&timepoint 60/exp;
	run;
%mend modl;



/*----------------------------------------------------------------------------------*/
/*	Multiple variable execution of %modl 											*/
/*																					*/
/*Sample usage:																		*/
/*%multimodl(KNOW_Non_medication_approaches_f--KNOW_Providing_guidance_and_com0);	*/
/*%multimodl(Cognition Independence Safety Goals MentalHealth);						*/
%macro multimodl(name_list);
	%local i next_name;
	%do i=1 %to %sysfunc(countw(&name_list));
	   %let next_name = %scan(&name_list, &i);
		%modl(isClinical,&next_name,timepoint);
	   %** DO whatever needs to be done for &NEXT_NAME;
	%end;
%mend multimodl;


/*----------------------------------------------------------------------------------*/
/* AUTOMATED OUTPUT HOOKS															*/
/*																					*/
/*	ODS suitable variants of the macros above. Because utility of this is highly 	*/
/*	dependent on anticipated usage, it is left to the user to employ "ods trace on" */
/*	to find output hooks for downstream processing									*/

%macro modlOdsAuto(outcome, var, timepoint);
	title &var;
	proc genmod data=GWEP.modanal descending;
		/*class sitename origin;*/
		where &outcome ne .;
		model &outcome = &var &timepoint &var*&timepoint / dist=binomial link=logit;
		/*repeated subject=sitename; */
		estimate 'bl' &var 10/exp;
		estimate 'change' &var*&timepoint 60/exp;
	run;
    ods output Estimates=myEstimates;
	PROC SQL;
	CREATE TABLE _estimateOut AS
	SELECT SYMGET('var') as varLabel,A.ProbChiSq as ProbChiSqBl
			,B.ProbChiSq as ProbChiSqChange 
			,C.LBetaEstimate
			,C.LBetaLowerCL
			,C.LBetaUpperCL 
		FROM myEstimates A
		INNER JOIN myEstimates B ON B.label='change'
		INNER JOIN myEstimates C on C.label='Exp(change)'
		WHERE A.label='bl';
	QUIT;

	proc print data=_estimateOut;
    run;

	PROC DATASETS LIBRARY=work;
		DELETE myEstimates;
	RUN;

%mend modlOdsAuto;

%macro multiModlOds(name_list);
	
	%local i next_name;
	PROC DATASETS LIBRARY=work ;
		DELETE _multiout;
	RUN;
	%do i=1 %to %sysfunc(countw(&name_list));
	   %let next_name = %scan(&name_list, &i);
		%modlOdsAuto(isClinical,&next_name,timepoint);

		%if &i=1 %then %do;
				DATA _multiOut;
					SET _estimateOut;
				RUN;
			%end;
			%else %do;
				PROC DATASETS LIBRARY=work  ;
					APPEND BASE=_multiOut DATA=_estimateOut;
				RUN;
			%end;


	%end;
%mend multiModlOds;
