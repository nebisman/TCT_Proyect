import automat_generate as ag

actuators = dict([])
actuators['M1_ON'] = 'GD_OUT_0:ON:%QX100.0'
actuators['M1_OFF'] = 'GD_OUT_0:OFF'
actuators['M2_ON'] = 'GD_OUT_1:ON:%QX100.1'
actuators['M2_OFF'] = 'GD_OUT_1:OFF'
actuators['M1_Bussy'] = 'GD_IN_0:ON:%IX100.0'
actuators['M2_Bussy'] = 'GD_IN_1:ON:%IX100.1'
actuators['M1_END'] = 'FE_M1E:GD_IN_0:%IX100.0'  # 10
actuators['M2_END'] = 'FE_M2E:GD_IN_1:%IX100.1'  # 20
actuators['start'] = 'GD_IN_15:ON:%IX100.15'
actuators['BA_ON'] = 'GD_OUT_2:ON:%QX100.2'
actuators['BA_OFF'] = 'GD_OUT_2:OFF'
actuators['Alimented'] = 'FE_A:GD_IN_2:%IX100.2'
actuators['Buffer_conveyor_ON'] = 'GD_OUT_4:ON:%QX100.4'
actuators['Buffer_conveyor_ON_UC'] = 'GD_OUT_4:ON:%QX100.4'
actuators['Buffer_conveyor_OFF'] = 'GD_OUT_4:OFF'
actuators['Piece_located'] = 'FE_PL:GD_IN_3:%IX100.3'
actuators['Piece_ready'] = 'FE_PR:GD_IN_4:%IX100.4'
actuators['Piece_restard_ON'] = 'GD_OUT_5:ON:%QX100.5'
actuators['Piece_restard_OFF'] = 'GD_OUT_5:OFF:%QX100.5'
actuators['Blade_ON'] = 'GD_OUT_6:ON:%QX100.6'
actuators['Blade_OFF'] = 'GD_OUT_6:OFF:%QX100.6'

actuators['11'] = 'INTERN_1:ON'
actuators['21'] = 'INTERN_2:ON'  # M1_arriving

Mascaras = dict([])
Mascaras['GD_OUT_2'] = [('GD_OUT_3', '%QX100.3')]  # BANDM1 -> EMITER

new_process = ag.process('2Machines1Buffer')

M1 = new_process.new_automaton('M1')
new_process.add_state(M1, 4, [], [True, True, True, True])
new_process.add_transition(M1, [(0, 1), (1, 2), (2, 3), (3, 0)],
                           ['M1_ON', 'M1_Bussy', 'M1_OFF', 'M1_END'],
                           ['M1_ON', 'M1_Bussy', 'M1_END'])  # 'M1_ON'

'''Buffer = new_process.new_automaton('Buffer')
new_process.add_state(Buffer, 4, [], [])
new_process.add_transition(Buffer, [(0, 1), (1, 2), (2, 3), (3,0)],
                           ['M1_END', 'Buffer_conveyor_ON', 'Piece_located'
                               , 'Buffer_conveyor_OFF'],
                           ['M1_Bussy', 'M1_END', 'Piece_located'])'''

Buffer_llenado = new_process.new_automaton('Buffer_llenado')
new_process.add_state(Buffer_llenado, 8, [], [True, True, True, True, True, True, True, True])
new_process.add_transition(Buffer_llenado, [(0, 1), (1, 2), (2, 3), (3, 4),
                                            (4, 1), (6, 1),
                                            (4, 5), (5, 6), (6, 7), (7, 4)],
                           ['M1_END', 'Buffer_conveyor_ON', 'Piece_ready', 'Buffer_conveyor_OFF',
                            'M2_END', 'M2_END',
                            'M1_END', 'Buffer_conveyor_ON', 'Piece_located', 'Buffer_conveyor_OFF'],
                           ['M1_END', 'M2_END', 'Piece_ready', 'Piece_located'])

Blade = new_process.new_automaton('Blade')
new_process.add_state(Blade,4,[],[])
new_process.add_transition(Blade, [(0, 1), (1, 2), (2, 3), (3, 0)],
                           ['M2_END', 'Blade_OFF', 'Piece_ready', 'Blade_ON'],
                           ['M2_END', 'Piece_ready'])

