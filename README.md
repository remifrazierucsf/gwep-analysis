# gwep-analysis
UCSF Geriatric Workforce Enhancement Program data set preparation and initial analysis.  Unsupported, prototype-quality SAS code for initial data set treatment and examination for publication and dissemination.


**REDCap project build scripts:**

*_GWEPTrainingEventOverview_DataDictionary.csv_*

		GWEP Training Event Overview system project data dictionary file (suitable for quick builds in REDCap or data dictionary review)

*GWEPTrainingEvaluationPlatform_DataDictionary.csv*
	
		GWEP Training Evaluation Platform system project data dictionary file (suitable for quick builds in REDCap or data dictionary review)

*GWEPTrainingEventOverview.REDCap.xml*
	
		GWEP Training Event Overview system CDISC ODM formatted project metadata file (suitable for complete system builds or standing system up on other CDISC systems)

*GWEPTrainingEvaluationPlatform.REDCap.xml*

		GWEP Training Evaluation Platform system CDISC ODM formatted project metadata file (suitable for complete system builds or standing system up on other CDISC systems)


**Source data set:**

*OAC export spreadsheet TEMPLATE.xlsx*
	 
		Contains tables and lookups for transforming coded output data from multiple GWEP data systems (*GWEP Training Event Overview* and *GWEP training evaluation platform* in REDCap into a single, denormalized human-readable output.  CSV exports should be taken from each of these systems and loaded into the matching worksheet in the Excel file, and then the *OUTPUT DATA* tab should be converted into a SAS file using StatTransfer, delivering the final file as *preanal.sas7bdat*.


**Main code thread:**

*1 - GWEP data definition.sas*
  
		  Contains code code for transforming output of OAC Export spreadsheet into analysis-ready data set in SAS.  Anticipates a correctly formatted SAS input file, which has likely been converted from XLSX to SAS7BDAT using StatTransfer.  Includes some heuristic data QA tabulations and PROC MEANs.
      
*2 - GWEP preliminary analysis.sas*
  
		Contains simple analysis code for individual questions, combined question ("key") scales, event quality scores, and classification of these three areas around rough guesses about clinical/non-clinical typologies and practitioner types.
      
*3 - GWEP t-tests for each scale.sas*
  
		Contains a simple t-test macro and t-tests for each combined question ("key") scale pre- and post- values with output including p-values.
      
      
**Modelling code:**

*MODELLING 1 - GWEP prepare data sets for modelling.sas*
  
		Produces model-ready data sets based on analysis data sets constructed in the main code thread.
    
*MODELLING 2 - GWEP MODEL.sas*
  
		Contains macros for two simple general estimating models suitable for pre-/post- scales, as well as variants of each model compatible with the SAS output delivery system to expedite automated output for streamlined chart/table production.

    
