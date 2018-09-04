/*Package anticipates at least preanalysis data set in the GWEP library:*/
/*	preanal.sas7bdat - the comprehensive output from the combined      	*/
/*	REDCap data systems, usually generated by exporting	CSV output from */
/*	the two main GWEP systems:											*/
/*																		*/
/*		GWEP Training Event Overview (pid=16148) 						*/
/*		GWEP training evaluation platform (pid=13577					*/
/*																		*/
/*	Merging these data is conventionally accomplished with an Excel file*/
/*	that employs a lookup to match the two data sets based on event 	*/
/*	name.  																*/
/*																		*/
/*	Data should then be output from Excel to SAS via StatTransfer for	*/
/*	the analysis conducted herein.										*/
libname GWEP 'C:\Users\rfrazier\Desktop\Remi\$working\GWEP\ANALYSIS';



/*------------------------------------------------------------------------------*/
/*CREATE PREANALYSIS DATASET													*/
DATA GWEP.preanal;
	/*Subset source data to remove records without GUID and the test	*/
	/*record that is in the system to correct autonumbering issues.		*/
	SET GWEP.OACexport(where=(record_id^=. AND record_id^=9000000000000));
	/*Create PRE  scores for each question*/
		*PRES_Roles_of_different_discipli=25*PRE__Roles_of_different_discipli-25; /*Unused*/
		PRES_Non_medication_approaches_f=25*PRE__Non_medication_approaches_f-25;
		PRES_Problematic_medications_and=25*PRE__Problematic_medications_and-25;
		PRES_Using_cognitive_screening_t=25*PRE__Using_cognitive_screening_t-25;
		PRES_How_to_distinguish_between_=25*PRE__How_to_distinguish_between_-25;
		PRES_How_to_assess_activities_of=25*PRE__How_to_assess_activities_of-25;
		PRES_Screening_for_sensory_impai=25*PRE__Screening_for_sensory_impai-25;
		PRES_How_to_implement_appropriat=25*PRE__How_to_implement_appropriat-25;
		PRES_How_to_recognize_elder_abus=25*PRE__How_to_recognize_elder_abus-25;
		PRES_How_to_implement_appropria0=25*PRE__How_to_implement_appropria0-25;
		PRES_How_to_report_elder_abuse_o=25*PRE__How_to_report_elder_abuse_o-25;
		PRES_Scope_of_care_models_for_ol=25*PRE__Scope_of_care_models_for_ol-25;
		PRES_When_to_utilize_emergency_s=25*PRE__When_to_utilize_emergency_s-25;
		PRES_How_to_engage_older_adults_=25*PRE__How_to_engage_older_adults_-25;
		PRES_How_to_engage_older_adults0=25*PRE__How_to_engage_older_adults0-25;
		PRES_Using_prognostication_tools=25*PRE__Using_prognostication_tools-25;
		PRES_How_to_promote_age__and_pro=25*PRE__How_to_promote_age__and_pro-25;
		PRES_Screening_for_social_isolat=25*PRE__Screening_for_social_isolat-25;
		PRES_Screening_for_common_mental=25*PRE__Screening_for_common_mental-25;
		PRES_How_to_recognize_caregiver_=25*PRE__How_to_recognize_caregiver_-25;
		PRES_How_to_address_substance_an=25*PRE__How_to_address_substance_an-25;
		PRES_Providing_guidance_and_comm=25*PRE__Providing_guidance_and_comm-25;
		PRES_Providing_guidance_and_com0=25*PRE__Providing_guidance_and_com0-25;

	/*Create POST  scores for each question*/
		*POSS__Roles_of_different_discipl=25*POST__Roles_of_different_discipl-25; /*Unused*/
		POSS__Non_medication_approaches_=25*POST__Non_medication_approaches_-25;
		POSS__Problematic_medications_an=25*POST__Problematic_medications_an-25;
		POSS__Using_cognitive_screening_=25*POST__Using_cognitive_screening_-25;
		POSS__How_to_distinguish_between=25*POST__How_to_distinguish_between-25;
		POSS__How_to_assess_activities_o=25*POST__How_to_assess_activities_o-25;
		POSS__Screening_for_sensory_impa=25*POST__Screening_for_sensory_impa-25;
		POSS__How_to_implement_appropria=25*POST__How_to_implement_appropria-25;
		POSS__How_to_recognize_elder_abu=25*POST__How_to_recognize_elder_abu-25;
		POSS__How_to_implement_appropri0=25*POST__How_to_implement_appropri0-25;
		POSS__How_to_report_elder_abuse_=25*POST__How_to_report_elder_abuse_-25;
		POSS__Scope_of_care_models_for_o=25*POST__Scope_of_care_models_for_o-25;
		POSS__When_to_utilize_emergency_=25*POST__When_to_utilize_emergency_-25;
		POSS__How_to_engage_older_adults=25*POST__How_to_engage_older_adults-25;
		POSS__How_to_engage_older_adult0=25*POST__How_to_engage_older_adult0-25;
		POSS__Using_prognostication_tool=25*POST__Using_prognostication_tool-25;
		POSS__How_to_promote_age__and_pr=25*POST__How_to_promote_age__and_pr-25;
		POSS__Screening_for_social_isola=25*POST__Screening_for_social_isola-25;
		POSS__Screening_for_common_menta=25*POST__Screening_for_common_menta-25;
		POSS__How_to_recognize_caregiver=25*POST__How_to_recognize_caregiver-25;
		POSS__How_to_address_substance_a=25*POST__How_to_address_substance_a-25;
		POSS__Providing_guidance_and_com=25*POST__Providing_guidance_and_com-25;
		POSS__Providing_guidance_and_co0=25*POST__Providing_guidance_and_co0-25;

	/*Create CHANGE scores for each question*/
	*	CHG__Roles_of_different_discipl=25*(POST__Roles_of_different_discipl-PRE__Roles_of_different_discipli)-25; /*Unused*/
		CHG__Problematic_medications_an=POSS__Problematic_medications_an-PRES_Problematic_medications_and;
		CHG__Using_cognitive_screening_=POSS__Using_cognitive_screening_-PRES_Using_cognitive_screening_t;
		CHG__How_to_distinguish_between=POSS__How_to_distinguish_between-PRES_How_to_distinguish_between_;
		CHG__How_to_assess_activities_o=POSS__How_to_assess_activities_o-PRES_How_to_assess_activities_of;
		CHG__Screening_for_sensory_impa=POSS__Screening_for_sensory_impa-PRES_Screening_for_sensory_impai;
		CHG__How_to_implement_appropria=POSS__How_to_implement_appropria-PRES_How_to_implement_appropriat;
		CHG__How_to_recognize_elder_abu=POSS__How_to_recognize_elder_abu-PRES_How_to_recognize_elder_abus;
		CHG__How_to_implement_appropri0=POSS__How_to_implement_appropri0-PRES_How_to_implement_appropria0;
		CHG__How_to_report_elder_abuse_=POSS__How_to_report_elder_abuse_-PRES_How_to_report_elder_abuse_o;
		CHG__Scope_of_care_models_for_o=POSS__Scope_of_care_models_for_o-PRES_Scope_of_care_models_for_ol;
		CHG__When_to_utilize_emergency_=POSS__When_to_utilize_emergency_-PRES_When_to_utilize_emergency_s;
		CHG__How_to_engage_older_adults=POSS__How_to_engage_older_adults-PRES_How_to_engage_older_adults_;
		CHG__How_to_engage_older_adult0=POSS__How_to_engage_older_adult0-PRES_How_to_engage_older_adults0;
		CHG__Using_prognostication_tool=POSS__Using_prognostication_tool-PRES_Using_prognostication_tools;
		CHG__How_to_promote_age__and_pr=POSS__How_to_promote_age__and_pr-PRES_How_to_promote_age__and_pro;
		CHG__Screening_for_social_isola=POSS__Screening_for_social_isola-PRES_Screening_for_social_isolat;
		CHG__Screening_for_common_menta=POSS__Screening_for_common_menta-PRES_Screening_for_common_mental;
		CHG__How_to_recognize_caregiver=POSS__How_to_recognize_caregiver-PRES_How_to_recognize_caregiver_;
		CHG__How_to_address_substance_a=POSS__How_to_address_substance_a-PRES_How_to_address_substance_an;
		CHG__Providing_guidance_and_com=POSS__Providing_guidance_and_com-PRES_Providing_guidance_and_comm;
		CHG__Providing_guidance_and_co0=POSS__Providing_guidance_and_co0-PRES_Providing_guidance_and_com0;

	/*			,PRE__When_to_utilize_emergency_s*//*Unused*/

	/*------------------------------------------*/
	/*Create scores for each pseudo-scale		*/

	/*Create PRE scores for each pseudo-scale	*/

	cognitionPre=25*mean(PRE__Non_medication_approaches_f
					,PRE__Using_cognitive_screening_t
					,PRE__How_to_distinguish_between_)-25;

	independencePre=25*mean(PRE__How_to_assess_activities_of
						,PRE__Screening_for_sensory_impai
						,PRE__How_to_implement_appropriat)-25;

	safetyPre=25*mean(PRE__How_to_recognize_elder_abus
					,PRE__How_to_implement_appropria0
					,PRE__How_to_report_elder_abuse_o
					,PRE__Problematic_medications_and)-25;

	goalsPre=25*mean(PRE__Scope_of_care_models_for_ol
					,PRE__How_to_engage_older_adults_
					,PRE__How_to_engage_older_adults0
					,PRE__Using_prognostication_tools
					,PRE__How_to_promote_age__and_pro)-25;

	mentalhealthPre=25*mean(PRE__Screening_for_social_isolat
					,PRE__Screening_for_common_mental
					,PRE__How_to_address_substance_an
					,PRE__Providing_guidance_and_comm
					,PRE__How_to_recognize_caregiver_
					,PRE__Providing_guidance_and_com0)-25;

	/*Create POST scores for each pseudo-scale*/
	cognitionPost=25*mean(POST__Non_medication_approaches_
					,POST__Using_cognitive_screening_
					,POST__How_to_distinguish_between)-25;

	independencePost=25*mean(POST__How_to_assess_activities_o
					,POST__Screening_for_sensory_impa
					,POST__How_to_implement_appropria)-25;

	safetyPost=25*mean(POST__How_to_recognize_elder_abu
					,POST__How_to_implement_appropri0
					,POST__How_to_report_elder_abuse_
					,POST__Problematic_medications_an)-25;

	goalsPost=25*mean(POST__Scope_of_care_models_for_o
					,POST__How_to_engage_older_adults
					,POST__How_to_engage_older_adult0
					,POST__Using_prognostication_tool
					,POST__How_to_promote_age__and_pr)-25;

	mentalhealthPost=25*mean(POST__Screening_for_social_isola
					,POST__Screening_for_common_menta
					,POST__How_to_address_substance_a
					,POST__Providing_guidance_and_com
					,POST__How_to_recognize_caregiver
					,POST__Providing_guidance_and_co0)-25;
	/*Create CHANGE scores for each pseudo-scale*/
	cognitionChange=cognitionPost-cognitionPre;
	independenceChange=independencePost-independencePre;
	safetyChange=safetyPost-safetyPre;
	goalsChange=goalsPost-goalsPre;
	mentalhealthChange=mentalhealthPost-mentalhealthPre;
	
	/*Create CHECK scores for each pseudo-scale based on extant variables*/
	
	cognitionCheck=cognition-cognitionChange;
	independenceCheck=independence-independenceChange;
	safetyCheck=safety-safetyChange;
	goalsCheck=individualizedgoalsetting-goalsChange;
	mentalhealthCheck=mentalhealth-mentalhealthChange;

	/*Create clinical-related participant type variable based on descriptive	*/
	/*categorization from research team.										*/
		isClinical=.;
		if profession="Behavioral Health/Social Work" AND discipline="Clinical Psychology" AND subdiscipline=. THEN isClinical=1;
		if profession="Behavioral Health/Social Work" AND discipline="Clinical Social Work" AND subdiscipline=. THEN isClinical=1;
		if profession="Behavioral Health/Social Work" AND discipline="Other-Psychology" AND subdiscipline=. THEN isClinical=0;
		if profession="Behavioral Health/Social Work" AND discipline="Other-SW/Addictions Counseling" AND subdiscipline=. THEN isClinical=0;
		if profession="Medicine" AND discipline="Internal/Family" AND subdiscipline=. THEN isClinical=1;
		if profession="Medicine" AND discipline="Other: __________" AND subdiscipline=. THEN isClinical=1;
		if profession="Medicine" AND discipline="Psychiatry" AND subdiscipline=. THEN isClinical=1;
		if profession="None" AND discipline="None" AND subdiscipline="None" THEN isClinical=0;
		if profession="Nursing" AND discipline="CNS" AND subdiscipline="Adult Gerontolgy" THEN isClinical=1;
		if profession="Nursing" AND discipline="CNS" AND subdiscipline="Other: ______" THEN isClinical=1;
		if profession="Nursing" AND discipline="CNS" AND subdiscipline="Psych/Mental Health" THEN isClinical=1;
		if profession="Nursing" AND discipline="NP" AND subdiscipline="Adult" THEN isClinical=1;
		if profession="Nursing" AND discipline="NP" AND subdiscipline="Adult Gerontolgy" THEN isClinical=1;
		if profession="Nursing" AND discipline="NP" AND subdiscipline="Family" THEN isClinical=1;
		if profession="Nursing" AND discipline="NP" AND subdiscipline="Other: ______" THEN isClinical=1;
		if profession="Nursing" AND discipline="Nurse Asst/PCA" AND subdiscipline=. THEN isClinical=1;
		if profession="Nursing" AND discipline="PHN" AND subdiscipline=. THEN isClinical=1;
		if profession="Nursing" AND discipline="RN" AND subdiscipline=. THEN isClinical=1;
		if profession="Other" AND discipline="Administration" AND subdiscipline=. THEN isClinical=0;
		if profession="Other" AND discipline="First Responder" AND subdiscipline="EMT" THEN isClinical=0;
		if profession="Other" AND discipline="First Responder" AND subdiscipline="Police" THEN isClinical=0;
		if profession="Other" AND discipline="Lay/Family/Volunteer Caregiver" AND subdiscipline=. THEN isClinical=0;
		if profession="Other" AND discipline="Other: __________" AND subdiscipline=. THEN isClinical=0;
		if profession="Other" AND discipline="Pharmacy" AND subdiscipline=. THEN isClinical=1;
		if profession="Other" AND discipline="Physician Asst. (PA)" AND subdiscipline=. THEN isClinical=1;
		if profession="Other" AND discipline="Social Services" AND subdiscipline=. THEN isClinical=0;
		if agency="Little Brothers" THEN isClinical=0;



	/*Create practitioner participant type variable based on descriptive	*/
	/*categorization from research team.									*/
	practitionerType="Not provided";
		if audienceType="DAAS-ADRC" then practitionerType="DAAS";
		if audienceType="DAAS-Quarterly" then practitionerType="DAAS";
		if audienceType="DAAS-Staff" then practitionerType="DAAS";
		if audienceType="First Responders-SFPD" then practitionerType="SFPD";
		if audienceType="LBFE-Volunteers/Staff" then practitionerType="LBFE";
		if audienceType="SF-Community" then practitionerType="Community";
		if audienceType="TBD" then practitionerType="Other             ";
		if audienceType="UCSF-Admin" then practitionerType="UCSF Admin";
		if audienceType="Kaiser-DSPs" then practitionerType="Kaiser";
		if audienceType="SFHN-DSPs" then practitionerType="SFHN";
		if audienceType="SFHN-DSPs-Case Conference" then practitionerType="SFHN";
		if audienceType="SFHN-Residents" then practitionerType="SFHN Residents";
		if audienceType="UCSF/SFVAMC-Case Rounds" then practitionerType="UCSF/SFVAMC";
		if audienceType="UCSF/SFVAMC-Conference" then practitionerType="UCSF/SFVAMC";
		if audienceType="UCSF/SFVAMC-Core" then practitionerType="UCSF/SFVAMC";
		if audienceType="UCSF/SFVAMC-EdPACT" then practitionerType="UCSF/SFVAMC";
		if audienceType="UCSF/SFVAMC-R2/R3" then practitionerType="UCSF/SFVAMC Residents";
		if audienceType="UCSF-AWV" then practitionerType="UCSF";
		if audienceType="UCSF-Faculty" then practitionerType="UCSF";
		if audienceType="UCSF-Home Care" then practitionerType="UCSF";
