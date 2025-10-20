import STSupervisorTCT as stst

actuators = dict([])
actuators['s_0'] = 'GD_OUT_0:ON:%QX100.0'
actuators['s_1'] = 'GD_OUT_1:ON:%QX100.1'
actuators['e_0'] = 'GD_IN_0:ON:%IX100.0'
actuators['e_1'] = 'GD_IN_1:ON:%IX100.1'

new_ststprocess = stst.process('exampleSIMSUP')

M_0 = new_ststprocess.new_automaton('M_0')
new_ststprocess.add_state(automaton_name=M_0, number_of_states=2, names=[], marked=[True,True])
new_ststprocess.add_transition(automaton_name=M_0, transitions=[(0, 1), (1, 0)], events=["s_0", "e_0"],
                               uncontrollable=['e_0'])

M_1 = new_ststprocess.new_automaton('M_1')

new_ststprocess.add_state(automaton_name=M_1, number_of_states=2, names=[], marked=[True,True])
new_ststprocess.add_transition(automaton_name=M_1, transitions=[(0, 1), (1, 0)], events=["s_1", "e_1"],
                               uncontrollable=['e_1'])

Buffer_1_REQ = new_ststprocess.new_automaton('Buffer_1_REQ')
new_ststprocess.add_state(automaton_name=Buffer_1_REQ, number_of_states=2, names=[], marked=[True, False])
new_ststprocess.add_transition(automaton_name=Buffer_1_REQ, transitions=[(0, 1), (1, 0)], events=["e_0", "s_1"],
                               uncontrollable=['e_0'])

new_ststprocess.generate_all_automata()

PLANT = new_ststprocess.automata_syncronize(automata_names=[M_0, M_1], name_sync='PLANT')
ALL = new_ststprocess.all_events(automata_name=PLANT, alleventsname='ALL')
SPEC = new_ststprocess.automata_syncronize(automata_names=[Buffer_1_REQ, ALL], name_sync='SPEC')
SUP = new_ststprocess.supcon(PLANT, SPEC, 'SUP')
SUPDAT = new_ststprocess.condat(PLANT, SUP, 'SUPDAT')
SIMSUP = new_ststprocess.supreduce(PLANT, SUP, SUPDAT, 'SIMSUP')

new_ststprocess.plot_automatas([PLANT, ALL, SPEC, SUP, SIMSUP, M_0, M_1], 2, True)

new_ststprocess.load_automata([SUP, PLANT, SIMSUP])
new_ststprocess.generate_ST_OPENPLC([SUP],[PLANT], actuators, 'example')