FUNCTION_BLOCK random_number
	VAR_INPUT
		IN : BOOL;
	END_VAR
	VAR
		M : BOOL;
		INIT : BOOL;
	END_VAR
	VAR_OUTPUT
		OUT : DINT;
	END_VAR

	IF INIT = 0 THEN
		{#include <stdio.h>}
		{#include <stdlib.h>}
		IN := 1;
	END_IF;
	IF M = 0 and IN = 1 THEN
		{SetFbVar(OUT,rand())}
	END_IF;
END_FUNCTION_BLOCK
PROGRAM tesis0
	VAR
		random : random_number;
		random_numer : DINT;
		state :ARRAY [0..1] OF DINT;
		RE_M1 : R_TRIG;
		FE_M2E : F_TRIG;
		FE_PO : F_TRIG;
		FE_PR : F_TRIG;
		FE_CP : F_TRIG;
		RE_CP : R_TRIG;
		FE_M1 : F_TRIG;
		FE_B1 : F_TRIG;
		FE_B1O : F_TRIG;
		INTERN_1 : BOOL;
		INTERN_3 : BOOL;
		INTERN_5 : BOOL;
	END_VAR
	VAR
		GD_IN_0 AT %IX100.0 : BOOL;
		GD_IN_1 AT %IX100.1 : BOOL;
		GD_IN_6 AT %IX100.6 : BOOL;
		GD_IN_9 AT %IX100.9 : BOOL;
		GD_IN_10 AT %IX100.10 : BOOL;
		GD_OUT_7 AT %QX100.7 : BOOL;
		GD_IN_7 AT %IX100.7 : BOOL;
		GD_OUT_0 AT %QX100.0 : BOOL;
		GD_OUT_4 AT %QX100.4 : BOOL;
		GD_IN_2 AT %IX100.2 : BOOL;
		GD_IN_3 AT %IX100.3 : BOOL;
		GD_OUT_5 AT %QX100.5 : BOOL;
		GD_OUT_6 AT %QX100.6 : BOOL;
		GD_IN_4 AT %IX100.4 : BOOL;
		GD_IN_5 AT %IX100.5 : BOOL;
		GD_OUT_8 AT %QX100.8 : BOOL;
		GD_OUT_9 AT %QX100.9 : BOOL;
		GD_OUT_10 AT %QX100.10 : BOOL;
		GD_IN_8 AT %IX100.8 : BOOL;
	END_VAR
	RE_M1(CLK:= GD_IN_1);
	FE_M2E(CLK:= GD_IN_6);
	FE_PO(CLK:= GD_IN_9);
	FE_PR(CLK:= GD_IN_10);
	FE_CP(CLK:= GD_IN_7);
	RE_CP(CLK:= GD_IN_7);
	FE_M1(CLK:= GD_IN_1);
	FE_B1(CLK:= GD_IN_3);
	FE_B1O(CLK:= GD_IN_5);
	random(
		IN := True,
		OUT => random_numer);
	IF state[0] = 0 & RE_CP.Q THEN
  		state[0] := 1;
  		GD_OUT_9 := 1;
  	ELSIF state[0] = 2 & RE_CP.Q THEN
  		state[0] := 3;
  	END_IF;

	CASE state[0] OF
  		1:
  			GD_OUT_8 := 1;
		3:
  			GD_OUT_8 := 0;
  	END_CASE;
	IF state[0] = 1 & GD_OUT_8 THEN
  		state[0] := 2;
  	ELSIF state[0] = 3 & NOT GD_OUT_8 THEN
  		state[0] := 0;
  	END_IF;


END_PROGRAM

CONFIGURATION Config0

	RESOURCE Res0 ON PLC
		TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
		PROGRAM instance0 WITH task0 : tesis0;
	END_RESOURCE
END_CONFIGURATION