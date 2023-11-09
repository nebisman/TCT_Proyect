PROGRAM tesis0
  VAR
    initial : BOOL := 0;
    slt0 : ARRAY [0..200] OF DINT;
    state : ARRAY [0..200] OF DINT;
    slt1 : ARRAY [0..200] OF DINT;
    FE_LaP : F_TRIG;
    FE_Zag : F_TRIG;
    FE_Xag : F_TRIG;
  END_VAR
  VAR
    GD_IN_2 AT %IX100.2 : BOOL;
    GD_IN_4 AT %IX100.4 : BOOL;
    GD_IN_5 AT %IX100.5 : BOOL;
    GD_IN_6 AT %IX100.6 : BOOL;
    GD_IN_7 AT %IX100.7 : BOOL;
    GD_IN_8 AT %IX100.8 : BOOL;
    GD_IN_15 AT %IX100.15 : BOOL;
    GD_OUT_2 AT %QX100.2 : BOOL := 0;
    GD_OUT_3 AT %QX100.3 : BOOL := 0;
    GD_OUT_5 AT %QX100.5 : BOOL := 0;
    GD_OUT_4 AT %QX100.4 : BOOL := 0;
    GD_OUT_6 AT %QX100.6 : BOOL := 0;
    GD_OUT_7 AT %QX100.7 : BOOL := 0;
    GD_OUT_8 AT %QX100.8 : BOOL := 0;
  END_VAR
  VAR
    GD_OUT_4_G : ARRAY [0..2] OF BOOL;
    GD_OUT_4_C : ARRAY [0..2] OF BOOL;
  END_VAR
  VAR
    aux AT %QX100.11 : BOOL := 0;
  END_VAR

  FE_LaP(CLK:= GD_IN_2);
  	FE_Zag(CLK:= GD_IN_6);
  	FE_Xag(CLK:= GD_IN_7);
  	IF state[0] = 0 & GD_IN_15 THEN
    		state[0] := 1;
    	ELSIF state[0] = 2 & FE_LaP.Q THEN
    		state[0] := 3;
    	ELSIF state[0] = 5 & GD_IN_4 THEN
    		state[0] := 6;
    	END_IF;

  	IF state[1] = 0 & GD_IN_4 THEN
    		state[1] := 1;
    	ELSIF state[1] = 2 & GD_IN_4 THEN
    		state[1] := 3;
    	ELSIF state[1] = 4 & FE_Zag.Q THEN
    		state[1] := 6;
    	ELSIF state[1] = 5 & FE_Zag.Q THEN
    		state[1] := 7;
    	ELSIF state[1] = 12 & FE_Zag.Q THEN
    		state[1] := 14;
    	ELSIF state[1] = 13 & FE_Zag.Q THEN
    		state[1] := 15;
    	ELSIF state[1] = 16 & FE_Xag.Q THEN
    		state[1] := 18;
    	ELSIF state[1] = 17 & FE_Xag.Q THEN
    		state[1] := 19;
    	ELSIF state[1] = 20 & FE_Zag.Q THEN
    		state[1] := 22;
    	ELSIF state[1] = 21 & FE_Zag.Q THEN
    		state[1] := 23;
    	ELSIF state[1] = 26 & FE_Zag.Q THEN
    		state[1] := 28;
    	ELSIF state[1] = 27 & FE_Zag.Q THEN
    		state[1] := 29;
    	ELSIF state[1] = 30 & FE_Xag.Q THEN
    		state[1] := 0;
    	ELSIF state[1] = 31 & FE_Xag.Q THEN
    		state[1] := 2;
    	END_IF;


  	CASE state[0] OF
    		1:
    			GD_OUT_2 := 1;
  		3:
    			GD_OUT_2 := 0;
    		4:
    			GD_OUT_4_G[0] := 1;
  		6:
    			GD_OUT_4_G[0] := 0;
    	END_CASE;

  	CASE state[1] OF
    		0:
    			GD_OUT_4_G[1] := 1;
  		1:
    			CASE slt1[0] OF
    				0:
    					GD_OUT_4_G[1] := 1;
    				1:
    					GD_OUT_6 := 1;
    			END_CASE;
    			slt1[0] := slt1[0] + 1;
    			IF slt1[0] = 2 THEN
    				slt1[0] := 0;
    			END_IF;
    		3:
    			GD_OUT_6 := 1;
  		4:
    			GD_OUT_4_G[1] := 1;
  		6:
    			CASE slt1[1] OF
    				0:
    					GD_OUT_4_G[1] := 1;
    				1:
    					GD_OUT_7 := 1;
    			END_CASE;
    			slt1[1] := slt1[1] + 1;
    			IF slt1[1] = 2 THEN
    				slt1[1] := 0;
    			END_IF;
    		7:
    			GD_OUT_7 := 1;
  		8:
    			GD_OUT_4_G[1] := 1;
  		9:
    			GD_OUT_4_G[1] := 0;
    		10:
    			CASE slt1[2] OF
    				0:
    					GD_OUT_4_G[1] := 1;
    				1:
    					GD_OUT_6 := 0;
    			END_CASE;
    			slt1[2] := slt1[2] + 1;
    			IF slt1[2] = 2 THEN
    				slt1[2] := 0;
    			END_IF;
    		11:
    			GD_OUT_6 := 0;
    		12:
    			GD_OUT_4_G[1] := 1;
  		14:
    			CASE slt1[3] OF
    				0:
    					GD_OUT_4_G[1] := 1;
    				1:
    					GD_OUT_8 := 1;
    			END_CASE;
    			slt1[3] := slt1[3] + 1;
    			IF slt1[3] = 2 THEN
    				slt1[3] := 0;
    			END_IF;
    		15:
    			GD_OUT_8 := 1;
  		16:
    			GD_OUT_4_G[1] := 1;
  		18:
    			CASE slt1[4] OF
    				0:
    					GD_OUT_4_G[1] := 1;
    				1:
    					GD_OUT_6 := 1;
    			END_CASE;
    			slt1[4] := slt1[4] + 1;
    			IF slt1[4] = 2 THEN
    				slt1[4] := 0;
    			END_IF;
    		19:
    			GD_OUT_6 := 1;
  		20:
    			GD_OUT_4_G[1] := 1;
  		22:
    			CASE slt1[5] OF
    				0:
    					GD_OUT_4_G[1] := 1;
    				1:
    					GD_OUT_7 := 0;
    			END_CASE;
    			slt1[5] := slt1[5] + 1;
    			IF slt1[5] = 2 THEN
    				slt1[5] := 0;
    			END_IF;
    		23:
    			GD_OUT_7 := 0;
    		24:
    			CASE slt1[6] OF
    				0:
    					GD_OUT_4_G[1] := 1;
    				1:
    					GD_OUT_6 := 0;
    			END_CASE;
    			slt1[6] := slt1[6] + 1;
    			IF slt1[6] = 2 THEN
    				slt1[6] := 0;
    			END_IF;
    		25:
    			GD_OUT_6 := 0;
    		26:
    			GD_OUT_4_G[1] := 1;
  		28:
    			CASE slt1[7] OF
    				0:
    					GD_OUT_4_G[1] := 1;
    				1:
    					GD_OUT_8 := 0;
    			END_CASE;
    			slt1[7] := slt1[7] + 1;
    			IF slt1[7] = 2 THEN
    				slt1[7] := 0;
    			END_IF;
    		29:
    			GD_OUT_8 := 0;
    		30:
    			GD_OUT_4_G[1] := 1;
  	END_CASE;
  	IF GD_OUT_4_G[0] <> GD_OUT_4_G[1] THEN
  		GD_OUT_4_G[0] := GD_OUT_4;
  		GD_OUT_4_G[1] := GD_OUT_4;
  	END_IF;
  	aux := GD_OUT_4_G[0];
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : tesis0;
  END_RESOURCE
END_CONFIGURATION
