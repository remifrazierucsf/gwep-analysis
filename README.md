# gwep-analysis
UCSF Geriatric Workforce Enhancement Program data set preparation and initial analysis.  Prototype-quality SAS code for initial data set treatment and examination for publication and dissemination.

Main code thread:
  *1 - GWEP data definition.sas*
      Contains code code for transforming output of OAC Export spreadsheet into analysis-ready data set in SAS.  Anticipates a correctly formatted SAS input file, which has likely been converted from XLSX to SAS7BDAT using StatTransfer.  Includes some heuristic data QA tabulations and PROC MEANs.
  *2 - GWEP preliminary analysis.sas*
      Contains simple analysis code for individual questions, combined question ("key") scales, event quality scores, and classification of these three areas around rough guesses about clinical/non-clinical typologies and practitioner types.
  *3 - GWEP t-tests for each scale.sas*
      Contains a simple t-test macro and t-tests for each combined question ("key") scale pre- and post- values with output including p-values.
      
Modelling code:
  *MODELLING 1 - GWEP prepare data sets for modelling.sas*
    Produces model-ready data sets based on analysis data sets constructed in the main code thread.
  *MODELLING 2 - GWEP MODEL.sas*
    Contains macros for two simple general estimating models suitable for pre-/post- scales, as well as variants of each model compatible with the SAS output delivery system to expedite automated output for streamlined chart/table production.

    