RUN;


/*------------------------------------------------------------------------------*/
/*CREATE ANALYSIS DATASETS														*/
/*Copy to analysis set*/
DATA GWEP.analysis;
	SET GWEP.preanal;
RUN;

/*Copy to analysis set with community partners excluded*/
DATA GWEP.analysisNoComm;
	SET GWEP.analysis(where=(agency<>'ADRC' AND agency<>'Little Brothers'));
RUN;



/*------------------------------------------------------------------------------*/
/*DATASET HEURISTIC QA															*/

/*Summarize preanalysis data for QA*/
proc tabulate missing data=GWEP.preanal;
	class profession discipline subdiscipline isclinical ;
	table profession*discipline*subdiscipline,isclinical;
run;

proc tabulate missing data=GWEP.preanal;
	class agency isclinical ;
	table agency,isclinical;
run;

proc means data=GWEP.preanal NMISS N;
run;

proc contents data=GWEP.preanal order=varnum;
  title 'GWEP: Baseline analysis set';
run;

/*Check data quality and summarize counts of events, etc*/
proc freq data=GWEP.preanal;
	table practitionerType;
run; 

proc freq data=GWEP.preanal;
	table isClinical;
run; 

proc freq data=GWEP.preanal(where=(isClinical=.));
	table audienceType;
