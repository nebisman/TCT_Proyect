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





void RAN_init__(RAN *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->IN,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->INIT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->OUT,0,retain)
}

// Code part
void RAN_body__(RAN *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)
//#include <time.h>
  #undef GetFbVar
  #undef SetFbVar
;
  if ((__GET_VAR(data__->INIT,) == 0)) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)
time_t t;
    srand((unsigned) time(&t))
    #undef GetFbVar
    #undef SetFbVar
;
    __SET_VAR(data__->,IN,,1);
  };
  if (((__GET_VAR(data__->M,) == 0) && (__GET_VAR(data__->IN,) == 1))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)
SetFbVar(OUT,rand())
    #undef GetFbVar
    #undef SetFbVar
;
  };

  goto __end;

__end:
  return;
} // RAN_body__() 





void TESIS0_init__(TESIS0 *data__, BOOL retain) {
  __INIT_VAR(data__->INTERN_1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->INTERN_0,__BOOL_LITERAL(FALSE),retain)
  {
    static const __ARRAY_OF_DINT_201 temp = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
    __SET_VAR(data__->,SLT,,temp);
  }
  {
    static const __ARRAY_OF_DINT_201 temp = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
    __SET_VAR(data__->,STATE,,temp);
  }
  {
    static const __ARRAY_OF_DINT_201 temp = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
    __SET_VAR(data__->,SLT0,,temp);
  }
  F_TRIG_init__(&data__->FE_LAP,retain);
  F_TRIG_init__(&data__->FE_PO,retain);
  F_TRIG_init__(&data__->FE_PR,retain);
  F_TRIG_init__(&data__->FE_M2E,retain);
  F_TRIG_init__(&data__->FE_CP,retain);
  F_TRIG_init__(&data__->FE_M1,retain);
  F_TRIG_init__(&data__->FE_B1,retain);
  F_TRIG_init__(&data__->FE_B1O,retain);
  R_TRIG_init__(&data__->RE_M1,retain);
  R_TRIG_init__(&data__->RE_CP,retain);
  F_TRIG_init__(&data__->FE_ZAG,retain);
  __INIT_VAR(data__->GD_IN_2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_5,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_6,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_7,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_8,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_9,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_10,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_11,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_12,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_15,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_OUT_2,0,retain)
  __INIT_VAR(data__->GD_OUT_1,0,retain)
  __INIT_VAR(data__->GD_OUT_0,0,retain)
  __INIT_VAR(data__->GD_OUT_3,0,retain)
  __INIT_VAR(data__->GD_OUT_5,0,retain)
  __INIT_VAR(data__->GD_OUT_4,0,retain)
  __INIT_VAR(data__->GD_OUT_6,0,retain)
  __INIT_VAR(data__->GD_OUT_7,0,retain)
  __INIT_VAR(data__->GD_OUT_8,0,retain)
  __INIT_VAR(data__->GD_OUT_9,0,retain)
  __INIT_VAR(data__->GD_OUT_10,0,retain)
  __INIT_VAR(data__->GD_OUT_11,0,retain)
  __INIT_VAR(data__->GD_OUT_12,0,retain)
  RAN_init__(&data__->RANDOM,retain);
  __INIT_VAR(data__->RANDOM_NUMER,0,retain)
}

