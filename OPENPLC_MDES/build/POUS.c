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
  {
    static const __ARRAY_OF_DINT_201 temp = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
    __SET_VAR(data__->,SLT0,,temp);
  }
  {
    static const __ARRAY_OF_DINT_201 temp = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
    __SET_VAR(data__->,STATE,,temp);
  }
  {
    static const __ARRAY_OF_DINT_201 temp = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
    __SET_VAR(data__->,SLT1,,temp);
  }
  F_TRIG_init__(&data__->FE_LAP,retain);
  F_TRIG_init__(&data__->FE_ZAG,retain);
  F_TRIG_init__(&data__->FE_XAG,retain);
  __INIT_VAR(data__->GD_IN_2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_5,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_6,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_7,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_8,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_IN_15,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GD_OUT_2,0,retain)
  __INIT_VAR(data__->GD_OUT_3,0,retain)
  __INIT_VAR(data__->GD_OUT_5,0,retain)
  __INIT_VAR(data__->GD_OUT_4,0,retain)
  __INIT_VAR(data__->GD_OUT_6,0,retain)
  __INIT_VAR(data__->GD_OUT_7,0,retain)
  __INIT_VAR(data__->GD_OUT_8,0,retain)
  {
    static const __ARRAY_OF_BOOL_3 temp = {{__BOOL_LITERAL(FALSE),__BOOL_LITERAL(FALSE),__BOOL_LITERAL(FALSE)}};
    __SET_VAR(data__->,GD_OUT_4_G,,temp);
  }
  {
    static const __ARRAY_OF_BOOL_3 temp = {{__BOOL_LITERAL(FALSE),__BOOL_LITERAL(FALSE),__BOOL_LITERAL(FALSE)}};
    __SET_VAR(data__->,GD_OUT_4_C,,temp);
  }
  __INIT_VAR(data__->AUX,0,retain)
}

