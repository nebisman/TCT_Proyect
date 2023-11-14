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
		state : ARRAY [0..5] OF DINT;
		RE_M1 : R_TRIG;
		FE_M2E : F_TRIG;
		FE_PO : F_TRIG;
		FE_PR : F_TRIG;
		FE_CP : F_TRIG;
		RE_CP : R_TRIG;
		FE_M1 : F_TRIG;
		FE_B1 : F_TRIG;
		FE_B1O : F_TRIG;
	END_VAR
	VAR
		GD_OUT_1 AT %QX100.1 : BOOL;
 		GD_OUT_2 AT %QX100.2 : BOOL;
 		GD_OUT_3 AT %QX100.3 : BOOL;
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
		GD_OUT_11 AT %QX100.11 : BOOL;
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
	IF state[0] = 0 & GD_IN_0 THEN
  		state[0] := 1;
  	ELSIF state[0] = 0 & FE_M1.Q THEN
  		state[0] := 2;
  	ELSIF state[0] = 1 & FE_M1.Q THEN
  		state[0] := 4;
  	ELSIF state[0] = 2 & GD_IN_0 THEN
  		state[0] := 4;
  	ELSIF state[0] = 3 & FE_M1.Q THEN
  		state[0] := 5;
  	END_IF;

	IF state[1] = 0 & RE_M1.Q THEN
  		state[1] := 1;
  	ELSIF state[1] = 2 & FE_B1.Q THEN
  		state[1] := 3;
  	ELSIF state[1] = 2 & FE_B1O.Q THEN
  		state[1] := 4;
  	ELSIF state[1] = 3 & FE_B1O.Q THEN
  		state[1] := 5;
  	ELSIF state[1] = 4 & FE_B1.Q THEN
  		state[1] := 5;
  	ELSIF state[1] = 4 & RE_M1.Q THEN
  		state[1] := 7;
  	ELSIF state[1] = 5 & RE_M1.Q THEN
  		state[1] := 8;
  	ELSIF state[1] = 6 & FE_B1O.Q THEN
  		state[1] := 9;
  	ELSIF state[1] = 7 & FE_B1.Q THEN
  		state[1] := 8;
  	ELSIF state[1] = 9 & RE_M1.Q THEN
  		state[1] := 11;
  	ELSIF state[1] = 10 & GD_IN_2 THEN
  		state[1] := 13;
  	ELSIF state[1] = 10 & FE_B1O.Q THEN
  		state[1] := 12;
  	ELSIF state[1] = 12 & GD_IN_2 THEN
  		state[1] := 15;
  	ELSIF state[1] = 12 & RE_M1.Q THEN
  		state[1] := 14;
  	ELSIF state[1] = 13 & FE_B1O.Q THEN
  		state[1] := 15;
  	ELSIF state[1] = 14 & GD_IN_2 THEN
  		state[1] := 17;
  	ELSIF state[1] = 15 & RE_M1.Q THEN
  		state[1] := 17;
  	ELSIF state[1] = 16 & FE_B1O.Q THEN
  		state[1] := 18;
  	ELSIF state[1] = 18 & RE_M1.Q THEN
  		state[1] := 20;
  	ELSIF state[1] = 19 & FE_B1O.Q THEN
  		state[1] := 21;
  	ELSIF state[1] = 21 & RE_M1.Q THEN
  		state[1] := 23;
  	ELSIF state[1] = 22 & FE_B1O.Q THEN
  		state[1] := 24;
  	ELSIF state[1] = 24 & RE_M1.Q THEN
  		state[1] := 26;
  	ELSIF state[1] = 25 & FE_B1O.Q THEN
  		state[1] := 27;
  	ELSIF state[1] = 27 & RE_M1.Q THEN
  		state[1] := 28;
  	ELSIF state[1] = 29 & RE_M1.Q THEN
  		state[1] := 30;
  	ELSIF state[1] = 31 & RE_M1.Q THEN
  		state[1] := 32;
  	END_IF;

	IF state[2] = 0 & FE_B1O.Q THEN
  		state[2] := 1;
  	ELSIF state[2] = 2 & FE_B1O.Q THEN
  		state[2] := 3;
  	ELSIF state[2] = 2 & GD_IN_6 THEN
  		state[2] := 4;
  	ELSIF state[2] = 3 & GD_IN_6 THEN
  		state[2] := 5;
  	ELSIF state[2] = 4 & FE_B1O.Q THEN
  		state[2] := 5;
  	ELSIF state[2] = 6 & FE_B1O.Q THEN
  		state[2] := 7;
  	ELSIF state[2] = 6 & FE_M2E.Q THEN
  		state[2] := 0;
  	ELSIF state[2] = 7 & FE_M2E.Q THEN
  		state[2] := 1;
  	END_IF;

	IF state[3] = 0 & FE_M2E.Q THEN
  		state[3] := 1;
  	ELSIF state[3] = 2 & RE_CP.Q THEN
  		state[3] := 3;
  	END_IF;

	IF state[4] = 0 & RE_CP.Q THEN
  		state[4] := 1;
  	ELSIF state[4] = 2 & FE_CP.Q THEN
  		state[4] := 3;
  	ELSIF state[4] = 3 & GD_IN_8 THEN
  		state[4] := 4;
  	ELSIF state[4] = 3 & NOT GD_IN_8 THEN
  		state[4] := 5;
  	ELSIF state[4] = 4 & FE_PO.Q THEN
  		state[4] := 6;
  	ELSIF state[4] = 8 & FE_PR.Q THEN
  		state[4] := 9;
  	END_IF;


	CASE state[0] OF
  		1:
  			GD_OUT_0 := 1;
		4:
  			GD_OUT_0 := 1;
		5:
  			GD_OUT_0 := 0;
  	END_CASE;

	CASE state[1] OF
  		1:
  			GD_OUT_5 := 1;
		3:
  			GD_OUT_5 := 0;
  		5:
  			GD_OUT_5 := 0;
  		6:
  			GD_OUT_4 := 1;
		8:
  			GD_OUT_5 := 0;
  		9:
  			GD_OUT_4 := 1;
		11:
  			GD_OUT_4 := 1;
		13:
  			GD_OUT_4 := 0;
  		15:
  			GD_OUT_4 := 0;
  		16:
  			GD_OUT_6 := 1;
		17:
  			GD_OUT_4 := 0;
  		18:
  			GD_OUT_6 := 1;
		19:
  			GD_IN_4 := 1;
		20:
  			GD_OUT_6 := 1;
		21:
  			GD_IN_4 := 1;
		22:
  			GD_OUT_5 := 1;
		23:
  			GD_IN_4 := 1;
		26:
  			GD_OUT_5 := 1;
		27:
  			GD_OUT_5 := 0;
  		28:
  			GD_OUT_5 := 0;
  		29:
  			GD_OUT_6 := 0;
  		30:
  			GD_OUT_6 := 0;
  		31:
  			GD_IN_4 := 1;
		32:
  			GD_IN_4 := 1;
	END_CASE;

	CASE state[2] OF
  		1:
  			GD_OUT_7 := 1;
		4:
  			GD_OUT_7 := 0;
  		5:
  			GD_OUT_7 := 0;
  	END_CASE;

	CASE state[3] OF
  		1:
  			GD_OUT_8 := 1;
		3:
  			GD_OUT_8 := 0;
  	END_CASE;

	CASE state[4] OF
  		1:
  			GD_OUT_9 := 1;
		5:
  			GD_OUT_10 := 1;
		6:
  			GD_OUT_9 := 0;
  		7:
  			GD_OUT_11 := 1;
		9:
  			GD_OUT_11 := 0;
  		10:
  			GD_OUT_10 := 0;
  		11:
  			GD_OUT_9 := 0;
  	END_CASE;
	IF state[0] = 1 & GD_OUT_0 THEN
  		state[0] := 3;
  	ELSIF state[0] = 4 & GD_OUT_0 THEN
  		state[0] := 5;
  	ELSIF state[0] = 5 & NOT GD_OUT_0 THEN
  		state[0] := 0;
  	END_IF;
	IF state[1] = 1 & GD_OUT_5 THEN
  		state[1] := 2;
  	ELSIF state[1] = 3 & NOT GD_OUT_5 THEN
  		state[1] := 6;
  	ELSIF state[1] = 5 & NOT GD_OUT_5 THEN
  		state[1] := 9;
  	ELSIF state[1] = 6 & GD_OUT_4 THEN
  		state[1] := 10;
  	ELSIF state[1] = 8 & NOT GD_OUT_5 THEN
  		state[1] := 11;
  	ELSIF state[1] = 9 & GD_OUT_4 THEN
  		state[1] := 12;
  	ELSIF state[1] = 11 & GD_OUT_4 THEN
  		state[1] := 14;
  	ELSIF state[1] = 13 & NOT GD_OUT_4 THEN
  		state[1] := 16;
  	ELSIF state[1] = 15 & NOT GD_OUT_4 THEN
  		state[1] := 18;
  	ELSIF state[1] = 16 & GD_OUT_6 THEN
  		state[1] := 19;
  	ELSIF state[1] = 17 & NOT GD_OUT_4 THEN
  		state[1] := 20;
  	ELSIF state[1] = 18 & GD_OUT_6 THEN
  		state[1] := 21;
  	ELSIF state[1] = 19 & GD_IN_4 THEN
  		state[1] := 22;
  	ELSIF state[1] = 20 & GD_OUT_6 THEN
  		state[1] := 23;
  	ELSIF state[1] = 21 & GD_IN_4 THEN
  		state[1] := 24;
  	ELSIF state[1] = 22 & GD_OUT_5 THEN
  		state[1] := 25;
  	ELSIF state[1] = 23 & GD_IN_4 THEN
  		state[1] := 26;
  	ELSIF state[1] = 26 & GD_OUT_5 THEN
  		state[1] := 25;
  	ELSIF state[1] = 27 & NOT GD_OUT_5 THEN
  		state[1] := 29;
  	ELSIF state[1] = 28 & NOT GD_OUT_5 THEN
  		state[1] := 30;
  	ELSIF state[1] = 29 & NOT GD_OUT_6 THEN
  		state[1] := 31;
  	ELSIF state[1] = 30 & NOT GD_OUT_6 THEN
  		state[1] := 32;
  	ELSIF state[1] = 31 & GD_IN_4 THEN
  		state[1] := 0;
  	ELSIF state[1] = 32 & GD_IN_4 THEN
  		state[1] := 1;
  	END_IF;
	IF state[2] = 1 & GD_OUT_7 THEN
  		state[2] := 2;
  	ELSIF state[2] = 4 & NOT GD_OUT_7 THEN
  		state[2] := 6;
  	ELSIF state[2] = 5 & NOT GD_OUT_7 THEN
  		state[2] := 7;
  	END_IF;
	IF state[3] = 1 & GD_OUT_8 THEN
  		state[3] := 2;
  	ELSIF state[3] = 3 & NOT GD_OUT_8 THEN
  		state[3] := 0;
  	END_IF;
	IF state[4] = 1 & GD_OUT_9 THEN
  		state[4] := 2;
  	ELSIF state[4] = 5 & GD_OUT_10 THEN
  		state[4] := 7;
  	ELSIF state[4] = 6 & NOT GD_OUT_9 THEN
  		state[4] := 0;
  	ELSIF state[4] = 7 & GD_OUT_11 THEN
  		state[4] := 8;
  	ELSIF state[4] = 9 & NOT GD_OUT_11 THEN
  		state[4] := 10;
  	ELSIF state[4] = 10 & NOT GD_OUT_10 THEN
  		state[4] := 11;
  	ELSIF state[4] = 11 & NOT GD_OUT_9 THEN
  		state[4] := 0;
  	END_IF;
	GD_OUT_1 := GD_OUT_0;
 	GD_OUT_2 := GD_OUT_0;
 	GD_OUT_3 := GD_OUT_0;
 
END_PROGRAM

CONFIGURATION Config0

	RESOURCE Res0 ON PLC
		TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
		PROGRAM instance0 WITH task0 : tesis0;
	END_RESOURCE
END_CONFIGURATION