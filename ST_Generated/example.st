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
		state : ARRAY [0..1] OF DINT;
	END_VAR
	VAR
		GD_OUT_0 AT %QX100.0 : BOOL;
		GD_OUT_1 AT %QX100.1 : BOOL;
		GD_IN_0 AT %IX100.0 : BOOL;
		GD_IN_1 AT %IX100.1 : BOOL;
	END_VAR
	random(
		IN := True,
		OUT => random_num);
	IF state[0] = 1 & GD_IN_0 THEN
  		state[0] := 2;
  	ELSIF state[0] = 3 & GD_IN_1 THEN
  		state[0] := 0;
  	ELSIF state[0] = 4 & GD_IN_0 THEN
  		state[0] := 5;
  	ELSIF state[0] = 4 & GD_IN_1 THEN
  		state[0] := 1;
  	ELSIF state[0] = 5 & GD_IN_1 THEN
  		state[0] := 2;
  	END_IF;


	CASE state[0] OF
  		0:
  			GD_OUT_0 := 1;
		2:
  			GD_OUT_1 := 1;
		3:
  			GD_OUT_0 := 1;
	END_CASE;
	IF state[0] = 0 & GD_OUT_0 THEN
  		state[0] := 1;
  	ELSIF state[0] = 2 & GD_OUT_1 THEN
  		state[0] := 3;
  	ELSIF state[0] = 3 & GD_OUT_0 THEN
  		state[0] := 4;
  	END_IF;


END_PROGRAM

CONFIGURATION Config0

	RESOURCE Res0 ON PLC
		TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
		PROGRAM instance0 WITH task0 : tesis0;
	END_RESOURCE
END_CONFIGURATION