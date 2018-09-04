PROC TABULATE DATA=GWEP.modanal(where=(cognitionChange=. AND independenceChange=. AND safetyChange=. AND goalsChange=. AND mentalhealthChange=.));
	CLASS event isclinical;
	TABLES event,isClinical;
RUN;

PROC TABULATE DATA=GWEP.modanal(where=(cognition^=. OR independence^=. OR safety^=. OR goals^=. OR mentalhealth^=.));
	CLASS event isclinical;
	TABLES event,isClinical;
RUN;