run; 

proc freq data=GWEP.preanal(where=(isClinical=. AND audienceType ^= "other"));
	table event;
run; 

proc sql;
	create table GWEP.events as
	select distinct event,courseTitle,isClinical from gwep.analysis;
	select * from gwep.events;
quit;

proc freq data=GWEP.events;
	table isClinical;
run; 


/*------------------------------------------------------------------------------*/
/*DATASET HEURISTIC QA															*/
proc means data=GWEP.analysis(where=(isClinical ne .)); /*Only those who have been identified as clinical or non-clinical*/
 var cognitionPre--mentalhealthChange;
run;

proc means data=GWEP.analysis; 
	class isClinical;
	var cognitionPre--mentalhealthChange;
run;

proc ttest data=GWEP.analysis;
	class isClinical;
	var cognitionChange;
run;
proc ttest data=GWEP.analysis;
	class isClinical;
	var independenceChange;
run;
proc ttest data=GWEP.analysis;
	class isClinical;
	var safetyChange;
run;
proc ttest data=GWEP.analysis;
	class isClinical;
	var goalsChange;
run;
proc ttest data=GWEP.analysis;
	class isClinical;
	var mentalhealthChange;
run;

/* Individual question score checks */

proc means data=GWEP.analysis(where=(isClinical ne .)); /*Only those with clinical status defined*/
 var PRES_Non_medication_approaches_f--CHG__Providing_guidance_and_co0;
