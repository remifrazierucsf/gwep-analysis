%macro ttestquick(data, var1, var2);
	proc ttest data=&data;

		PAIRED &var1*&var2;
		      ods output TTests=TTests(REPLACE=yes);
	run;

	proc print data=ttests;
	run;
	proc datasets nodetails nolist;
        delete ttests;
    quit;
%mend;

%ttestquick(GWEP.analysis,cognitionPre,cognitionPost);
%ttestquick(GWEP.analysis,independencePre,independencePost);
%ttestquick(GWEP.analysis,safetyPre,safetyPost);
%ttestquick(GWEP.analysis,goalsPre,goalsPost);
%ttestquick(GWEP.analysis,mentalhealthPre,mentalhealthPost);

