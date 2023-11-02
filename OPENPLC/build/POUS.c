void LOGGER_init__(LOGGER *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MSG,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->LEVEL,LOGLEVEL__INFO,retain)
  __INIT_VAR(data__->TRIG0,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void LOGGER_body__(LOGGER *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  if ((__GET_VAR(data__->TRIG,) && !(__GET_VAR(data__->TRIG0,)))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

   LogMessage(GetFbVar(LEVEL),(char*)GetFbVar(MSG, .body),GetFbVar(MSG, .len));
  
    #undef GetFbVar
    #undef SetFbVar
;
  };
  __SET_VAR(data__->,TRIG0,,__GET_VAR(data__->TRIG,));

  goto __end;

__end:
  return;
} // LOGGER_body__() 





void PYTHON_EVAL_init__(PYTHON_EVAL *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CODE,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->ACK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESULT,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->STATE,0,retain)
  __INIT_VAR(data__->BUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->PREBUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->TRIGM1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TRIGGED,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PYTHON_EVAL_body__(PYTHON_EVAL *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __IL_DEFVAR_T __IL_DEFVAR;
  __IL_DEFVAR_T __IL_DEFVAR_BACK;
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)
extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(0, data__);
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // PYTHON_EVAL_body__() 





void PYTHON_POLL_init__(PYTHON_POLL *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CODE,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->ACK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESULT,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->STATE,0,retain)
  __INIT_VAR(data__->BUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->PREBUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->TRIGM1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TRIGGED,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PYTHON_POLL_body__(PYTHON_POLL *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __IL_DEFVAR_T __IL_DEFVAR;
  __IL_DEFVAR_T __IL_DEFVAR_BACK;
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)
extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(1,(PYTHON_EVAL*)(void*)data__);
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // PYTHON_POLL_body__() 





void PYTHON_GEAR_init__(PYTHON_GEAR *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->N,0,retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CODE,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->ACK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESULT,__STRING_LITERAL(0,""),retain)
  PYTHON_EVAL_init__(&data__->PY_EVAL,retain);
  __INIT_VAR(data__->COUNTER,0,retain)
  __INIT_VAR(data__->_TMP_ADD10_OUT,0,retain)
  __INIT_VAR(data__->_TMP_EQ13_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_SEL15_OUT,0,retain)
  __INIT_VAR(data__->_TMP_AND7_OUT,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PYTHON_GEAR_body__(PYTHON_GEAR *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __SET_VAR(data__->,_TMP_ADD10_OUT,,ADD__UINT__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (UINT)__GET_VAR(data__->COUNTER,),
    (UINT)1));
  __SET_VAR(data__->,_TMP_EQ13_OUT,,EQ__BOOL__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (UINT)__GET_VAR(data__->N,),
    (UINT)__GET_VAR(data__->_TMP_ADD10_OUT,)));
  __SET_VAR(data__->,_TMP_SEL15_OUT,,SEL__UINT__BOOL__UINT__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (BOOL)__GET_VAR(data__->_TMP_EQ13_OUT,),
    (UINT)__GET_VAR(data__->_TMP_ADD10_OUT,),
    (UINT)0));
  __SET_VAR(data__->,COUNTER,,__GET_VAR(data__->_TMP_SEL15_OUT,));
  __SET_VAR(data__->,_TMP_AND7_OUT,,AND__BOOL__BOOL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (BOOL)__GET_VAR(data__->_TMP_EQ13_OUT,),
    (BOOL)__GET_VAR(data__->TRIG,)));
  __SET_VAR(data__->PY_EVAL.,TRIG,,__GET_VAR(data__->_TMP_AND7_OUT,));
  __SET_VAR(data__->PY_EVAL.,CODE,,__GET_VAR(data__->CODE,));
  PYTHON_EVAL_body__(&data__->PY_EVAL);
  __SET_VAR(data__->,ACK,,__GET_VAR(data__->PY_EVAL.ACK,));
  __SET_VAR(data__->,RESULT,,__GET_VAR(data__->PY_EVAL.RESULT,));

  goto __end;

__end:
  return;
} // PYTHON_GEAR_body__() 