run;

proc means data=GWEP.analysis; 
	class isClinical;
	var PRES_Non_medication_approaches_f--CHG__Providing_guidance_and_co0;
run;

proc means data=GWEP.analysis; 
 var POSS__Roles_of_different_discipl--POSS__Providing_guidance_and_co0;
run;

proc means data=GWEP.analysis; 
 var CHG__Roles_of_different_discipl--CHG__Providing_guidance_and_co0;
run;


/*------------------*/
/*BASIC DEMOS*/
PROC TABULATE DATA=GWEP.analysis;
		title 'gender';
		CLASS gender ;
		TABLE   (n pctn)*gender="";
		;
RUN;
PROC TABULATE DATA=GWEP.analysis;
		title 'ageRange';
		CLASS ageRange ;
		TABLE  ageRange="" all;
		;
RUN;

PROC TABULATE DATA=GWEP.analysis;
		title 'race';
		CLASS race ;
		TABLE  race="" all;
		;
RUN;

/*BASIC DEMOS FOR DISADVANTAGED*/
PROC FREQ DATA=GWEP.analysis;
		title 'Rural';
		TABLE   (gender race ageRange)*isRural;
		;
RUN;

PROC FREQ DATA=GWEP.analysis;
		title 'Rural';
		TABLE   (gender race ageRange)*isDisadvantaged;
		;