generate = new_process.new_automaton('generate')
new_process.add_state(generate, 5, [], [])
new_process.add_transition(generate, [(0, 1), (1, 2), (2, 3), (3, 4), (4, 0)],
                           ['M1_Bussy', 'M1_END', 'Piece_restard_ON', 'Piece_located', 'Piece_restard_OFF'],
                           ['Piece_located', 'M1_Bussy', 'M1_END'])


M2 = new_process.new_automaton('M2')
new_process.add_state(M2, 4, [], [True, True, True, True])
new_process.add_transition(M2, [(0, 1), (1, 2), (2, 3), (3, 0)],
                           ['M2_ON', 'M2_Bussy', 'M2_OFF', 'M2_END'],
                           ['M2_ON', 'M2_Bussy', 'M2_END'])

Buffer_alimentar = new_process.new_automaton('B_A')
new_process.add_state(Buffer_alimentar, 4, [], [True, True, True, True])
new_process.add_transition(Buffer_alimentar, [(0, 1), (1, 2), (2, 3), (3, 0)],
                           ['BA_ON', 'Alimented', 'BA_OFF', 'M1_END'],
                           ['Alimented', 'M1_END'])

start = new_process.new_automaton('start')
new_process.add_state(start, 2, ["waiting", 'start'], [True, True])
new_process.add_transition(start, [(0, 1), (1, 1)],
                           ['start', 'BA_ON'], ['start'])
new_process.add_self_event(Buffer_alimentar, 'start')
new_process.complete_spec(start)

REQ_M1 = new_process.new_automaton('REQ_M1')
new_process.add_state(REQ_M1, 2, [], [True, False, ])
new_process.add_transition(REQ_M1, [(0, 1), (1, 0)],
                           ['11', 'Piece_located'], ['Piece_located'])
REQ_M2 = new_process.new_automaton('REQ_M2')
new_process.add_state(REQ_M2, 2, [], [True, False, ])
new_process.add_transition(REQ_M2, [(0, 1), (1, 0)],
                           ['21', 'M2_END'], ['M2_END'])

REQ_Buffer = new_process.new_automaton('REQ_Buffer')
new_process.add_state(REQ_Buffer, 3, [], [True, True, True])
new_process.add_transition(REQ_Buffer, [(0, 1), (1, 0), (1, 2), (2, 1)],
                           ['Piece_located', '21', 'Piece_located', '21'], ['Piece_located'])

REQ_start = new_process.new_automaton('REQ_start')
new_process.add_state(REQ_start, 2, ["waiting", 'start'], [True, True])
new_process.add_transition(REQ_start, [(0, 1), (1, 1), (1, 1)],
                           ['start', '11', '21'], ['start'])
new_process.add_self_event(REQ_M1, 'start')
new_process.complete_spec(REQ_start)

new_process.generate_all_automata()

plant_BA = new_process.automata_syncronize([Buffer_alimentar], name_sync='plant_BA')
all_BA = new_process.all_events(plant_BA, 'all_BA')
spec_BA = new_process.automata_syncronize([start, all_BA], name_sync='spec_BA')
sup_BA = new_process.supcon(plant_BA, spec_BA, 'sup_BA')
supdat_BA = new_process.condat(plant_BA, sup_BA, 'supdat_BA')
simsup_2 = new_process.supreduce(plant_BA, sup_BA, supdat_BA, 'simsup_BA')

new_process.load_automata([plant_BA, sup_BA])

plant = new_process.automata_syncronize([REQ_M1, REQ_M2], name_sync='plant')
all = new_process.all_events(plant, 'all')
spec = new_process.automata_syncronize([REQ_Buffer, REQ_start, all], name_sync='spec')
sup = new_process.supcon(plant, spec, 'sup')
supdat = new_process.condat(plant, sup, 'supdat')
simsup = new_process.supreduce(plant, sup, supdat, 'simsup')

new_process.load_automata([plant, sup])



#('21', 'M2_ON')
AISLATED = [[M1, sup_BA, generate, Buffer_llenado, Blade], [('11', 'M1_ON')]]

new_process.generate_image([M1, M2, Buffer_alimentar, Blade, sup_BA, sup, plant, REQ_M1, Buffer_llenado,REQ_Buffer,REQ_M1])

new_process.generate_ST_OPENPLC([sup],
                                [plant],
                                actuators, '2M1B', Mascaras=Mascaras, Aislados=AISLATED)
new_process.print_events()
