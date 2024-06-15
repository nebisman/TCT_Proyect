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
		random_num : DINT;
		state : ARRAY [0..5] OF DINT;
		slt2 : ARRAY [0..4] OF DINT;
		GD_OUT_5_G : ARRAY [0..3] OF BOOL;
		FE_LaP : F_TRIG;
		FE_BaP : F_TRIG;
		FE_PaL : F_TRIG;
		FE_Zag : F_TRIG;
		FE_Xag : F_TRIG;
	END_VAR
	VAR
		GD_OUT_12 AT %QX101.2 : BOOL;
 		GD_OUT_13 AT %QX101.3 : BOOL;
 		GD_OUT_2 AT %QX100.2 : BOOL;
		GD_OUT_3 AT %QX100.3 : BOOL;
		GD_OUT_4 AT %QX100.4 : BOOL;
		GD_OUT_5 AT %QX100.5 : BOOL;
		GD_OUT_6 AT %QX100.6 : BOOL;
		GD_OUT_7 AT %QX100.7 : BOOL;
		GD_OUT_8 AT %QX101.0 : BOOL;
		GD_OUT_9 AT %QX101.1 : BOOL;
		GD_IN_15 AT %IX100.15 : BOOL;
		GD_IN_2 AT %IX100.2 : BOOL;
		GD_IN_4 AT %IX100.4 : BOOL;
		GD_IN_3 AT %IX100.3 : BOOL;
		GD_IN_9 AT %IX101.1 : BOOL;
		GD_IN_5 AT %IX100.5 : BOOL;
		GD_IN_6 AT %IX100.6 : BOOL;
		GD_IN_7 AT %IX100.7 : BOOL;
		GD_IN_8 AT %IX101.0 : BOOL;
		GD_IN_10 AT %IX102.5 : BOOL;
		GD_IN_11 AT %IX102.6 : BOOL;
	END_VAR
	FE_LaP(CLK:= GD_IN_2);
	FE_BaP(CLK:= GD_IN_3);
	FE_PaL(CLK:= GD_IN_9);
	FE_Zag(CLK:= GD_IN_6);
	FE_Xag(CLK:= GD_IN_7);
	random(
		IN := True,
		OUT => random_num);
	IF state[0] = 0 & GD_IN_15 THEN
  		state[0] := 1;
  	ELSIF state[0] = 2 & GD_IN_15 THEN
  		state[0] := 3;
  	END_IF;



	IF state[3] = 0 & GD_IN_15 THEN
  		state[3] := 1;
  	ELSIF state[3] = 2 & GD_IN_15 THEN
  		state[3] := 3;
  	END_IF;



	CASE state[0] OF
  		0:
  			GD_OUT_4 := 1;
		1:
  			GD_OUT_4 := 1;
		2:
  			GD_OUT_4 := 0;
  		3:
  			GD_OUT_4 := 0;
  	END_CASE;

	CASE state[1] OF
  	END_CASE;

	CASE state[2] OF
  		0:
  			CASE slt2[0] OF
  				0:
  					GD_OUT_7 := 1;
  				1:
  					FE_Xag := 1;
  				2:
  					GD_OUT_5_G[0] := 1;
  			END_CASE;
  			slt2[0] := (random_num + slt2[0]) MOD 3;
  			random_num := random_num - slt2[0];
 		1:
  			CASE slt2[1] OF
  				0:
  					FE_Xag := 1;
  				1:
  					GD_OUT_5_G[0] := 1;
  			END_CASE;
  			slt2[1] := (random_num + slt2[1]) MOD 2;
  			random_num := random_num - slt2[1];
 		2:
  			CASE slt2[2] OF
  				0:
  					GD_OUT_7 := 1;
  				1:
  					FE_Xag := 1;
  				2:
  					GD_OUT_5_G[0] := 0;
  			END_CASE;
  			slt2[2] := (random_num + slt2[2]) MOD 3;
  			random_num := random_num - slt2[2];
 		3:
  			CASE slt2[3] OF
  				0:
  					FE_Xag := 1;
  				1:
  					GD_OUT_5_G[0] := 0;
  			END_CASE;
  			slt2[3] := (random_num + slt2[3]) MOD 2;
  			random_num := random_num - slt2[3];
 	END_CASE;

	CASE state[3] OF
  		0:
  			GD_OUT_5_G[1] := 1;
		1:
  			GD_OUT_5_G[1] := 1;
		2:
  			GD_OUT_5_G[1] := 0;
  		3:
  			GD_OUT_5_G[1] := 0;
  	END_CASE;

	CASE state[4] OF
  		0:
  			GD_OUT_5_G[2] := 1;
		1:
  			GD_OUT_5_G[2] := 0;
  	END_CASE;
	IF (GD_OUT_5_G[0] <> GD_OUT_5_G[1]) OR (GD_OUT_5_G[1] <> GD_OUT_5_G[2]) THEN
		GD_OUT_5_G[0] := GD_OUT_5;
		GD_OUT_5_G[1] := GD_OUT_5;
		GD_OUT_5_G[2] := GD_OUT_5;			
	END_IF;
	GD_OUT_5 := GD_OUT_5_G[0];
	IF state[0] = 0 & GD_OUT_4 THEN
  		state[0] := 2;
  	ELSIF state[0] = 1 & GD_OUT_4 THEN
  		state[0] := 3;
  	ELSIF state[0] = 2 & NOT GD_OUT_4 THEN
  		state[0] := 0;
  	ELSIF state[0] = 3 & NOT GD_OUT_4 THEN
  		state[0] := 1;
  	END_IF;


	IF state[2] = 0 & GD_OUT_7 THEN
  		state[2] := 1;
  	ELSIF state[2] = 0 & GD_OUT_5 THEN
  		state[2] := 2;
  	ELSIF state[2] = 1 & GD_OUT_5 THEN
  		state[2] := 3;
  	ELSIF state[2] = 2 & GD_OUT_7 THEN
  		state[2] := 3;
  	ELSIF state[2] = 2 & NOT GD_OUT_5 THEN
  		state[2] := 0;
  	ELSIF state[2] = 3 & NOT GD_OUT_5 THEN
  		state[2] := 1;
  	END_IF;

	IF state[3] = 0 & GD_OUT_5 THEN
  		state[3] := 2;
  	ELSIF state[3] = 1 & GD_OUT_5 THEN
  		state[3] := 3;
  	ELSIF state[3] = 2 & NOT GD_OUT_5 THEN
  		state[3] := 0;
  	ELSIF state[3] = 3 & NOT GD_OUT_5 THEN
  		state[3] := 1;
  	END_IF;

	IF state[4] = 0 & GD_OUT_5 THEN
  		state[4] := 1;
  	ELSIF state[4] = 1 & NOT GD_OUT_5 THEN
  		state[4] := 0;
  	END_IF;

	GD_OUT_12 := GD_IN_10;
 	GD_OUT_13 := GD_IN_11;
 
END_PROGRAM

CONFIGURATION Config0

	RESOURCE Res0 ON PLC
		TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
		PROGRAM instance0 WITH task0 : tesis0;
	END_RESOURCE
END_CONFIGURATION