RUN;
PROC FREQ DATA=GWEP.analysis;
		title 'Rural';
		TABLE   (gender race ageRange)*isVeteran;
		;
RUN;



/*CATEGORIES*/
PROC TABULATE DATA=GWEP.analysis;
		title 'discipline';
		CLASS discipline ;
		TABLE  discipline="" all;
		;
RUN;

PROC TABULATE DATA=GWEP.analysis;
		title 'profession';
		CLASS profession ;
		TABLE  profession="" all;
		;
RUN;

PROC TABULATE DATA=GWEP.analysis;
		title 'audiencetype';
		CLASS audiencetype ;
		TABLE  audiencetype="" all;
		;
RUN;


/**/
PROC TABULATE DATA=GWEP.analysis;
		title 'audienceType';
		CLASS audienceType ;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ audienceType="" all;
		;
	RUN;

PROC TABULATE DATA=GWEP.analysis;
		title 'audienceType';
		CLASS audienceType projectYear;
		var cognition;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ audienceType="" all,projectyear*cognition*mean ;
		;
	RUN;




/*------------------------------------------------------------------------------*/
/*PROTO-ANALYSIS																*/

/*Changes in Keys*/
PROC TABULATE DATA=GWEP.analysis;
		title 'Average change per Key by year';
		CLASS audienceType projectYear;
		var 
			CognitionPre
			IndependencePre
			SafetyPre
			GoalsPre
			MentalHealthPre

			CognitionChange
			IndependenceChange
			SafetyChange
			GoalsChange
			MentalHealthChange


			CognitionPost
			IndependencePost
			SafetyPost
			GoalsPost
			MentalHealthPost
