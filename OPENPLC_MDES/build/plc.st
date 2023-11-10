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
    initial : BOOL := 1;
    state : DINT := 0;
    state0 : DINT := 0;
    state1 : INT := 0;
    slt : ARRAY [0..200] OF DINT;
    FE_LaP : F_TRIG;
    FE_Zag : F_TRIG;
  END_VAR
  VAR
    GD_IN_2 : BOOL;
    GD_IN_4 : BOOL;
    GD_IN_5 : BOOL;
    GD_IN_6 : BOOL;
    GD_IN_7 : BOOL;
    GD_IN_8 : BOOL;
    GD_IN_15 : BOOL;
    GD_OUT_2 : BOOL := 0;
    GD_OUT_3 : BOOL := 0;
    GD_OUT_5 : BOOL := 0;
    GD_OUT_4 : BOOL := 0;
    GD_OUT_6 : BOOL := 0;
    GD_OUT_7 : BOOL := 0;
  END_VAR
  VAR
    random : ran;
  END_VAR

  FE_LaP(CLK:= GD_IN_2);
  FE_Zag(CLK:= GD_IN_6);
   random(
       IN := True,
       OUT => state);
      
  IF state <> state0 THEN
    state0 := state MOD 2;
  END_IF;

  state1 := DINT_TO_INT(1);
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : tesis0;
  END_RESOURCE
END_CONFIGURATION
