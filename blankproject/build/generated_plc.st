PROGRAM blank_project
  VAR
    dummy_in AT %IX0.0 : BOOL;
    dummy_out AT %QX0.1 : BOOL;
  END_VAR

  dummy_out := dummy_in;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : blank_project;
  END_RESOURCE
END_CONFIGURATION
