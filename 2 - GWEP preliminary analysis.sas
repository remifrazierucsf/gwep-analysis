

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
