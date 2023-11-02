PROGRAM tesis0
  VAR
    initial : BOOL := 0;
    state : INT;
    slt : ARRAY [0..200] OF DINT;
    FE_LaP : F_TRIG;
  END_VAR
  VAR
    GD_IN_2 AT %IX100.2 : BOOL;
    GD_IN_4 AT %IX100.4 : BOOL;
    GD_IN_15 AT %IX100.15 : BOOL;
    GD_OUT_2 AT %QX100.2 : BOOL;
    GD_OUT_4 AT %QX100.4 : BOOL;
    GD_OUT_6 AT %QX100.6 : BOOL;
    GD_OUT_7 AT %QX100.7 : BOOL;
    GD_OUT_8 AT %QX100.8 : BOOL;
    GD_OUT_9 AT %QX100.9 : BOOL;
  END_VAR

  IF NOT initial THEN
  	state := 4;
  	initial := 1;
  END_IF;

  FE_LaP(CLK:=GD_IN_2);
  IF state = 0 & FE_LaP.Q THEN
  	 state := 1;
  ELSIF state = 2 & GD_IN_15 THEN
  	 state := 3;
  ELSIF state = 4 & GD_IN_15 THEN
  	 state := 5;
  ELSIF state = 6 & GD_IN_15 THEN
  	 state := 7;
  ELSIF state = 6 & GD_IN_4 THEN
  	 state := 8;
  ELSIF state = 7 & GD_IN_4 THEN
  	 state := 9;
  ELSIF state = 8 & GD_IN_15 THEN
  	 state := 9;
  END_IF;
  CASE state OF
  	1:
  		GD_OUT_2 := 0;
  	2:
  		GD_OUT_4 := 1;
  	3:
  		GD_OUT_4 := 1;

  	5:
  		GD_OUT_2 := 1;

  	8:
  		GD_OUT_4 := 0;
  	9:
  		GD_OUT_4 := 0;
  END_CASE;
  IF state = 1 & NOT GD_OUT_2 THEN
  	 state := 2;
  ELSIF state = 2 & GD_OUT_4 THEN
  	 state := 6;
  ELSIF state = 3 & GD_OUT_4 THEN
  	 state := 7;
  ELSIF state = 5 & GD_OUT_2 THEN
  	 state := 0;
  ELSIF state = 8 & NOT GD_OUT_4 THEN
  	 state := 4;
  ELSIF state = 9 & NOT GD_OUT_4 THEN
  	 state := 5;
  END_IF;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : tesis0;
  END_RESOURCE
END_CONFIGURATION
