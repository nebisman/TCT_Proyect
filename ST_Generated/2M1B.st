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
		state : ARRAY [0..6] OF DINT;
		slt0 : ARRAY [0..1] OF DINT;
		FE_M1E : F_TRIG;
		FE_M2E : F_TRIG;
		FE_A : F_TRIG;
		FE_PL : F_TRIG;
		FE_PR : F_TRIG;
		INTERN_1 : BOOL;
		INTERN_2 : BOOL;
	END_VAR
	VAR
		GD_OUT_3 AT %QX100.3 : BOOL;
 		GD_OUT_0 AT %QX100.0 : BOOL;
		GD_OUT_1 AT %QX100.1 : BOOL;
		GD_IN_0 AT %IX100.0 : BOOL;
		GD_IN_1 AT %IX100.1 : BOOL;
		GD_IN_15 AT %IX100.15 : BOOL;
		GD_OUT_2 AT %QX100.2 : BOOL;
		GD_IN_2 AT %IX100.2 : BOOL;
		GD_OUT_4 AT %QX100.4 : BOOL;
		GD_IN_3 AT %IX100.3 : BOOL;
		GD_IN_4 AT %IX100.4 : BOOL;
		GD_OUT_5 AT %QX100.5 : BOOL;
		GD_OUT_6 AT %QX100.6 : BOOL;
	END_VAR
	FE_M1E(CLK:= GD_IN_0);
	FE_M2E(CLK:= GD_IN_1);
	FE_A(CLK:= GD_IN_2);
	FE_PL(CLK:= GD_IN_3);
	FE_PR(CLK:= GD_IN_4);
	random(
		IN := True,
		OUT => random_numer);
	IF state[0] = 0 & GD_IN_15 THEN
  		state[0] := 1;
  	ELSIF state[0] = 2 & FE_PL.Q THEN
  		state[0] := 3;
  	ELSIF state[0] = 4 & FE_PL.Q THEN
  		state[0] := 6;
  	ELSIF state[0] = 5 & FE_M2E.Q THEN
  		state[0] := 1;
  	ELSIF state[0] = 7 & FE_M2E.Q THEN
  		state[0] := 2;
  	ELSIF state[0] = 7 & FE_PL.Q THEN
  		state[0] := 8;
  	ELSIF state[0] = 8 & FE_M2E.Q THEN
  		state[0] := 3;
  	ELSIF state[0] = 9 & FE_M2E.Q THEN
  		state[0] := 4;
  	ELSIF state[0] = 9 & FE_PL.Q THEN
  		state[0] := 10;
  	ELSIF state[0] = 10 & FE_M2E.Q THEN
  		state[0] := 6;
  	END_IF;

	IF state[1] = 0 & GD_OUT_0 THEN
  		state[1] := 1;
  	ELSIF state[1] = 1 & GD_IN_0 THEN
  		state[1] := 2;
  	ELSIF state[1] = 3 & FE_M1E.Q THEN
  		state[1] := 0;
  	END_IF;

	IF state[2] = 0 & GD_IN_15 THEN
  		state[2] := 1;
  	ELSIF state[2] = 2 & FE_A.Q THEN
  		state[2] := 3;
  	ELSIF state[2] = 4 & FE_M1E.Q THEN
  		state[2] := 1;
  	END_IF;

	IF state[3] = 0 & GD_IN_0 THEN
  		state[3] := 1;
  	ELSIF state[3] = 1 & FE_M1E.Q THEN
  		state[3] := 2;
  	ELSIF state[3] = 3 & FE_PL.Q THEN
  		state[3] := 4;
  	END_IF;

	IF state[4] = 0 & FE_M1E.Q THEN
  		state[4] := 1;
  	ELSIF state[4] = 2 & FE_PR.Q THEN
  		state[4] := 3;
  	ELSIF state[4] = 4 & FE_M2E.Q THEN
  		state[4] := 1;
  	ELSIF state[4] = 6 & FE_M2E.Q THEN
  		state[4] := 1;
  	ELSIF state[4] = 4 & FE_M1E.Q THEN
  		state[4] := 5;
  	ELSIF state[4] = 6 & FE_PL.Q THEN
  		state[4] := 7;
  	END_IF;

	IF state[5] = 0 & FE_M2E.Q THEN
  		state[5] := 1;
  	ELSIF state[5] = 2 & FE_PR.Q THEN
  		state[5] := 3;
  	END_IF;


	CASE state[0] OF
  		1:
  			INTERN_1 := 1;
		3:
  			CASE slt0[0] OF
  				0:
  					INTERN_1 := 1;
  				1:
  					INTERN_2 := 1;
  			END_CASE;
  			slt0[0] := (random_numer + slt0[0]) MOD 2;
  			random_numer := random_numer - slt0[0];
 		4:
  			INTERN_2 := 1;
		5:
  			INTERN_1 := 1;
		6:
  			INTERN_2 := 1;
		8:
  			INTERN_1 := 1;
	END_CASE;

	CASE state[1] OF
  		2:
  			GD_OUT_0 := 0;
  	END_CASE;

	CASE state[2] OF
  		1:
  			GD_OUT_2 := 1;
		3:
  			GD_OUT_2 := 0;
  	END_CASE;

	CASE state[3] OF
  		2:
  			GD_OUT_5 := 1;
		4:
  			GD_OUT_5 := 0;
  	END_CASE;

	CASE state[4] OF
  		1:
  			GD_OUT_4 := 1;
		3:
  			GD_OUT_4 := 0;
  		5:
  			GD_OUT_4 := 1;
		7:
  			GD_OUT_4 := 0;
  	END_CASE;

	CASE state[5] OF
  		1:
  			GD_OUT_6 := 0;
  		3:
  			GD_OUT_6 := 1;
	END_CASE;
	IF state[0] = 1 & INTERN_1 THEN
  		state[0] := 2;
  	ELSIF state[0] = 3 & INTERN_1 THEN
  		state[0] := 4;
  	ELSIF state[0] = 3 & INTERN_2 THEN
  		state[0] := 5;
  	ELSIF state[0] = 4 & INTERN_2 THEN
  		state[0] := 7;
  	ELSIF state[0] = 5 & INTERN_1 THEN
  		state[0] := 7;
  	ELSIF state[0] = 6 & INTERN_2 THEN
  		state[0] := 8;
  	ELSIF state[0] = 8 & INTERN_1 THEN
  		state[0] := 9;
  	END_IF;

	IF state[1] = 2 & NOT GD_OUT_0 THEN
  		state[1] := 3;
  	END_IF;

	IF state[2] = 1 & GD_OUT_2 THEN
  		state[2] := 2;
  	ELSIF state[2] = 3 & NOT GD_OUT_2 THEN
  		state[2] := 4;
  	END_IF;

	IF state[3] = 2 & GD_OUT_5 THEN
  		state[3] := 3;
  	ELSIF state[3] = 4 & NOT GD_OUT_5 THEN
  		state[3] := 0;
  	END_IF;

	IF state[4] = 1 & GD_OUT_4 THEN
  		state[4] := 2;
  	ELSIF state[4] = 3 & NOT GD_OUT_4 THEN
  		state[4] := 4;
  	ELSIF state[4] = 5 & GD_OUT_4 THEN
  		state[4] := 6;
  	ELSIF state[4] = 7 & NOT GD_OUT_4 THEN
  		state[4] := 4;
  	END_IF;

	IF state[5] = 1 & NOT GD_OUT_6 THEN
  		state[5] := 2;
  	ELSIF state[5] = 3 & GD_OUT_6 THEN
  		state[5] := 0;
  	END_IF;

	GD_OUT_3 := GD_OUT_2;
 	IF NOT GD_OUT_0 & INTERN_1 THEN
		GD_OUT_0 := 1;
	ELSIF GD_OUT_0 & INTERN_1 THEN
		INTERN_1 := 0;
	END_IF;

END_PROGRAM

CONFIGURATION Config0

	RESOURCE Res0 ON PLC
		TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
		PROGRAM instance0 WITH task0 : tesis0;
	END_RESOURCE
END_CONFIGURATION