// Code part
void TESIS0_body__(TESIS0 *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->FE_LAP.,CLK,,__GET_VAR(data__->GD_IN_2,));
  F_TRIG_body__(&data__->FE_LAP);
  __SET_VAR(data__->FE_ZAG.,CLK,,__GET_VAR(data__->GD_IN_6,));
  F_TRIG_body__(&data__->FE_ZAG);
  __SET_VAR(data__->FE_XAG.,CLK,,__GET_VAR(data__->GD_IN_7,));
  F_TRIG_body__(&data__->FE_XAG);
  if (((__GET_VAR(data__->STATE,.table[(0) - (0)]) == 0) && __GET_VAR(data__->GD_IN_15,))) {
    __SET_VAR(data__->,STATE,.table[(0) - (0)],1);
  } else if (((__GET_VAR(data__->STATE,.table[(0) - (0)]) == 2) && __GET_VAR(data__->FE_LAP.Q,))) {
    __SET_VAR(data__->,STATE,.table[(0) - (0)],3);
  } else if (((__GET_VAR(data__->STATE,.table[(0) - (0)]) == 5) && __GET_VAR(data__->GD_IN_4,))) {
    __SET_VAR(data__->,STATE,.table[(0) - (0)],6);
  };
  if (((__GET_VAR(data__->STATE,.table[(1) - (0)]) == 0) && __GET_VAR(data__->GD_IN_4,))) {
    __SET_VAR(data__->,STATE,.table[(1) - (0)],1);
  } else if (((__GET_VAR(data__->STATE,.table[(1) - (0)]) == 2) && __GET_VAR(data__->GD_IN_4,))) {
    __SET_VAR(data__->,STATE,.table[(1) - (0)],3);
  } else if (((__GET_VAR(data__->STATE,.table[(1) - (0)]) == 4) && __GET_VAR(data__->FE_ZAG.Q,))) {
    __SET_VAR(data__->,STATE,.table[(1) - (0)],6);
  } else if (((__GET_VAR(data__->STATE,.table[(1) - (0)]) == 5) && __GET_VAR(data__->FE_ZAG.Q,))) {
    __SET_VAR(data__->,STATE,.table[(1) - (0)],7);
  } else if (((__GET_VAR(data__->STATE,.table[(1) - (0)]) == 12) && __GET_VAR(data__->FE_ZAG.Q,))) {
    __SET_VAR(data__->,STATE,.table[(1) - (0)],14);
  } else if (((__GET_VAR(data__->STATE,.table[(1) - (0)]) == 13) && __GET_VAR(data__->FE_ZAG.Q,))) {
    __SET_VAR(data__->,STATE,.table[(1) - (0)],15);
  } else if (((__GET_VAR(data__->STATE,.table[(1) - (0)]) == 16) && __GET_VAR(data__->FE_XAG.Q,))) {
    __SET_VAR(data__->,STATE,.table[(1) - (0)],18);
  } else if (((__GET_VAR(data__->STATE,.table[(1) - (0)]) == 17) && __GET_VAR(data__->FE_XAG.Q,))) {
    __SET_VAR(data__->,STATE,.table[(1) - (0)],19);
  } else if (((__GET_VAR(data__->STATE,.table[(1) - (0)]) == 20) && __GET_VAR(data__->FE_ZAG.Q,))) {
    __SET_VAR(data__->,STATE,.table[(1) - (0)],22);
  } else if (((__GET_VAR(data__->STATE,.table[(1) - (0)]) == 21) && __GET_VAR(data__->FE_ZAG.Q,))) {
    __SET_VAR(data__->,STATE,.table[(1) - (0)],23);
  } else if (((__GET_VAR(data__->STATE,.table[(1) - (0)]) == 26) && __GET_VAR(data__->FE_ZAG.Q,))) {
    __SET_VAR(data__->,STATE,.table[(1) - (0)],28);
  } else if (((__GET_VAR(data__->STATE,.table[(1) - (0)]) == 27) && __GET_VAR(data__->FE_ZAG.Q,))) {
    __SET_VAR(data__->,STATE,.table[(1) - (0)],29);
  } else if (((__GET_VAR(data__->STATE,.table[(1) - (0)]) == 30) && __GET_VAR(data__->FE_XAG.Q,))) {
    __SET_VAR(data__->,STATE,.table[(1) - (0)],0);
  } else if (((__GET_VAR(data__->STATE,.table[(1) - (0)]) == 31) && __GET_VAR(data__->FE_XAG.Q,))) {
    __SET_VAR(data__->,STATE,.table[(1) - (0)],2);
  };
  {
    DINT __case_expression = __GET_VAR(data__->STATE,.table[(0) - (0)]);
    if ((__case_expression == 1)) {
      __SET_VAR(data__->,GD_OUT_2,,1);
    }
    else if ((__case_expression == 3)) {
      __SET_VAR(data__->,GD_OUT_2,,0);
    }
    else if ((__case_expression == 4)) {
      __SET_VAR(data__->,GD_OUT_4_G,.table[(0) - (0)],1);
    }
    else if ((__case_expression == 6)) {
      __SET_VAR(data__->,GD_OUT_4_G,.table[(0) - (0)],0);
    }
  };
  {
    DINT __case_expression = __GET_VAR(data__->STATE,.table[(1) - (0)]);
    if ((__case_expression == 0)) {
      __SET_VAR(data__->,GD_OUT_4_G,.table[(1) - (0)],1);
    }
    else if ((__case_expression == 1)) {
      {
        DINT __case_expression = __GET_VAR(data__->SLT1,.table[(0) - (0)]);
        if ((__case_expression == 0)) {
          __SET_VAR(data__->,GD_OUT_4_G,.table[(1) - (0)],1);
        }
        else if ((__case_expression == 1)) {
          __SET_VAR(data__->,GD_OUT_6,,1);
        }
      };
      __SET_VAR(data__->,SLT1,.table[(0) - (0)],(__GET_VAR(data__->SLT1,.table[(0) - (0)]) + 1));
      if ((__GET_VAR(data__->SLT1,.table[(0) - (0)]) == 2)) {
        __SET_VAR(data__->,SLT1,.table[(0) - (0)],0);
      };
    }
    else if ((__case_expression == 3)) {
      __SET_VAR(data__->,GD_OUT_6,,1);
    }
    else if ((__case_expression == 4)) {
      __SET_VAR(data__->,GD_OUT_4_G,.table[(1) - (0)],1);
    }
    else if ((__case_expression == 6)) {
      {
        DINT __case_expression = __GET_VAR(data__->SLT1,.table[(1) - (0)]);
        if ((__case_expression == 0)) {
          __SET_VAR(data__->,GD_OUT_4_G,.table[(1) - (0)],1);
        }
        else if ((__case_expression == 1)) {
          __SET_VAR(data__->,GD_OUT_7,,1);
        }
      };
      __SET_VAR(data__->,SLT1,.table[(1) - (0)],(__GET_VAR(data__->SLT1,.table[(1) - (0)]) + 1));
      if ((__GET_VAR(data__->SLT1,.table[(1) - (0)]) == 2)) {
        __SET_VAR(data__->,SLT1,.table[(1) - (0)],0);
      };
    }
    else if ((__case_expression == 7)) {
      __SET_VAR(data__->,GD_OUT_7,,1);
    }
    else if ((__case_expression == 8)) {
      __SET_VAR(data__->,GD_OUT_4_G,.table[(1) - (0)],1);
    }
    else if ((__case_expression == 9)) {
      __SET_VAR(data__->,GD_OUT_4_G,.table[(1) - (0)],0);
    }
    else if ((__case_expression == 10)) {
      {
        DINT __case_expression = __GET_VAR(data__->SLT1,.table[(2) - (0)]);
        if ((__case_expression == 0)) {
          __SET_VAR(data__->,GD_OUT_4_G,.table[(1) - (0)],1);
        }
        else if ((__case_expression == 1)) {
          __SET_VAR(data__->,GD_OUT_6,,0);
        }
      };
      __SET_VAR(data__->,SLT1,.table[(2) - (0)],(__GET_VAR(data__->SLT1,.table[(2) - (0)]) + 1));
      if ((__GET_VAR(data__->SLT1,.table[(2) - (0)]) == 2)) {
        __SET_VAR(data__->,SLT1,.table[(2) - (0)],0);
      };
    }
    else if ((__case_expression == 11)) {
      __SET_VAR(data__->,GD_OUT_6,,0);
    }
    else if ((__case_expression == 12)) {
      __SET_VAR(data__->,GD_OUT_4_G,.table[(1) - (0)],1);
    }
    else if ((__case_expression == 14)) {
      {
        DINT __case_expression = __GET_VAR(data__->SLT1,.table[(3) - (0)]);
        if ((__case_expression == 0)) {
          __SET_VAR(data__->,GD_OUT_4_G,.table[(1) - (0)],1);
        }
        else if ((__case_expression == 1)) {
          __SET_VAR(data__->,GD_OUT_8,,1);
        }
      };
      __SET_VAR(data__->,SLT1,.table[(3) - (0)],(__GET_VAR(data__->SLT1,.table[(3) - (0)]) + 1));
      if ((__GET_VAR(data__->SLT1,.table[(3) - (0)]) == 2)) {
        __SET_VAR(data__->,SLT1,.table[(3) - (0)],0);
      };
    }
    else if ((__case_expression == 15)) {
      __SET_VAR(data__->,GD_OUT_8,,1);
    }
    else if ((__case_expression == 16)) {
      __SET_VAR(data__->,GD_OUT_4_G,.table[(1) - (0)],1);
    }
    else if ((__case_expression == 18)) {
      {
        DINT __case_expression = __GET_VAR(data__->SLT1,.table[(4) - (0)]);
        if ((__case_expression == 0)) {
          __SET_VAR(data__->,GD_OUT_4_G,.table[(1) - (0)],1);
        }
        else if ((__case_expression == 1)) {
          __SET_VAR(data__->,GD_OUT_6,,1);
        }
      };
      __SET_VAR(data__->,SLT1,.table[(4) - (0)],(__GET_VAR(data__->SLT1,.table[(4) - (0)]) + 1));
      if ((__GET_VAR(data__->SLT1,.table[(4) - (0)]) == 2)) {
        __SET_VAR(data__->,SLT1,.table[(4) - (0)],0);
      };
    }
    else if ((__case_expression == 19)) {
      __SET_VAR(data__->,GD_OUT_6,,1);
    }
    else if ((__case_expression == 20)) {
      __SET_VAR(data__->,GD_OUT_4_G,.table[(1) - (0)],1);
    }
    else if ((__case_expression == 22)) {
      {
        DINT __case_expression = __GET_VAR(data__->SLT1,.table[(5) - (0)]);
        if ((__case_expression == 0)) {
          __SET_VAR(data__->,GD_OUT_4_G,.table[(1) - (0)],1);
        }
        else if ((__case_expression == 1)) {
          __SET_VAR(data__->,GD_OUT_7,,0);
        }
      };
      __SET_VAR(data__->,SLT1,.table[(5) - (0)],(__GET_VAR(data__->SLT1,.table[(5) - (0)]) + 1));
      if ((__GET_VAR(data__->SLT1,.table[(5) - (0)]) == 2)) {
        __SET_VAR(data__->,SLT1,.table[(5) - (0)],0);
      };
    }
    else if ((__case_expression == 23)) {
      __SET_VAR(data__->,GD_OUT_7,,0);
    }
    else if ((__case_expression == 24)) {
      {
        DINT __case_expression = __GET_VAR(data__->SLT1,.table[(6) - (0)]);
        if ((__case_expression == 0)) {
          __SET_VAR(data__->,GD_OUT_4_G,.table[(1) - (0)],1);
        }
        else if ((__case_expression == 1)) {
          __SET_VAR(data__->,GD_OUT_6,,0);
        }
      };
      __SET_VAR(data__->,SLT1,.table[(6) - (0)],(__GET_VAR(data__->SLT1,.table[(6) - (0)]) + 1));
      if ((__GET_VAR(data__->SLT1,.table[(6) - (0)]) == 2)) {
        __SET_VAR(data__->,SLT1,.table[(6) - (0)],0);
      };
    }
    else if ((__case_expression == 25)) {
      __SET_VAR(data__->,GD_OUT_6,,0);
    }
    else if ((__case_expression == 26)) {
      __SET_VAR(data__->,GD_OUT_4_G,.table[(1) - (0)],1);
    }
    else if ((__case_expression == 28)) {
      {
        DINT __case_expression = __GET_VAR(data__->SLT1,.table[(7) - (0)]);
        if ((__case_expression == 0)) {
          __SET_VAR(data__->,GD_OUT_4_G,.table[(1) - (0)],1);
        }
        else if ((__case_expression == 1)) {
          __SET_VAR(data__->,GD_OUT_8,,0);
        }
      };
      __SET_VAR(data__->,SLT1,.table[(7) - (0)],(__GET_VAR(data__->SLT1,.table[(7) - (0)]) + 1));
      if ((__GET_VAR(data__->SLT1,.table[(7) - (0)]) == 2)) {
        __SET_VAR(data__->,SLT1,.table[(7) - (0)],0);
      };
    }
    else if ((__case_expression == 29)) {
      __SET_VAR(data__->,GD_OUT_8,,0);
    }
    else if ((__case_expression == 30)) {
      __SET_VAR(data__->,GD_OUT_4_G,.table[(1) - (0)],1);
    }
  };
  if ((__GET_VAR(data__->GD_OUT_4_G,.table[(0) - (0)]) != __GET_VAR(data__->GD_OUT_4_G,.table[(1) - (0)]))) {
    __SET_VAR(data__->,GD_OUT_4_G,.table[(0) - (0)],__GET_VAR(data__->GD_OUT_4,));
    __SET_VAR(data__->,GD_OUT_4_G,.table[(1) - (0)],__GET_VAR(data__->GD_OUT_4,));
  };
  __SET_VAR(data__->,AUX,,__GET_VAR(data__->GD_OUT_4_G,.table[(0) - (0)]));

  goto __end;

__end:
  return;
} // TESIS0_body__() 





