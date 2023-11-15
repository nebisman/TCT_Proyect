import automat_generate as ag

actuators = dict([])

actuators['1'] = 'INTERN_0:ON'
actuators['1_OFF'] = 'INTERN_0:OFF'
actuators['2'] = 'RE_M1:GD_IN_1:%IX100.1'  # M1_arriving
actuators['M2_END'] = 'FE_M2E:GD_IN_6:%IX100.6'#4
actuators['Piece_out'] = 'FE_PO:GD_IN_9:%IX100.9' #6
actuators['Piece_reprocessed'] = 'FE_PR:GD_IN_10:%IX100.10' #8
actuators['M2_ON'] = 'GD_OUT_7:ON:%QX100.7' #3
actuators['M2_OFF'] = 'GD_OUT_7:OFF'
actuators['M2_Bussy'] = 'GD_IN_6:ON:%IX100.6'
actuators['Piece_at_review'] = 'FE_CP:GD_IN_7:%IX100.7'  # M1_arriving
actuators['Piece_at_TU'] = 'RE_CP:GD_IN_7:%IX100.7'  # M1_arriving
actuators['M1_BAND_ON'] = 'GD_OUT_0:ON:%QX100.0'
actuators['M1_BAND_OFF'] = 'GD_OUT_0:OFF'
actuators['M1_arrived'] = 'FE_M1:GD_IN_1:%IX100.1'

"""actuators['M1_EMITER_ON'] = 'GD_OUT_1:ON:%QX100.1'
actuators['M1_EMITER_OFF'] = 'GD_OUT_1:OFF'
actuators['M1_ARM_ON'] = 'GD_OUT_2:ON:%QX100.2'
actuators['M1_ARM_OFF'] = 'GD_OUT_2:OFF'
actuators['M1_ARM_SPEED_ON'] = 'GD_OUT_3:ON:%QX100.3'
actuators['M1_ARM_SPEED_OFF'] = 'GD_OUT_3:OFF'"""
Mascaras = dict([])
Mascaras['GD_OUT_0'] = [('GD_OUT_1', '%QX100.1'), ('GD_OUT_2', '%QX100.2'), ('GD_OUT_3', '%QX100.3')] #BANDM1 -> ARM_M1, ARM_SPEED_M1
Mascaras['GD_OUT_10'] =[('GD_OUT_11','%QX100.11')] #ARM_TU -> ARMSPEED_TU

actuators['Clamp_on'] = 'GD_OUT_4:ON:%QX100.4'
actuators['Clamp_off'] = 'GD_OUT_4:OFF'
actuators['Clamped'] = "GD_IN_2:ON:%IX100.2"
actuators['Piece_at_buffer'] = 'FE_B1:GD_IN_3:%IX100.3'
actuators['BUFFER_BAND_ON'] = 'GD_OUT_5:ON:%QX100.5'
actuators['BUFFER_BAND_OFF'] = 'GD_OUT_5:OFF'
actuators['BLADE_ON'] = 'GD_OUT_6:ON:%QX100.6'
actuators['BLADE_OFF'] = 'GD_OUT_6:OFF'
actuators['BLADE_LIMIT'] = 'GD_IN_4:ON:%IX100.4'
actuators['Buffer_out'] = 'FE_B1O:GD_IN_5:%IX100.5'
actuators['BUFFER2_BAND_ON'] = 'GD_OUT_8:ON:%QX100.8'
actuators['BUFFER2_BAND_OFF'] = 'GD_OUT_8:OFF'
actuators['TU_BAND_ON'] = 'GD_OUT_9:ON:%QX100.9' #5
actuators['TU_BAND_OFF'] = 'GD_OUT_9:OFF'
actuators['TU_ARM_ON'] = 'GD_OUT_10:ON:%QX100.10'
actuators['TU_ARM_OFF'] = 'GD_OUT_10:OFF'
actuators['Piece_right'] = 'GD_IN_8:ON:%IX100.8'
actuators['Piece_wrong'] = 'GD_IN_8:OFF'

new_process = ag.process('PRUEBAS')


M1_REQ = new_process.new_automaton('M1_REQ')
new_process.add_state(M1_REQ,2,[],[True])
new_process.add_transition(M1_REQ,[(0,1),(1,0)],['1', '2'],['2'])

M2_REQ = new_process.new_automaton('M2_REQ')
new_process.add_state(M2_REQ,2,[],[True])
new_process.add_transition(M2_REQ,[(0,1),(1,0)],['M2_ON', 'M2_END'],['M2_END'])

TU_REQ = new_process.new_automaton('TU_REQ')
new_process.add_state(TU_REQ,2,[],[True])
new_process.add_transition(TU_REQ,[(0,1),(1,0),(1,0)],['TU_BAND_ON','Piece_out', 'Piece_reprocessed'],
                           ['Piece_out', 'Piece_reprocessed'])

B1SP = new_process.new_automaton('B1SP')
new_process.add_state(B1SP,2,[],[True])
new_process.add_transition(B1SP,[(0,1), (0,1), (1,0)],['2', 'Piece_reprocessed', 'M2_ON'], #2,8,3
                           ['2','Piece_reprocessed'])

B2SP = new_process.new_automaton('B2SP')#EVENT 5
new_process.add_state(B2SP, 2, [], [True])
new_process.add_transition(B2SP, [(0, 1), (1, 0)], ['M2_END', 'TU_BAND_ON'], ['M2_END']) #4,5


'''new_process.complete_spec(B1SP)
new_process.complete_spec(B2SP)'''

new_process.generate_all_automata()


plant = new_process.automata_syncronize([M1_REQ, M2_REQ, TU_REQ], name_sync='plant')
all = new_process.all_events(plant, 'all')
spec = new_process.automata_syncronize([B1SP, all], name_sync='spec')
sup = new_process.supcon(plant, spec, 'sup')
supdat = new_process.condat(plant, sup, 'supdat')
simsup = new_process.supreduce(plant, sup, supdat, 'simsup')

new_process.load_automata([plant, sup])

plant2 = new_process.automata_syncronize([M2_REQ, TU_REQ], name_sync='plant2')
all2 = new_process.all_events(plant2, 'all2')
spec2 = new_process.automata_syncronize([B2SP, all2], name_sync='spec2')
sup2 = new_process.supcon(plant2, spec2, 'sup2')
supdat2 = new_process.condat(plant2, sup2, 'supdat2')
simsup2 = new_process.supreduce(plant2, sup2, supdat2, 'simsup2')

new_process.load_automata([plant2, sup2])

new_process.plot_automatas([plant,plant2,spec2,spec,sup,sup2, B2SP, B1SP ,M1_REQ,M2_REQ,TU_REQ], show=False)

new_process.print_events(actuators=actuators)