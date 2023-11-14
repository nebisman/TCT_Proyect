FUNCTION_BLOCK ran
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

  {//#include <time.h>}


  (* Initialize our random generator *)
  (* This IF is called only the first time this *)
  (* block executes *)
  IF INIT = 0 THEN
    {time_t t;
    srand((unsigned) time(&t))}
    IN := 1;
  END_IF;

  IF M = 0 and IN = 1 THEN
    (* Using pragma to write code directly M C. *)
    (* You can access your PLC program variables using *)
    (* GetFbVar(var,...) and SetFbVar(var,val,...) calls *)
    {SetFbVar(OUT,rand())}
  END_IF;
END_FUNCTION_BLOCK

PROGRAM tesis0
  VAR
    INTERN_1 : BOOL;
    INTERN_0 : BOOL;
    slt : ARRAY [0..200] OF DINT;
    state : ARRAY [0..200] OF DINT;
    slt0 : ARRAY [0..200] OF DINT;
    FE_LaP : F_TRIG;
    FE_PO : F_TRIG;
    FE_PR : F_TRIG;
    FE_M2E : F_TRIG;
    FE_CP : F_TRIG;
    FE_M1 : F_TRIG;
    FE_B1 : F_TRIG;
    FE_B1O : F_TRIG;
    RE_M1 : R_TRIG;
    RE_CP : R_TRIG;
    FE_Zag : F_TRIG;
  END_VAR
  VAR
    GD_IN_2 AT %IX100.2 : BOOL;
    GD_IN_1 AT %IX100.1 : BOOL;
    GD_IN_3 AT %IX100.3 : BOOL;
    GD_IN_4 AT %IX100.4 : BOOL;
    GD_IN_5 AT %IX100.5 : BOOL;
    GD_IN_6 AT %IX100.6 : BOOL;
    GD_IN_7 AT %IX100.7 : BOOL;
    GD_IN_8 AT %IX100.8 : BOOL;
    GD_IN_9 AT %IX100.9 : BOOL;
    GD_IN_10 AT %IX100.10 : BOOL;
    GD_IN_11 AT %IX100.11 : BOOL;
    GD_IN_12 AT %IX100.12 : BOOL;
    GD_IN_15 AT %IX100.15 : BOOL;
    GD_OUT_2 AT %QX100.2 : BOOL := 0;
    GD_OUT_1 AT %QX100.3 : BOOL := 0;
    GD_OUT_0 AT %QX100.4 : BOOL := 0;
    GD_OUT_3 AT %QX100.3 : BOOL := 0;
    GD_OUT_5 AT %QX100.5 : BOOL := 0;
    GD_OUT_4 AT %QX100.4 : BOOL := 0;
    GD_OUT_6 AT %QX100.6 : BOOL := 0;
    GD_OUT_7 AT %QX100.7 : BOOL := 0;
    GD_OUT_8 AT %QX100.8 : BOOL := 0;
    GD_OUT_9 AT %QX100.9 : BOOL := 0;
    GD_OUT_10 AT %QX100.10 : BOOL := 0;
    GD_OUT_11 AT %QX100.11 : BOOL := 0;
    GD_OUT_12 AT %QX100.12 : BOOL := 0;
  END_VAR
  VAR
    random : ran;
    random_numer : DINT;
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
  	IF state[0] = 2 & FE_CP.Q THEN
    		state[0] := 3;
    	ELSIF state[0] = 3 & GD_IN_8 THEN
    		state[0] := 4;
    	ELSIF state[0] = 3 & NOT GD_IN_8 THEN
    		state[0] := 5;
    	ELSIF state[0] = 4 & FE_PO.Q THEN
    		state[0] := 6;
    	ELSIF state[0] = 8 & FE_PR.Q THEN
    		state[0] := 9;
    	END_IF;

  	CASE state[0] OF
    		0:
    			CASE slt0[0] OF
    				0:
    					INTERN_1 := 1;
    				1:
    					INTERN_1 := 0;
    			END_CASE;
    			slt0[0] := (random_numer + slt0[0]) MOD 2;
    			random_numer := random_numer - slt0[0];
   		1:
    			CASE slt0[1] OF
    				0:
    					GD_OUT_9 := 1;
    				1:
    					INTERN_1 := 0;
    			END_CASE;
    			slt0[1] := (random_numer + slt0[1]) MOD 2;
    			random_numer := random_numer - slt0[1];
   		2:
    			INTERN_1 := 0;
    		3:
    			INTERN_1 := 0;
    		4:
    			INTERN_1 := 0;
    		5:
    			CASE slt0[2] OF
    				0:
    					GD_OUT_10 := 1;
    				1:
    					INTERN_1 := 0;
    			END_CASE;
    			slt0[2] := (random_numer + slt0[2]) MOD 2;
    			random_numer := random_numer - slt0[2];
   		6:
    			CASE slt0[3] OF
    				0:
    					GD_OUT_9 := 0;
    				1:
    					INTERN_1 := 0;
    			END_CASE;
    			slt0[3] := (random_numer + slt0[3]) MOD 2;
    			random_numer := random_numer - slt0[3];
   		7:
    			CASE slt0[4] OF
    				0:
    					GD_OUT_11 := 1;
    				1:
    					INTERN_1 := 0;
    			END_CASE;
    			slt0[4] := (random_numer + slt0[4]) MOD 2;
    			random_numer := random_numer - slt0[4];
   		8:
    			INTERN_1 := 0;
    		9:
    			CASE slt0[5] OF
    				0:
    					GD_OUT_11 := 0;
    				1:
    					INTERN_1 := 0;
    			END_CASE;
    			slt0[5] := (random_numer + slt0[5]) MOD 2;
    			random_numer := random_numer - slt0[5];
   		10:
    			CASE slt0[6] OF
    				0:
    					GD_OUT_10 := 0;
    				1:
    					INTERN_1 := 0;
    			END_CASE;
    			slt0[6] := (random_numer + slt0[6]) MOD 2;
    			random_numer := random_numer - slt0[6];
   		11:
    			CASE slt0[7] OF
    				0:
    					GD_OUT_9 := 0;
    				1:
    					INTERN_1 := 0;
    			END_CASE;
    			slt0[7] := (random_numer + slt0[7]) MOD 2;
    			random_numer := random_numer - slt0[7];
   	END_CASE;
  	IF state[0] = 0 & INTERN_1 THEN
    		state[0] := 1;
    	ELSIF state[0] = 1 & GD_OUT_9 THEN
    		state[0] := 2;
    	ELSIF state[0] = 5 & GD_OUT_10 THEN
    		state[0] := 7;
    	ELSIF state[0] = 6 & NOT GD_OUT_9 THEN
    		state[0] := 0;
    	ELSIF state[0] = 7 & GD_OUT_11 THEN
    		state[0] := 8;
    	ELSIF state[0] = 9 & NOT GD_OUT_11 THEN
    		state[0] := 10;
    	ELSIF state[0] = 10 & NOT GD_OUT_10 THEN
    		state[0] := 11;
    	ELSIF state[0] = 11 & NOT GD_OUT_9 THEN
    		state[0] := 0;
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