;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ projectyear="" all,(mean std n) *(CognitionChange IndependenceChange SafetyChange GoalsChange MentalHealthChange );
		;
RUN;


PROC TABULATE DATA=GWEP.analysis;
		title 'Average change per Key by year';
		CLASS audienceType projectYear;
		var 
			CognitionPre
			IndependencePre
			SafetyPre
			GoalsPre
			MentalHealthPre

			CognitionPre
			IndependencePre
			SafetyPre
			GoalsPre
			MentalHealthPre


			CognitionPost
			IndependencePost
			SafetyPost
			GoalsPost
			MentalHealthPost
;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ (mean n) *((CognitionPre CognitionChange CognitionPost)(IndependencePre IndependenceChange IndependencePost));
		;
RUN;

PROC TABULATE DATA=GWEP.analysis;
		title 'Average change per Key by quarter';
		CLASS audienceType projectQuarter;
		var 
			Cognition
			Independence
			Safety
			IndividualizedGoalSetting
			MentalHealth
			;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ projectQuarter="" all,(mean std n) *(cognition independence safety IndividualizedGoalSetting MentalHealth);
		;
	RUN;


/*Changes in Keys by organizational categories*/
PROC TABULATE DATA=GWEP.analysis;
		title 'Average change per Key by HRSA program';
		CLASS hrsaprogram projectYear;
		var 
			Cognition
			Independence
			Safety
			IndividualizedGoalSetting
			MentalHealth
			;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ hrsaprogram="" all,(mean std n) *(cognition independence safety IndividualizedGoalSetting MentalHealth);
		;
RUN;

PROC TABULATE DATA=GWEP.analysis;
		title 'Average change per Key by audience type';
		CLASS hrsaprogram audiencetype;
		var 
			Cognition
			Independence
			Safety
			IndividualizedGoalSetting
			MentalHealth
			;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ audiencetype="" all,(mean std n) *(cognition independence safety IndividualizedGoalSetting MentalHealth);
		;
RUN;

PROC TABULATE DATA=GWEP.analysis;
		title 'Average change per Key by agency';
		CLASS hrsaprogram agency;
		var 
			Cognition
			Independence
			Safety
			IndividualizedGoalSetting
			MentalHealth
			;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ agency="" all,(mean std n) *(cognition independence safety IndividualizedGoalSetting MentalHealth);
		;
RUN;

/*Changes in Keys by functional categories*/

PROC TABULATE DATA=GWEP.analysis;
		title 'Average change per Key by profession type';
		CLASS hrsaprogram profession;
		var 
			Cognition
			Independence
			Safety
			IndividualizedGoalSetting
			MentalHealth
			;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ profession="" all,(mean std n) *(cognition independence safety IndividualizedGoalSetting MentalHealth);
		;
RUN;

PROC TABULATE DATA=GWEP.analysis;
		title 'Average change per Key by discipline type';
		CLASS hrsaprogram discipline;
		var 
			Cognition
			Independence
			Safety
			IndividualizedGoalSetting
			MentalHealth
			;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ discipline="" all,(mean std n)*(cognition independence safety IndividualizedGoalSetting MentalHealth)  ;
		;
