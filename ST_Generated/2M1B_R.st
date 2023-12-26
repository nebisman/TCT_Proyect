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
		initial : BOOL;
		state : ARRAY [0..8] OF DINT;
		FE_M1E : F_TRIG;
		FE_M2E : F_TRIG;
		FE_A : F_TRIG;
		FE_PL : F_TRIG;
		FE_PR : F_TRIG;
		INTERN_4 : BOOL;
		INTERN_5 : BOOL;
		INTERN_2 : BOOL;
		INTERN_3 : BOOL;
		INTERN_0 : BOOL;
		INTERN_1 : BOOL;
	END_VAR
	VAR
		GD_OUT_3 AT %QX100.3 : BOOL;
 		GD_OUT_10 AT %QX101.0 : BOOL;
 		GD_OUT_11 AT %QX101.1 : BOOL;
 		GD_OUT_0 AT %QX100.0 : BOOL;
		GD_OUT_1 AT %QX100.1 : BOOL;
		GD_IN_0 AT %IX100.0 : BOOL;
		GD_IN_1 AT %IX100.1 : BOOL;
		GD_IN_15 AT %IX100.5 : BOOL;
		GD_OUT_2 AT %QX100.2 : BOOL;
		GD_IN_2 AT %IX100.2 : BOOL;
		GD_OUT_4 AT %QX100.4 : BOOL;
		GD_IN_3 AT %IX100.3 : BOOL;
		GD_IN_4 AT %IX100.4 : BOOL;
		GD_OUT_5 AT %QX100.5 : BOOL;
		GD_OUT_6 AT %QX100.6 : BOOL;
		GD_IN_10 AT %IX102.4 : BOOL;
		GD_IN_11 AT %IX103.1 : BOOL;
		GD_IN_12 AT %IX102.7 : BOOL;
		GD_IN_13 AT %IX103.0 : BOOL;
		GD_OUT_12 AT %QX101.2 : BOOL;
		GD_OUT_13 AT %QX101.3 : BOOL;
	END_VAR
	FE_M1E(CLK:= GD_IN_0);
	FE_M2E(CLK:= GD_IN_1);
	FE_A(CLK:= GD_IN_2);
	FE_PL(CLK:= GD_IN_3);
	FE_PR(CLK:= GD_IN_4);
	random(
		IN := True,
		OUT => random_numer);
	IF NOT initial THEN
		IF GD_IN_15 THEN
			initial := 1;
		END_IF;
	ELSIF initial THEN
		IF state[0] = 0 & GD_IN_15 THEN
	  		state[0] := 1;
	  	ELSIF state[0] = 2 & NOT GD_IN_10 THEN
	  		state[0] := 3;
	  	ELSIF state[0] = 2 & NOT GD_IN_0 THEN
	  		state[0] := 1;
	  	ELSIF state[0] = 3 & NOT GD_IN_0 THEN
	  		state[0] := 1;
	  	END_IF;
	
		IF state[1] = 0 & GD_OUT_0 THEN
	  		state[1] := 1;
	  	ELSIF state[1] = 1 & GD_IN_0 THEN
	  		state[1] := 2;
	  	ELSIF state[1] = 3 & FE_M1E.Q THEN
	  		state[1] := 0;
	  	END_IF;
	
		IF state[2] = 0 & GD_OUT_1 THEN
	  		state[2] := 1;
	  	ELSIF state[2] = 1 & GD_IN_1 THEN
	  		state[2] := 2;
	  	ELSIF state[2] = 3 & FE_M2E.Q THEN
	  		state[2] := 0;
	  	END_IF;
	
		IF state[3] = 0 & GD_IN_15 THEN
	  		state[3] := 1;
	  	ELSIF state[3] = 2 & FE_A.Q THEN
	  		state[3] := 3;
	  	ELSIF state[3] = 4 & FE_M1E.Q THEN
	  		state[3] := 1;
	  	END_IF;
	
		IF state[4] = 0 & GD_IN_0 THEN
	  		state[4] := 1;
	  	ELSIF state[4] = 1 & FE_M1E.Q THEN
	  		state[4] := 2;
	  	ELSIF state[4] = 3 & FE_PL.Q THEN
	  		state[4] := 4;
	  	ELSIF state[4] = 1 & NOT GD_IN_10 THEN
	  		state[4] := 5;
	  	ELSIF state[4] = 5 & FE_M1E.Q THEN
	  		state[4] := 0;
	  	END_IF;
	
		IF state[5] = 0 & GD_IN_15 THEN
	  		state[5] := 1;
	  	ELSIF state[5] = 1 & FE_M1E.Q THEN
	  		state[5] := 2;
	  	ELSIF state[5] = 3 & FE_PR.Q THEN
	  		state[5] := 4;
	  	ELSIF state[5] = 5 & FE_M2E.Q THEN
	  		state[5] := 2;
	  	ELSIF state[5] = 7 & FE_M2E.Q THEN
	  		state[5] := 2;
	  	ELSIF state[5] = 5 & FE_M1E.Q THEN
	  		state[5] := 6;
	  	ELSIF state[5] = 7 & FE_PL.Q THEN
	  		state[5] := 8;
	  	ELSIF state[5] = 1 & NOT GD_IN_10 THEN
	  		state[5] := 9;
	  	ELSIF state[5] = 9 & FE_M1E.Q THEN
	  		state[5] := 1;
	  	END_IF;
	
		IF state[6] = 0 & FE_M2E.Q THEN
	  		state[6] := 1;
	  	ELSIF state[6] = 2 & FE_PR.Q THEN
	  		state[6] := 3;
	  	END_IF;
	
		IF state[7] = 0 & NOT GD_IN_10 THEN
	  		state[7] := 1;
	  	ELSIF state[7] = 2 & GD_IN_12 THEN
	  		state[7] := 3;
	  	ELSIF state[7] = 5 & NOT GD_IN_0 THEN
	  		state[7] := 6;
	  	ELSIF state[7] = 0 & NOT GD_IN_11 THEN
	  		state[7] := 7;
	  	ELSIF state[7] = 8 & GD_IN_13 THEN
	  		state[7] := 9;
	  	ELSIF state[7] = 11 & FE_M2E.Q THEN
	  		state[7] := 12;
	  	ELSIF state[7] = 2 & NOT GD_IN_11 THEN
	  		state[7] := 13;
	  	ELSIF state[7] = 15 & GD_IN_13 THEN
	  		state[7] := 16;
	  	ELSIF state[7] = 18 & FE_M2E.Q THEN
	  		state[7] := 19;
	  	ELSIF state[7] = 8 & NOT GD_IN_10 THEN
	  		state[7] := 15;
	  	END_IF;
	
	
		CASE state[0] OF
	  		1:
	  			INTERN_0 := 1;
		END_CASE;
	
		CASE state[1] OF
	  		2:
	  			GD_OUT_0 := 0;
	  	END_CASE;
	
		CASE state[2] OF
	  		2:
	  			GD_OUT_1 := 0;
	  	END_CASE;
	
		CASE state[3] OF
	  		1:
	  			GD_OUT_2 := 1;
			3:
	  			GD_OUT_2 := 0;
	  	END_CASE;
	
		CASE state[4] OF
	  		2:
	  			GD_OUT_5 := 1;
			4:
	  			GD_OUT_5 := 0;
	  	END_CASE;
	
		CASE state[5] OF
	  		2:
	  			GD_OUT_4 := 1;
			4:
	  			GD_OUT_4 := 0;
	  		6:
	  			GD_OUT_4 := 1;
			8:
	  			GD_OUT_4 := 0;
	  	END_CASE;
	
		CASE state[6] OF
	  		1:
	  			GD_OUT_6 := 0;
	  		3:
	  			GD_OUT_6 := 1;
		END_CASE;
	
		CASE state[7] OF
	  		1:
	  			INTERN_2 := 1;
			3:
	  			INTERN_4 := 1;
			4:
	  			INTERN_2 := 0;
	  		6:
	  			GD_OUT_12 := 0;
	  		7:
	  			INTERN_3 := 1;
			9:
	  			INTERN_5 := 1;
			10:
	  			INTERN_3 := 0;
	  		12:
	  			GD_OUT_13 := 0;
	  		13:
	  			INTERN_2 := 0;
	  		14:
	  			INTERN_3 := 1;
			16:
	  			INTERN_5 := 1;
			17:
	  			INTERN_3 := 0;
	  		19:
	  			GD_OUT_13 := 0;
	  	END_CASE;
		IF state[0] = 1 & INTERN_0 THEN
	  		state[0] := 2;
	  	END_IF;
	
		IF state[1] = 2 & NOT GD_OUT_0 THEN
	  		state[1] := 3;
	  	END_IF;
	
		IF state[2] = 2 & NOT GD_OUT_1 THEN
	  		state[2] := 3;
	  	END_IF;
	
		IF state[3] = 1 & GD_OUT_2 THEN
	  		state[3] := 2;
	  	ELSIF state[3] = 3 & NOT GD_OUT_2 THEN
	  		state[3] := 4;
	  	END_IF;
	
		IF state[4] = 2 & GD_OUT_5 THEN
	  		state[4] := 3;
	  	ELSIF state[4] = 4 & NOT GD_OUT_5 THEN
	  		state[4] := 0;
	  	END_IF;
	
		IF state[5] = 2 & GD_OUT_4 THEN
	  		state[5] := 3;
	  	ELSIF state[5] = 4 & NOT GD_OUT_4 THEN
	  		state[5] := 5;
	  	ELSIF state[5] = 6 & GD_OUT_4 THEN
	  		state[5] := 7;
	  	ELSIF state[5] = 8 & NOT GD_OUT_4 THEN
	  		state[5] := 5;
	  	END_IF;
	
		IF state[6] = 1 & NOT GD_OUT_6 THEN
	  		state[6] := 2;
	  	ELSIF state[6] = 3 & GD_OUT_6 THEN
	  		state[6] := 0;
	  	END_IF;
	
		IF state[7] = 1 & INTERN_2 THEN
	  		state[7] := 2;
	  	ELSIF state[7] = 3 & INTERN_4 THEN
	  		state[7] := 4;
	  	ELSIF state[7] = 4 & NOT INTERN_2 THEN
	  		state[7] := 5;
	  	ELSIF state[7] = 6 & NOT GD_OUT_12 THEN
	  		state[7] := 0;
	  	ELSIF state[7] = 7 & INTERN_3 THEN
	  		state[7] := 8;
	  	ELSIF state[7] = 9 & INTERN_5 THEN
	  		state[7] := 10;
	  	ELSIF state[7] = 10 & NOT INTERN_3 THEN
	  		state[7] := 11;
	  	ELSIF state[7] = 12 & NOT GD_OUT_13 THEN
	  		state[7] := 0;
	  	ELSIF state[7] = 13 & NOT INTERN_2 THEN
	  		state[7] := 14;
	  	ELSIF state[7] = 14 & INTERN_3 THEN
	  		state[7] := 15;
	  	ELSIF state[7] = 16 & INTERN_5 THEN
	  		state[7] := 17;
	  	ELSIF state[7] = 17 & NOT INTERN_3 THEN
	  		state[7] := 18;
	  	ELSIF state[7] = 19 & NOT GD_OUT_13 THEN
	  		state[7] := 1;
	  	END_IF;
	
		IF NOT GD_OUT_1 & INTERN_1 THEN
			GD_OUT_1 := 1;
		ELSIF GD_OUT_1 & INTERN_1 THEN
			INTERN_1 := 0;
		END_IF;
		IF NOT GD_OUT_0 & INTERN_0 THEN
			GD_OUT_0 := 1;
		ELSIF GD_OUT_0 & INTERN_0 THEN
			INTERN_0 := 0;
		END_IF;
		IF NOT GD_OUT_12 & INTERN_4 THEN
			GD_OUT_12 := 1;
		ELSIF GD_OUT_12 & INTERN_4 THEN
			INTERN_4 := 0;
		END_IF;
		IF NOT GD_OUT_13 & INTERN_5 THEN
			GD_OUT_13 := 1;
		ELSIF GD_OUT_13 & INTERN_5 THEN
			INTERN_5 := 0;
		END_IF;
		GD_OUT_3 := GD_OUT_2;
	 	GD_OUT_10 := NOT GD_IN_10;
	 	GD_OUT_11 := NOT GD_IN_11;
	 
	END_IF;
END_PROGRAM

CONFIGURATION Config0

	RESOURCE Res0 ON PLC
		TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
		PROGRAM instance0 WITH task0 : tesis0;
	END_RESOURCE
END_CONFIGURATION