// Code part
void TESIS0_body__(TESIS0 *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->RE_M1.,CLK,,__GET_VAR(data__->GD_IN_1,));
  R_TRIG_body__(&data__->RE_M1);
  __SET_VAR(data__->FE_M2E.,CLK,,__GET_VAR(data__->GD_IN_6,));
  F_TRIG_body__(&data__->FE_M2E);
  __SET_VAR(data__->FE_PO.,CLK,,__GET_VAR(data__->GD_IN_9,));
  F_TRIG_body__(&data__->FE_PO);
  __SET_VAR(data__->FE_PR.,CLK,,__GET_VAR(data__->GD_IN_10,));
  F_TRIG_body__(&data__->FE_PR);
  __SET_VAR(data__->FE_CP.,CLK,,__GET_VAR(data__->GD_IN_7,));
  F_TRIG_body__(&data__->FE_CP);
  __SET_VAR(data__->RE_CP.,CLK,,__GET_VAR(data__->GD_IN_7,));
  R_TRIG_body__(&data__->RE_CP);
  __SET_VAR(data__->FE_M1.,CLK,,__GET_VAR(data__->GD_IN_1,));
  F_TRIG_body__(&data__->FE_M1);
  __SET_VAR(data__->FE_B1.,CLK,,__GET_VAR(data__->GD_IN_3,));
  F_TRIG_body__(&data__->FE_B1);
  __SET_VAR(data__->FE_B1O.,CLK,,__GET_VAR(data__->GD_IN_5,));
  F_TRIG_body__(&data__->FE_B1O);
  __SET_VAR(data__->RANDOM.,IN,,__BOOL_LITERAL(TRUE));
  RAN_body__(&data__->RANDOM);
  __SET_VAR(data__->,RANDOM_NUMER,,__GET_VAR(data__->RANDOM.OUT));
  if (((__GET_VAR(data__->STATE,.table[(0) - (0)]) == 2) && __GET_VAR(data__->FE_CP.Q,))) {
    __SET_VAR(data__->,STATE,.table[(0) - (0)],3);
  } else if (((__GET_VAR(data__->STATE,.table[(0) - (0)]) == 3) && __GET_VAR(data__->GD_IN_8,))) {
    __SET_VAR(data__->,STATE,.table[(0) - (0)],4);
  } else if (((__GET_VAR(data__->STATE,.table[(0) - (0)]) == 3) && !(__GET_VAR(data__->GD_IN_8,)))) {
    __SET_VAR(data__->,STATE,.table[(0) - (0)],5);
  } else if (((__GET_VAR(data__->STATE,.table[(0) - (0)]) == 4) && __GET_VAR(data__->FE_PO.Q,))) {
    __SET_VAR(data__->,STATE,.table[(0) - (0)],6);
  } else if (((__GET_VAR(data__->STATE,.table[(0) - (0)]) == 8) && __GET_VAR(data__->FE_PR.Q,))) {
    __SET_VAR(data__->,STATE,.table[(0) - (0)],9);
  };
  {
    DINT __case_expression = __GET_VAR(data__->STATE,.table[(0) - (0)]);
    if ((__case_expression == 0)) {
      {
        DINT __case_expression = __GET_VAR(data__->SLT0,.table[(0) - (0)]);
        if ((__case_expression == 0)) {
          __SET_VAR(data__->,INTERN_1,,1);
        }
        else if ((__case_expression == 1)) {
          __SET_VAR(data__->,INTERN_1,,0);
        }
      };
      __SET_VAR(data__->,SLT0,.table[(0) - (0)],((2 == 0)?0:((__GET_VAR(data__->RANDOM_NUMER,) + __GET_VAR(data__->SLT0,.table[(0) - (0)])) % 2)));
      __SET_VAR(data__->,RANDOM_NUMER,,(__GET_VAR(data__->RANDOM_NUMER,) - __GET_VAR(data__->SLT0,.table[(0) - (0)])));
    }
    else if ((__case_expression == 1)) {
      {
        DINT __case_expression = __GET_VAR(data__->SLT0,.table[(1) - (0)]);
        if ((__case_expression == 0)) {
          __SET_VAR(data__->,GD_OUT_9,,1);
        }
        else if ((__case_expression == 1)) {
          __SET_VAR(data__->,INTERN_1,,0);
        }
      };
      __SET_VAR(data__->,SLT0,.table[(1) - (0)],((2 == 0)?0:((__GET_VAR(data__->RANDOM_NUMER,) + __GET_VAR(data__->SLT0,.table[(1) - (0)])) % 2)));
      __SET_VAR(data__->,RANDOM_NUMER,,(__GET_VAR(data__->RANDOM_NUMER,) - __GET_VAR(data__->SLT0,.table[(1) - (0)])));
    }
    else if ((__case_expression == 2)) {
      __SET_VAR(data__->,INTERN_1,,0);
    }
    else if ((__case_expression == 3)) {
      __SET_VAR(data__->,INTERN_1,,0);
    }
    else if ((__case_expression == 4)) {
      __SET_VAR(data__->,INTERN_1,,0);
    }
    else if ((__case_expression == 5)) {
      {
        DINT __case_expression = __GET_VAR(data__->SLT0,.table[(2) - (0)]);
        if ((__case_expression == 0)) {
          __SET_VAR(data__->,GD_OUT_10,,1);
        }
        else if ((__case_expression == 1)) {
          __SET_VAR(data__->,INTERN_1,,0);
        }
      };
      __SET_VAR(data__->,SLT0,.table[(2) - (0)],((2 == 0)?0:((__GET_VAR(data__->RANDOM_NUMER,) + __GET_VAR(data__->SLT0,.table[(2) - (0)])) % 2)));
      __SET_VAR(data__->,RANDOM_NUMER,,(__GET_VAR(data__->RANDOM_NUMER,) - __GET_VAR(data__->SLT0,.table[(2) - (0)])));
    }
    else if ((__case_expression == 6)) {
      {
        DINT __case_expression = __GET_VAR(data__->SLT0,.table[(3) - (0)]);
        if ((__case_expression == 0)) {
          __SET_VAR(data__->,GD_OUT_9,,0);
        }
        else if ((__case_expression == 1)) {
          __SET_VAR(data__->,INTERN_1,,0);
        }
      };
      __SET_VAR(data__->,SLT0,.table[(3) - (0)],((2 == 0)?0:((__GET_VAR(data__->RANDOM_NUMER,) + __GET_VAR(data__->SLT0,.table[(3) - (0)])) % 2)));
      __SET_VAR(data__->,RANDOM_NUMER,,(__GET_VAR(data__->RANDOM_NUMER,) - __GET_VAR(data__->SLT0,.table[(3) - (0)])));
    }
    else if ((__case_expression == 7)) {
      {
        DINT __case_expression = __GET_VAR(data__->SLT0,.table[(4) - (0)]);
        if ((__case_expression == 0)) {
          __SET_VAR(data__->,GD_OUT_11,,1);
        }
        else if ((__case_expression == 1)) {
          __SET_VAR(data__->,INTERN_1,,0);
        }
      };
      __SET_VAR(data__->,SLT0,.table[(4) - (0)],((2 == 0)?0:((__GET_VAR(data__->RANDOM_NUMER,) + __GET_VAR(data__->SLT0,.table[(4) - (0)])) % 2)));
      __SET_VAR(data__->,RANDOM_NUMER,,(__GET_VAR(data__->RANDOM_NUMER,) - __GET_VAR(data__->SLT0,.table[(4) - (0)])));
    }
    else if ((__case_expression == 8)) {
      __SET_VAR(data__->,INTERN_1,,0);
    }
    else if ((__case_expression == 9)) {
      {
        DINT __case_expression = __GET_VAR(data__->SLT0,.table[(5) - (0)]);
        if ((__case_expression == 0)) {
          __SET_VAR(data__->,GD_OUT_11,,0);
        }
        else if ((__case_expression == 1)) {
          __SET_VAR(data__->,INTERN_1,,0);
        }
      };
      __SET_VAR(data__->,SLT0,.table[(5) - (0)],((2 == 0)?0:((__GET_VAR(data__->RANDOM_NUMER,) + __GET_VAR(data__->SLT0,.table[(5) - (0)])) % 2)));
      __SET_VAR(data__->,RANDOM_NUMER,,(__GET_VAR(data__->RANDOM_NUMER,) - __GET_VAR(data__->SLT0,.table[(5) - (0)])));
    }
    else if ((__case_expression == 10)) {
      {
        DINT __case_expression = __GET_VAR(data__->SLT0,.table[(6) - (0)]);
        if ((__case_expression == 0)) {
          __SET_VAR(data__->,GD_OUT_10,,0);
        }
        else if ((__case_expression == 1)) {
          __SET_VAR(data__->,INTERN_1,,0);
        }
      };
      __SET_VAR(data__->,SLT0,.table[(6) - (0)],((2 == 0)?0:((__GET_VAR(data__->RANDOM_NUMER,) + __GET_VAR(data__->SLT0,.table[(6) - (0)])) % 2)));
      __SET_VAR(data__->,RANDOM_NUMER,,(__GET_VAR(data__->RANDOM_NUMER,) - __GET_VAR(data__->SLT0,.table[(6) - (0)])));
    }
    else if ((__case_expression == 11)) {
      {
        DINT __case_expression = __GET_VAR(data__->SLT0,.table[(7) - (0)]);
        if ((__case_expression == 0)) {
          __SET_VAR(data__->,GD_OUT_9,,0);
        }
        else if ((__case_expression == 1)) {
          __SET_VAR(data__->,INTERN_1,,0);
        }
      };
      __SET_VAR(data__->,SLT0,.table[(7) - (0)],((2 == 0)?0:((__GET_VAR(data__->RANDOM_NUMER,) + __GET_VAR(data__->SLT0,.table[(7) - (0)])) % 2)));
      __SET_VAR(data__->,RANDOM_NUMER,,(__GET_VAR(data__->RANDOM_NUMER,) - __GET_VAR(data__->SLT0,.table[(7) - (0)])));
    }
  };
  if (((__GET_VAR(data__->STATE,.table[(0) - (0)]) == 0) && __GET_VAR(data__->INTERN_1,))) {
    __SET_VAR(data__->,STATE,.table[(0) - (0)],1);
  } else if (((__GET_VAR(data__->STATE,.table[(0) - (0)]) == 1) && __GET_VAR(data__->GD_OUT_9,))) {
    __SET_VAR(data__->,STATE,.table[(0) - (0)],2);
  } else if (((__GET_VAR(data__->STATE,.table[(0) - (0)]) == 5) && __GET_VAR(data__->GD_OUT_10,))) {
    __SET_VAR(data__->,STATE,.table[(0) - (0)],7);
  } else if (((__GET_VAR(data__->STATE,.table[(0) - (0)]) == 6) && !(__GET_VAR(data__->GD_OUT_9,)))) {
    __SET_VAR(data__->,STATE,.table[(0) - (0)],0);
  } else if (((__GET_VAR(data__->STATE,.table[(0) - (0)]) == 7) && __GET_VAR(data__->GD_OUT_11,))) {
    __SET_VAR(data__->,STATE,.table[(0) - (0)],8);
  } else if (((__GET_VAR(data__->STATE,.table[(0) - (0)]) == 9) && !(__GET_VAR(data__->GD_OUT_11,)))) {
    __SET_VAR(data__->,STATE,.table[(0) - (0)],10);
  } else if (((__GET_VAR(data__->STATE,.table[(0) - (0)]) == 10) && !(__GET_VAR(data__->GD_OUT_10,)))) {
    __SET_VAR(data__->,STATE,.table[(0) - (0)],11);
  } else if (((__GET_VAR(data__->STATE,.table[(0) - (0)]) == 11) && !(__GET_VAR(data__->GD_OUT_9,)))) {
    __SET_VAR(data__->,STATE,.table[(0) - (0)],0);
  };
  __SET_VAR(data__->,GD_OUT_1,,__GET_VAR(data__->GD_OUT_0,));
  __SET_VAR(data__->,GD_OUT_2,,__GET_VAR(data__->GD_OUT_0,));
  __SET_VAR(data__->,GD_OUT_3,,__GET_VAR(data__->GD_OUT_0,));

  goto __end;

__end:
  return;
} // TESIS0_body__() 





