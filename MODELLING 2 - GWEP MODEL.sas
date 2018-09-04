%macro modl(outcome, var, timepoint);
	title &var;
	proc genmod data=GWEP.modanal descending;
		/*class sitename origin;*/
		where &outcome ne .;
		model &outcome = &var &timepoint &var*&timepoint / dist=binomial link=logit;
		/*repeated subject=sitename; */
		estimate 'bl' &var 10/exp;
		estimate 'change' &var*&timepoint 60/exp;
	run;
%mend modl;

*%modl(isClinical,KNOW_Non_medication_approaches_f--KNOW_Problematic_medications_and,timepoint);

%macro multimodl(name_list);
	%local i next_name;
	%do i=1 %to %sysfunc(countw(&name_list));
	   %let next_name = %scan(&name_list, &i);
		%modl(isClinical,&next_name,timepoint);
	   %** DO whatever needs to be done for &NEXT_NAME;
	%end;
%mend multimodl;


*ods trace on;

%multimodl(KNOW_Non_medication_approaches_f--KNOW_Providing_guidance_and_com0);
*ods trace off;


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

%mend modlOds;

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
/*    proc print data=_estimateOut;
       * 'Values of Car, Age, and the Predicted Values';
    run;
*/

	%end;
%mend multimodl;


ods listing close;
*		%modlOds(isClinical,KNOW_Non_medication_approaches_f,timepoint);
*ods exclude none;

title "Multiple models";
*		%multiModlOds(KNOW_Non_medication_approaches_f);
*		%multiModlOds(KNOW_Non_medication_approaches_f--KNOW_Screening_for_sensory_impai);

 *   proc print data=_multiOut;
       * 'Values of Car, Age, and the Predicted Values';
  *  run;

	/*
 ods listing;
    proc print data=myEstimates noobs;
       * 'Values of Car, Age, and the Predicted Values';
    run;



*/
%multimodl(Cognition Independence Safety Goals MentalHealth);
