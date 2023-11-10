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
    slt : ARRAY [0..200] OF DINT;
    FE_LaP : F_TRIG;
    FE_Zag : F_TRIG;
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

  GD_OUT_7 := 1;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : tesis0;
  END_RESOURCE
END_CONFIGURATION