void TESIS0_init__(TESIS0 *data__, BOOL retain) {
  __INIT_VAR(data__->INITIAL,0,retain)
  __INIT_VAR(data__->STATE,0,retain)
  {
    static const __ARRAY_OF_DINT_201 temp = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
    __SET_VAR(data__->,SLT,,temp);
  }
  F_TRIG_init__(&data__->FE_LAP,retain);
  __INIT_VAR(data__->GD_IN_2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_15,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_OUT_2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_OUT_4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_OUT_6,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_OUT_7,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_OUT_8,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_OUT_9,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void TESIS0_body__(TESIS0 *data__) {
  // Initialise TEMP variables

  if (!(__GET_VAR(data__->INITIAL,))) {
    __SET_VAR(data__->,STATE,,4);
    __SET_VAR(data__->,INITIAL,,1);
  };
  __SET_VAR(data__->FE_LAP.,CLK,,__GET_VAR(data__->GD_IN_2,));
  F_TRIG_body__(&data__->FE_LAP);
  if (((__GET_VAR(data__->STATE,) == 0) && __GET_VAR(data__->FE_LAP.Q,))) {
    __SET_VAR(data__->,STATE,,1);
  } else if (((__GET_VAR(data__->STATE,) == 2) && __GET_VAR(data__->GD_IN_15,))) {
    __SET_VAR(data__->,STATE,,3);
  } else if (((__GET_VAR(data__->STATE,) == 4) && __GET_VAR(data__->GD_IN_15,))) {
    __SET_VAR(data__->,STATE,,5);
  } else if (((__GET_VAR(data__->STATE,) == 6) && __GET_VAR(data__->GD_IN_15,))) {
    __SET_VAR(data__->,STATE,,7);
  } else if (((__GET_VAR(data__->STATE,) == 6) && __GET_VAR(data__->GD_IN_4,))) {
    __SET_VAR(data__->,STATE,,8);
  } else if (((__GET_VAR(data__->STATE,) == 7) && __GET_VAR(data__->GD_IN_4,))) {
    __SET_VAR(data__->,STATE,,9);
  } else if (((__GET_VAR(data__->STATE,) == 8) && __GET_VAR(data__->GD_IN_15,))) {
    __SET_VAR(data__->,STATE,,9);
  };
  {
    INT __case_expression = __GET_VAR(data__->STATE,);
    if ((__case_expression == 1)) {
      __SET_VAR(data__->,GD_OUT_2,,0);
    }
    else if ((__case_expression == 2)) {
      __SET_VAR(data__->,GD_OUT_4,,1);
    }
    else if ((__case_expression == 3)) {
      __SET_VAR(data__->,GD_OUT_4,,1);
    }
    else if ((__case_expression == 5)) {
      __SET_VAR(data__->,GD_OUT_2,,1);
    }
    else if ((__case_expression == 8)) {
      __SET_VAR(data__->,GD_OUT_4,,0);
    }
    else if ((__case_expression == 9)) {
      __SET_VAR(data__->,GD_OUT_4,,0);
    }
  };
  if (((__GET_VAR(data__->STATE,) == 1) && !(__GET_VAR(data__->GD_OUT_2,)))) {
    __SET_VAR(data__->,STATE,,2);
  } else if (((__GET_VAR(data__->STATE,) == 2) && __GET_VAR(data__->GD_OUT_4,))) {
    __SET_VAR(data__->,STATE,,6);
  } else if (((__GET_VAR(data__->STATE,) == 3) && __GET_VAR(data__->GD_OUT_4,))) {
    __SET_VAR(data__->,STATE,,7);
  } else if (((__GET_VAR(data__->STATE,) == 5) && __GET_VAR(data__->GD_OUT_2,))) {
    __SET_VAR(data__->,STATE,,0);
  } else if (((__GET_VAR(data__->STATE,) == 8) && !(__GET_VAR(data__->GD_OUT_4,)))) {
    __SET_VAR(data__->,STATE,,4);
  } else if (((__GET_VAR(data__->STATE,) == 9) && !(__GET_VAR(data__->GD_OUT_4,)))) {
    __SET_VAR(data__->,STATE,,5);
  };

  goto __end;

__end:
  return;
} // TESIS0_body__() 