RUN;

PROC TABULATE DATA=GWEP.analysis;
		title 'Average change per Key by age range';
		CLASS hrsaprogram ageRange;
		var 
			Cognition
			Independence
			Safety
			IndividualizedGoalSetting
			MentalHealth
			;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ ageRange="" all,(mean std n)*(cognition independence safety IndividualizedGoalSetting MentalHealth)  ;
		;
RUN;

/*HRSA FOCUS CATEGORIES*/
PROC TABULATE DATA=GWEP.analysis;
		title 'Average change per Key for disadvantaged';
		CLASS hrsaprogram isDisadvantaged;
		var 
			Cognition
			Independence
			Safety
			IndividualizedGoalSetting
			MentalHealth
			;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ isDisadvantaged="",(mean std n)*(cognition independence safety IndividualizedGoalSetting MentalHealth)  ;
		;
RUN;

PROC TABULATE DATA=GWEP.analysis;
		title 'Average change per Key for rural';
		CLASS hrsaprogram isRural;
		var 
			Cognition
			Independence
			Safety
			IndividualizedGoalSetting
			MentalHealth
			;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ isRural="",(mean std n)*(cognition independence safety IndividualizedGoalSetting MentalHealth)  ;
		;
RUN;

PROC TABULATE DATA=GWEP.analysis;
		title 'Average change per Key for veterans';
		CLASS hrsaprogram isVeteran;
		var 
			Cognition
			Independence
			Safety
			IndividualizedGoalSetting
			MentalHealth
			;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ isVeteran="",(mean std n)*(cognition independence safety IndividualizedGoalSetting MentalHealth)  ;
		;
RUN;


/*------------------------------------------------------------------------------*/
/*QUALITY SCORING																*/
PROC TABULATE DATA=GWEP.analysis;
		title 'Relevance of session to my work';
		CLASS projectYear;
		var 
			Relevance_of_this_session_to_my_
			;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ (mean std n)*(Relevance_of_this_session_to_my_)  ;
		;
RUN;



PROC TABULATE DATA=GWEP.analysis;
		title 'Relevance of session to my work';
		CLASS projectYear;
		var 
			Relevance_of_this_session_to_my_
			Overall_quality_of_the_session
			It_is_likely_that_I_will_make_ch
			My_patient_care_will_improve_as_
			After_completion_of_your_current
			This_training_has_made_me_more_l

			;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ 
	(
			Relevance_of_this_session_to_my_
			Overall_quality_of_the_session
			It_is_likely_that_I_will_make_ch
			My_patient_care_will_improve_as_
			After_completion_of_your_current
			This_training_has_made_me_more_l

	)  , (mean std n)
		;
RUN;


PROC TABULATE DATA=GWEP.analysis;
		title 'Relevance of session to my work - discipline';
		CLASS discipline;
		var 
			Relevance_of_this_session_to_my_
			Overall_quality_of_the_session
			It_is_likely_that_I_will_make_ch
			My_patient_care_will_improve_as_
			After_completion_of_your_current
			This_training_has_made_me_more_l

			;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ 
	(
			Relevance_of_this_session_to_my_
			Overall_quality_of_the_session
			It_is_likely_that_I_will_make_ch
			My_patient_care_will_improve_as_
			After_completion_of_your_current
			This_training_has_made_me_more_l

	)  , (mean std n)*(discipline All)
		;
RUN;


PROC TABULATE DATA=GWEP.analysis;
		title 'Relevance of session to my work - profession';
		CLASS profession;
		var 
			Relevance_of_this_session_to_my_
			Overall_quality_of_the_session
			It_is_likely_that_I_will_make_ch
			My_patient_care_will_improve_as_
			After_completion_of_your_current
			This_training_has_made_me_more_l

			;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ 
	(
			Relevance_of_this_session_to_my_
			Overall_quality_of_the_session
			It_is_likely_that_I_will_make_ch
			My_patient_care_will_improve_as_
			After_completion_of_your_current
			This_training_has_made_me_more_l

	)  , (mean std n)*(profession All)
		;
RUN;

