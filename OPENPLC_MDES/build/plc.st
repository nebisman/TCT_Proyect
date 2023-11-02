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
    state : INT := 0;
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

  FE_LaP(CLK:= GD_IN_2);
  FE_Zag(CLK:= GD_IN_6);

  IF state = 0 & GD_IN_4 THEN
  	 state := 1;
  ELSIF state = 2 & GD_IN_4 THEN
  	 state := 3;
  ELSIF state = 4 & FE_Zag.Q THEN
  	 state := 6;
  ELSIF state = 5 & FE_Zag.Q THEN
  	 state := 7;
  ELSIF state = 15 & GD_IN_4 THEN
  	 state := 19;
  ELSIF state = 15 & FE_Zag.Q THEN
  	 state := 20;
  ELSIF state = 17 & GD_IN_4 THEN
  	 state := 22;
  ELSIF state = 17 & FE_Zag.Q THEN
  	 state := 23;
  ELSIF state = 18 & GD_IN_4 THEN
  	 state := 24;
  ELSIF state = 18 & FE_Zag.Q THEN
  	 state := 0;
  ELSIF state = 19 & FE_Zag.Q THEN
  	 state := 25;
  ELSIF state = 20 & GD_IN_4 THEN
  	 state := 26;
  ELSIF state = 21 & GD_IN_4 THEN
  	 state := 27;
  ELSIF state = 21 & FE_Zag.Q THEN
  	 state := 2;
  ELSIF state = 22 & FE_Zag.Q THEN
  	 state := 28;
  ELSIF state = 23 & GD_IN_4 THEN
  	 state := 29;
  ELSIF state = 24 & FE_Zag.Q THEN
  	 state := 30;
  ELSIF state = 27 & FE_Zag.Q THEN
  	 state := 33;
  ELSIF state = 31 & FE_Zag.Q THEN
  	 state := 38;
  ELSIF state = 32 & FE_Zag.Q THEN
  	 state := 38;
  ELSIF state = 34 & FE_Zag.Q THEN
  	 state := 41;
  ELSIF state = 35 & FE_Zag.Q THEN
  	 state := 41;
  ELSIF state = 37 & FE_Zag.Q THEN
  	 state := 6;
  ELSIF state = 40 & FE_Zag.Q THEN
  	 state := 7;
  ELSIF state = 43 & FE_Zag.Q THEN
  	 state := 8;
  ELSIF state = 46 & FE_Zag.Q THEN
  	 state := 9;
  ELSIF state = 47 & FE_Zag.Q THEN
  	 state := 10;
  ELSIF state = 50 & FE_Zag.Q THEN
  	 state := 11;
  ELSIF state = 51 & FE_Zag.Q THEN
  	 state := 12;
  ELSIF state = 53 & FE_Zag.Q THEN
  	 state := 13;
  ELSIF state = 54 & FE_Zag.Q THEN
  	 state := 14;
  ELSIF state = 55 & FE_Zag.Q THEN
  	 state := 16;
  END_IF;
  CASE state OF
  	0:
  		GD_OUT_4 := 1;
  	1:
  		CASE slt[1] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_6 := 1;
  		END_CASE;
  		slt[1] := slt[1] + 1;
   		IF slt[1] = 2 THEN
  			slt[1] := 0;
  		END_IF;
  	3:
  		GD_OUT_6 := 1;
  	4:
  		GD_OUT_4 := 1;
  	6:
  		CASE slt[6] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_7 := 1;
  		END_CASE;
  		slt[6] := slt[6] + 1;
   		IF slt[6] = 2 THEN
  			slt[6] := 0;
  		END_IF;
  	7:
  		GD_OUT_7 := 1;
  	8:
  		CASE slt[8] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_7 := 0;
  		END_CASE;
  		slt[8] := slt[8] + 1;
   		IF slt[8] = 2 THEN
  			slt[8] := 0;
  		END_IF;
  	9:
  		CASE slt[9] OF
  			0:
  				GD_OUT_4 := 0;
  			1:
  				GD_OUT_7 := 0;
  		END_CASE;
  		slt[9] := slt[9] + 1;
   		IF slt[9] = 2 THEN
  			slt[9] := 0;
  		END_IF;
  	10:
  		GD_OUT_4 := 1;
  	11:
  		CASE slt[11] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_7 := 0;
  			2:
  				GD_OUT_6 := 0;
  		END_CASE;
  		slt[11] := slt[11] + 1;
   		IF slt[11] = 3 THEN
  			slt[11] := 0;
  		END_IF;
  	12:
  		GD_OUT_4 := 0;
  	13:
  		CASE slt[13] OF
  			0:
  				GD_OUT_7 := 0;
  			1:
  				GD_OUT_6 := 0;
  		END_CASE;
  		slt[13] := slt[13] + 1;
   		IF slt[13] = 2 THEN
  			slt[13] := 0;
  		END_IF;
  	14:
  		CASE slt[14] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_6 := 0;
  		END_CASE;
  		slt[14] := slt[14] + 1;
   		IF slt[14] = 2 THEN
  			slt[14] := 0;
  		END_IF;
  	15:
  		CASE slt[15] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_7 := 0;
  		END_CASE;
  		slt[15] := slt[15] + 1;
   		IF slt[15] = 2 THEN
  			slt[15] := 0;
  		END_IF;
  	16:
  		GD_OUT_6 := 0;
  	17:
  		GD_OUT_7 := 0;
  	18:
  		GD_OUT_4 := 1;
  	19:
  		CASE slt[19] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_7 := 0;
  		END_CASE;
  		slt[19] := slt[19] + 1;
   		IF slt[19] = 2 THEN
  			slt[19] := 0;
  		END_IF;
  	20:
  		CASE slt[20] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_7 := 0;
  		END_CASE;
  		slt[20] := slt[20] + 1;
   		IF slt[20] = 2 THEN
  			slt[20] := 0;
  		END_IF;
  	22:
  		GD_OUT_7 := 0;
  	23:
  		GD_OUT_7 := 0;
  	24:
  		GD_OUT_4 := 1;
  	25:
  		CASE slt[25] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_7 := 0;
  			2:
  				GD_OUT_6 := 1;
  		END_CASE;
  		slt[25] := slt[25] + 1;
   		IF slt[25] = 3 THEN
  			slt[25] := 0;
  		END_IF;
  	26:
  		CASE slt[26] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_7 := 0;
  			2:
  				GD_OUT_6 := 1;
  		END_CASE;
  		slt[26] := slt[26] + 1;
   		IF slt[26] = 3 THEN
  			slt[26] := 0;
  		END_IF;
  	28:
  		CASE slt[28] OF
  			0:
  				GD_OUT_7 := 0;
  			1:
  				GD_OUT_6 := 1;
  		END_CASE;
  		slt[28] := slt[28] + 1;
   		IF slt[28] = 2 THEN
  			slt[28] := 0;
  		END_IF;
  	29:
  		CASE slt[29] OF
  			0:
  				GD_OUT_7 := 0;
  			1:
  				GD_OUT_6 := 1;
  		END_CASE;
  		slt[29] := slt[29] + 1;
   		IF slt[29] = 2 THEN
  			slt[29] := 0;
  		END_IF;
  	30:
  		CASE slt[30] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_7 := 1;
  			2:
  				GD_OUT_6 := 1;
  		END_CASE;
  		slt[30] := slt[30] + 1;
   		IF slt[30] = 3 THEN
  			slt[30] := 0;
  		END_IF;
  	31:
  		CASE slt[31] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_7 := 0;
  		END_CASE;
  		slt[31] := slt[31] + 1;
   		IF slt[31] = 2 THEN
  			slt[31] := 0;
  		END_IF;
  	32:
  		CASE slt[32] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_7 := 0;
  		END_CASE;
  		slt[32] := slt[32] + 1;
   		IF slt[32] = 2 THEN
  			slt[32] := 0;
  		END_IF;
  	33:
  		CASE slt[33] OF
  			0:
  				GD_OUT_7 := 1;
  			1:
  				GD_OUT_6 := 1;
  		END_CASE;
  		slt[33] := slt[33] + 1;
   		IF slt[33] = 2 THEN
  			slt[33] := 0;
  		END_IF;
  	34:
  		GD_OUT_7 := 0;
  	35:
  		GD_OUT_7 := 0;
  	36:
  		CASE slt[36] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_7 := 0;
  			2:
  				GD_OUT_6 := 1;
  		END_CASE;
  		slt[36] := slt[36] + 1;
   		IF slt[36] = 3 THEN
  			slt[36] := 0;
  		END_IF;
  	37:
  		CASE slt[37] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_7 := 1;
  		END_CASE;
  		slt[37] := slt[37] + 1;
   		IF slt[37] = 2 THEN
  			slt[37] := 0;
  		END_IF;
  	38:
  		CASE slt[38] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_7 := 0;
  		END_CASE;
  		slt[38] := slt[38] + 1;
   		IF slt[38] = 2 THEN
  			slt[38] := 0;
  		END_IF;
  	39:
  		CASE slt[39] OF
  			0:
  				GD_OUT_4 := 0;
  			1:
  				GD_OUT_7 := 0;
  			2:
  				GD_OUT_6 := 1;
  		END_CASE;
  		slt[39] := slt[39] + 1;
   		IF slt[39] = 3 THEN
  			slt[39] := 0;
  		END_IF;
  	40:
  		GD_OUT_7 := 1;
  	41:
  		GD_OUT_7 := 0;
  	42:
  		CASE slt[42] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_6 := 1;
  		END_CASE;
  		slt[42] := slt[42] + 1;
   		IF slt[42] = 2 THEN
  			slt[42] := 0;
  		END_IF;
  	43:
  		CASE slt[43] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_7 := 0;
  		END_CASE;
  		slt[43] := slt[43] + 1;
   		IF slt[43] = 2 THEN
  			slt[43] := 0;
  		END_IF;
  	44:
  		CASE slt[44] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_7 := 0;
  			2:
  				GD_OUT_6 := 1;
  		END_CASE;
  		slt[44] := slt[44] + 1;
   		IF slt[44] = 3 THEN
  			slt[44] := 0;
  		END_IF;
  	45:
  		CASE slt[45] OF
  			0:
  				GD_OUT_4 := 0;
  			1:
  				GD_OUT_6 := 1;
  		END_CASE;
  		slt[45] := slt[45] + 1;
   		IF slt[45] = 2 THEN
  			slt[45] := 0;
  		END_IF;
  	46:
  		CASE slt[46] OF
  			0:
  				GD_OUT_4 := 0;
  			1:
  				GD_OUT_7 := 0;
  		END_CASE;
  		slt[46] := slt[46] + 1;
   		IF slt[46] = 2 THEN
  			slt[46] := 0;
  		END_IF;
  	47:
  		GD_OUT_4 := 1;
  	48:
  		CASE slt[48] OF
  			0:
  				GD_OUT_7 := 0;
  			1:
  				GD_OUT_6 := 1;
  		END_CASE;
  		slt[48] := slt[48] + 1;
   		IF slt[48] = 2 THEN
  			slt[48] := 0;
  		END_IF;
  	49:
  		CASE slt[49] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_6 := 1;
  		END_CASE;
  		slt[49] := slt[49] + 1;
   		IF slt[49] = 2 THEN
  			slt[49] := 0;
  		END_IF;
  	50:
  		CASE slt[50] OF
  			0:
  				GD_OUT_4 := 1;
  			1:
  				GD_OUT_7 := 0;
  		END_CASE;
  		slt[50] := slt[50] + 1;
   		IF slt[50] = 2 THEN
  			slt[50] := 0;
  		END_IF;
  	51:
  		GD_OUT_4 := 0;
  	52:
  		GD_OUT_6 := 1;
  	53:
  		GD_OUT_7 := 0;
  	54:
  		GD_OUT_4 := 1;
  END_CASE;
  IF state = 0 & GD_OUT_4 THEN
  	 state := 2;
  ELSIF state = 1 & GD_OUT_4 THEN
  	 state := 3;
  ELSIF state = 1 & GD_OUT_6 THEN
  	 state := 4;
  ELSIF state = 3 & GD_OUT_6 THEN
  	 state := 5;
  ELSIF state = 4 & GD_OUT_4 THEN
  	 state := 5;
  ELSIF state = 6 & GD_OUT_4 THEN
  	 state := 7;
  ELSIF state = 6 & GD_OUT_7 THEN
  	 state := 8;
  ELSIF state = 7 & GD_OUT_7 THEN
  	 state := 9;
  ELSIF state = 8 & GD_OUT_4 THEN
  	 state := 9;
  ELSIF state = 8 & NOT GD_OUT_7 THEN
  	 state := 10;
  ELSIF state = 9 & NOT GD_OUT_4 THEN
  	 state := 11;
  ELSIF state = 9 & NOT GD_OUT_7 THEN
  	 state := 12;
  ELSIF state = 10 & GD_OUT_4 THEN
  	 state := 12;
  ELSIF state = 11 & GD_OUT_4 THEN
  	 state := 13;
  ELSIF state = 11 & NOT GD_OUT_7 THEN
  	 state := 14;
  ELSIF state = 11 & NOT GD_OUT_6 THEN
  	 state := 15;
  ELSIF state = 12 & NOT GD_OUT_4 THEN
  	 state := 14;
  ELSIF state = 13 & NOT GD_OUT_7 THEN
  	 state := 16;
  ELSIF state = 13 & NOT GD_OUT_6 THEN
  	 state := 17;
  ELSIF state = 14 & GD_OUT_4 THEN
  	 state := 16;
  ELSIF state = 14 & NOT GD_OUT_6 THEN
  	 state := 18;
  ELSIF state = 15 & GD_OUT_4 THEN
  	 state := 17;
  ELSIF state = 15 & NOT GD_OUT_7 THEN
  	 state := 18;
  ELSIF state = 16 & NOT GD_OUT_6 THEN
  	 state := 21;
  ELSIF state = 17 & NOT GD_OUT_7 THEN
  	 state := 21;
  ELSIF state = 18 & GD_OUT_4 THEN
  	 state := 21;
  ELSIF state = 19 & GD_OUT_4 THEN
  	 state := 22;
  ELSIF state = 19 & NOT GD_OUT_7 THEN
  	 state := 24;
  ELSIF state = 20 & GD_OUT_4 THEN
  	 state := 23;
  ELSIF state = 20 & NOT GD_OUT_7 THEN
  	 state := 0;
  ELSIF state = 22 & NOT GD_OUT_7 THEN
  	 state := 27;
  ELSIF state = 23 & NOT GD_OUT_7 THEN
  	 state := 2;
  ELSIF state = 24 & GD_OUT_4 THEN
  	 state := 27;
  ELSIF state = 25 & GD_OUT_4 THEN
  	 state := 28;
  ELSIF state = 25 & NOT GD_OUT_7 THEN
  	 state := 30;
  ELSIF state = 25 & GD_OUT_6 THEN
  	 state := 31;
  ELSIF state = 26 & GD_OUT_4 THEN
  	 state := 29;
  ELSIF state = 26 & NOT GD_OUT_7 THEN
  	 state := 1;
  ELSIF state = 26 & GD_OUT_6 THEN
  	 state := 32;
  ELSIF state = 28 & NOT GD_OUT_7 THEN
  	 state := 33;
  ELSIF state = 28 & GD_OUT_6 THEN
  	 state := 34;
  ELSIF state = 29 & NOT GD_OUT_7 THEN
  	 state := 3;
  ELSIF state = 29 & GD_OUT_6 THEN
  	 state := 35;
  ELSIF state = 30 & GD_OUT_4 THEN
  	 state := 33;
  ELSIF state = 30 & GD_OUT_7 THEN
  	 state := 36;
  ELSIF state = 30 & GD_OUT_6 THEN
  	 state := 37;
  ELSIF state = 31 & GD_OUT_4 THEN
  	 state := 34;
  ELSIF state = 31 & NOT GD_OUT_7 THEN
  	 state := 37;
  ELSIF state = 32 & GD_OUT_4 THEN
  	 state := 35;
  ELSIF state = 32 & NOT GD_OUT_7 THEN
  	 state := 4;
  ELSIF state = 33 & GD_OUT_7 THEN
  	 state := 39;
  ELSIF state = 33 & GD_OUT_6 THEN
  	 state := 40;
  ELSIF state = 34 & NOT GD_OUT_7 THEN
  	 state := 40;
  ELSIF state = 35 & NOT GD_OUT_7 THEN
  	 state := 5;
  ELSIF state = 36 & GD_OUT_4 THEN
  	 state := 39;
  ELSIF state = 36 & NOT GD_OUT_7 THEN
  	 state := 42;
  ELSIF state = 36 & GD_OUT_6 THEN
  	 state := 43;
  ELSIF state = 37 & GD_OUT_4 THEN
  	 state := 40;
  ELSIF state = 37 & GD_OUT_7 THEN
  	 state := 43;
  ELSIF state = 38 & GD_OUT_4 THEN
  	 state := 41;
  ELSIF state = 38 & NOT GD_OUT_7 THEN
  	 state := 6;
  ELSIF state = 39 & NOT GD_OUT_4 THEN
  	 state := 44;
  ELSIF state = 39 & NOT GD_OUT_7 THEN
  	 state := 45;
  ELSIF state = 39 & GD_OUT_6 THEN
  	 state := 46;
  ELSIF state = 40 & GD_OUT_7 THEN
  	 state := 46;
  ELSIF state = 41 & NOT GD_OUT_7 THEN
  	 state := 7;
  ELSIF state = 42 & GD_OUT_4 THEN
  	 state := 45;
  ELSIF state = 42 & GD_OUT_6 THEN
  	 state := 47;
  ELSIF state = 43 & GD_OUT_4 THEN
  	 state := 46;
  ELSIF state = 43 & NOT GD_OUT_7 THEN
  	 state := 47;
  ELSIF state = 44 & GD_OUT_4 THEN
  	 state := 48;
  ELSIF state = 44 & NOT GD_OUT_7 THEN
  	 state := 49;
  ELSIF state = 44 & GD_OUT_6 THEN
  	 state := 50;
  ELSIF state = 45 & NOT GD_OUT_4 THEN
  	 state := 49;
  ELSIF state = 45 & GD_OUT_6 THEN
  	 state := 51;
  ELSIF state = 46 & NOT GD_OUT_4 THEN
  	 state := 50;
  ELSIF state = 46 & NOT GD_OUT_7 THEN
  	 state := 51;
  ELSIF state = 47 & GD_OUT_4 THEN
  	 state := 51;
  ELSIF state = 48 & NOT GD_OUT_7 THEN
  	 state := 52;
  ELSIF state = 48 & GD_OUT_6 THEN
  	 state := 53;
  ELSIF state = 49 & GD_OUT_4 THEN
  	 state := 52;
  ELSIF state = 49 & GD_OUT_6 THEN
  	 state := 54;
  ELSIF state = 50 & GD_OUT_4 THEN
  	 state := 53;
  ELSIF state = 50 & NOT GD_OUT_7 THEN
  	 state := 54;
  ELSIF state = 51 & NOT GD_OUT_4 THEN
  	 state := 54;
  ELSIF state = 52 & GD_OUT_6 THEN
  	 state := 55;
  ELSIF state = 53 & NOT GD_OUT_7 THEN
  	 state := 55;
  ELSIF state = 54 & GD_OUT_4 THEN
  	 state := 55;
  END_IF;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : tesis0;
  END_RESOURCE
END_CONFIGURATION
