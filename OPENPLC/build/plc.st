TYPE
  LOGLEVEL : (CRITICAL, WARNING, INFO, DEBUG) := INFO;
END_TYPE

FUNCTION_BLOCK LOGGER
  VAR_INPUT
    TRIG : BOOL;
    MSG : STRING;
    LEVEL : LOGLEVEL := INFO;
  END_VAR
  VAR
    TRIG0 : BOOL;
  END_VAR

  IF TRIG AND NOT TRIG0 THEN
  {{
   LogMessage(GetFbVar(LEVEL),(char*)GetFbVar(MSG, .body),GetFbVar(MSG, .len));
  }}
  END_IF;
  TRIG0:=TRIG;
END_FUNCTION_BLOCK



FUNCTION_BLOCK python_eval
  VAR_INPUT
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    STATE : DWORD;
    BUFFER : STRING;
    PREBUFFER : STRING;
    TRIGM1 : BOOL;
    TRIGGED : BOOL;
  END_VAR

  {extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(0, data__);}
END_FUNCTION_BLOCK

FUNCTION_BLOCK python_poll
  VAR_INPUT
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    STATE : DWORD;
    BUFFER : STRING;
    PREBUFFER : STRING;
    TRIGM1 : BOOL;
    TRIGGED : BOOL;
  END_VAR

  {extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(1,(PYTHON_EVAL*)(void*)data__);}
END_FUNCTION_BLOCK

FUNCTION_BLOCK python_gear
  VAR_INPUT
    N : UINT;
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    py_eval : python_eval;
    COUNTER : UINT;
    _TMP_ADD10_OUT : UINT;
    _TMP_EQ13_OUT : BOOL;
    _TMP_SEL15_OUT : UINT;
    _TMP_AND7_OUT : BOOL;
  END_VAR

  _TMP_ADD10_OUT := ADD(COUNTER, 1);
  _TMP_EQ13_OUT := EQ(N, _TMP_ADD10_OUT);
  _TMP_SEL15_OUT := SEL(_TMP_EQ13_OUT, _TMP_ADD10_OUT, 0);
  COUNTER := _TMP_SEL15_OUT;
  _TMP_AND7_OUT := AND(_TMP_EQ13_OUT, TRIG);
  py_eval(TRIG := _TMP_AND7_OUT, CODE := CODE);
  ACK := py_eval.ACK;
  RESULT := py_eval.RESULT;
END_FUNCTION_BLOCK


PROGRAM tesis0
  VAR
    initial : BOOL := 0;
    state : INT;
    slt : ARRAY [0..200] OF DINT;
    FE_LaP : F_TRIG;
  END_VAR
  VAR
    GD_IN_2 : BOOL;
    GD_IN_4 : BOOL;
    GD_IN_15 : BOOL;
    GD_OUT_2 : BOOL;
    GD_OUT_4 : BOOL;
    GD_OUT_6 : BOOL;
    GD_OUT_7 : BOOL;
    GD_OUT_8 : BOOL;
    GD_OUT_9 : BOOL;
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
