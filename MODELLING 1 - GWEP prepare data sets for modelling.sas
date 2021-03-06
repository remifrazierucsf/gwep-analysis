 
DATA pre;
	SET GWEP.analysis;
	timepoint=1;
	KNOW_Non_medication_approaches_f=PRES_Non_medication_approaches_f;
	KNOW_Problematic_medications_and=PRES_Problematic_medications_and;
	KNOW_Using_cognitive_screening_t=PRES_Using_cognitive_screening_t;
	KNOW_How_to_distinguish_between_=PRES_How_to_distinguish_between_;
	KNOW_How_to_assess_activities_of=PRES_How_to_assess_activities_of;
	KNOW_Screening_for_sensory_impai=PRES_Screening_for_sensory_impai;
	KNOW_How_to_implement_appropriat=PRES_How_to_implement_appropriat;
	KNOW_How_to_recognize_elder_abus=PRES_How_to_recognize_elder_abus;
	KNOW_How_to_implement_appropria0=PRES_How_to_implement_appropria0;
	KNOW_How_to_report_elder_abuse_o=PRES_How_to_report_elder_abuse_o;
	KNOW_Scope_of_care_models_for_ol=PRES_Scope_of_care_models_for_ol;
	KNOW_When_to_utilize_emergency_s=PRES_When_to_utilize_emergency_s;
	KNOW_How_to_engage_older_adults_=PRES_How_to_engage_older_adults_;
	KNOW_How_to_engage_older_adults0=PRES_How_to_engage_older_adults0;
	KNOW_Using_prognostication_tools=PRES_Using_prognostication_tools;
	KNOW_How_to_promote_age__and_pro=PRES_How_to_promote_age__and_pro;
	KNOW_Screening_for_social_isolat=PRES_Screening_for_social_isolat;
	KNOW_Screening_for_common_mental=PRES_Screening_for_common_mental;
	KNOW_How_to_recognize_caregiver_=PRES_How_to_recognize_caregiver_;
	KNOW_How_to_address_substance_an=PRES_How_to_address_substance_an;
	KNOW_Providing_guidance_and_comm=PRES_Providing_guidance_and_comm;
	KNOW_Providing_guidance_and_com0=PRES_Providing_guidance_and_com0;
	Cognition=cognitionPre;
	Independence=independencePre;
	Safety=safetyPre;
	Goals=goalsPre;
	Mentalhealth=mentalhealthPre;

RUN;
DATA post;
	SET GWEP.analysis;
	timepoint=2;
	KNOW_Non_medication_approaches_f=POSS__Non_medication_approaches_;
	KNOW_Problematic_medications_and=POSS__Problematic_medications_an;
	KNOW_Using_cognitive_screening_t=POSS__Using_cognitive_screening_;
	KNOW_How_to_distinguish_between_=POSS__How_to_distinguish_between;
	KNOW_How_to_assess_activities_of=POSS__How_to_assess_activities_o;
	KNOW_Screening_for_sensory_impai=POSS__Screening_for_sensory_impa;
	KNOW_How_to_implement_appropriat=POSS__How_to_implement_appropria;
	KNOW_How_to_recognize_elder_abus=POSS__How_to_recognize_elder_abu;
	KNOW_How_to_implement_appropria0=POSS__How_to_implement_appropri0;
	KNOW_How_to_report_elder_abuse_o=POSS__How_to_report_elder_abuse_;
	KNOW_Scope_of_care_models_for_ol=POSS__Scope_of_care_models_for_o;
	KNOW_When_to_utilize_emergency_s=POSS__When_to_utilize_emergency_;
	KNOW_How_to_engage_older_adults_=POSS__How_to_engage_older_adults;
	KNOW_How_to_engage_older_adults0=POSS__How_to_engage_older_adult0;
	KNOW_Using_prognostication_tools=POSS__Using_prognostication_tool;
	KNOW_How_to_promote_age__and_pro=POSS__How_to_promote_age__and_pr;
	KNOW_Screening_for_social_isolat=POSS__Screening_for_social_isola;
	KNOW_Screening_for_common_mental=POSS__Screening_for_common_menta;
	KNOW_How_to_recognize_caregiver_=POSS__How_to_recognize_caregiver;
	KNOW_How_to_address_substance_an=POSS__How_to_address_substance_a;
	KNOW_Providing_guidance_and_comm=POSS__Providing_guidance_and_com;
	KNOW_Providing_guidance_and_com0=POSS__Providing_guidance_and_co0;
	Cognition=cognitionPost;
	Independence=independencePost;
	Safety=safetyPost;
	Goals=goalsPost;
	Mentalhealth=mentalhealthPost;

RUN;
DATA GWEP.modanal;
	SET pre post;
RUN;