PROC TABULATE DATA=GWEP.analysis;
		title 'Relevance of session to my work - quarter';
		CLASS projectQuarter;
		var 
			Relevance_of_this_session_to_my_
			Overall_quality_of_the_session
			It_is_likely_that_I_will_make_ch
			My_patient_care_will_improve_as_
			After_completion_of_your_current
			This_training_has_made_me_more_l

			;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ 
	(
			Relevance_of_this_session_to_my_
			Overall_quality_of_the_session
			It_is_likely_that_I_will_make_ch
			My_patient_care_will_improve_as_
			After_completion_of_your_current
			This_training_has_made_me_more_l

	)  , (mean std n)*(projectQuarter All)
		;
RUN;

PROC TABULATE DATA=GWEP.analysis;
		title 'Relevance of session to my work - projectYear';
		CLASS projectYear;
		var 
			Relevance_of_this_session_to_my_
			Overall_quality_of_the_session
			It_is_likely_that_I_will_make_ch
			My_patient_care_will_improve_as_
			After_completion_of_your_current
			This_training_has_made_me_more_l

			;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ 
	(
			Relevance_of_this_session_to_my_
			Overall_quality_of_the_session
			It_is_likely_that_I_will_make_ch
			My_patient_care_will_improve_as_
			After_completion_of_your_current
			This_training_has_made_me_more_l

	)  , (mean std n)*(projectYear All)
		;
RUN;


PROC TABULATE DATA=GWEP.analysis;
		title 'Likelihood of Change';
		CLASS 	It_is_likely_that_I_will_make_ch hrsaprogram;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ 
			It_is_likely_that_I_will_make_ch*hrsaprogram;
RUN;

PROC TABULATE DATA=GWEP.analysis;
		title 'Patient care improve';
		CLASS 	My_patient_care_will_improve_as_ hrsaprogram;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ 
			My_patient_care_will_improve_as_*hrsaprogram;
RUN;

PROC TABULATE DATA=GWEP.analysis;
		title 'Intend to work in area';
		CLASS 	After_completion_of_your_current hrsaprogram;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ 
			After_completion_of_your_current*hrsaprogram;
RUN;

PROC TABULATE DATA=GWEP.analysis;
		title 'More likely to purse work in area';
		CLASS 	This_training_has_made_me_more_l hrsaprogram;
		*FORMAT completionDate  monyy7.;
		TABLE /*genderDesc interviewLanguage*/ 
			This_training_has_made_me_more_l*hrsaprogram;
RUN;



/*------------------------------------------------------------------------------*/
/*QUESTION/SCORE OUTPUTS														*/

/*---------------------*/
/*Means for all questions*/
proc means data=GWEP.analysis; 
 var CHANGE__Roles_of_different_disci--CHANGE__Providing_guidance_and_0;
run;

proc means data=GWEP.analysis; 
 var PRE__Roles_of_different_discipli--PRE__Providing_guidance_and_com0;
run;

proc means data=GWEP.analysis; 
 var POST__Roles_of_different_discipl--POST__Providing_guidance_and_co0;
run;



/*---------------------*/
/*Means for all keys*/
proc means data=GWEP.analysis; 
 var cognitionPre--mentalhealthChange;
run;

proc means data=GWEP.analysis(where=(isClinical=0)); 
	title "Keys for non-clinical";
	var cognitionPre--mentalhealthChange;
run;

proc means data=GWEP.analysis(where=(isClinical=1)); 
	title "Keys for clinical";
	var cognitionPre--mentalhealthChange;
run;


/*Means for all keys*/
proc tabulate data=GWEP.analysis; 
	class hrsaprogram;
	var cognitionPre--mentalhealthChange;
	table hrsaprogram,(cognitionPre--mentalhealthChange)*mean;
run;

proc tabulate data=GWEP.analysis; 
	title "isClinical mean";
	class isClinical;
	var cognitionPre--mentalhealthChange;
	table isClinical="",(cognitionPre--mentalhealthChange)*(mean);
run;

proc tabulate data=GWEP.analysis; 
	title "isClinical n";
	class isClinical;
	var cognitionPre--mentalhealthChange;
	table isClinical="",(cognitionPre--mentalhealthChange)*(n);
run;

proc means data=GWEP.analysis; 
 var PRE__Roles_of_different_discipli--PRE__Providing_guidance_and_com0;
run;

proc means data=GWEP.analysis; 
 var POST__Roles_of_different_discipl--POST__Providing_guidance_and_co0;
run;