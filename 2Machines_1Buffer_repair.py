import automat_generate as ag

actuators = dict([])
actuators['M1_ON'] = 'GD_OUT_0:ON:%QX100.0'
actuators['M1_OFF'] = 'GD_OUT_0:OFF'
actuators['M2_ON'] = 'GD_OUT_1:ON:%QX100.1'
actuators['M2_OFF'] = 'GD_OUT_1:OFF'
actuators['M1_Bussy'] = 'GD_IN_0:ON:%IX100.0'
actuators['M1_NOT_Bussy'] = 'GD_IN_0:OFF:%IX100.0'
actuators['M2_Bussy'] = 'GD_IN_1:ON:%IX100.1'
actuators['M1_END'] = 'FE_M1E:GD_IN_0:%IX100.0'  # 10
actuators['M2_END'] = 'FE_M2E:GD_IN_1:%IX100.1'  # 20
actuators['start'] = 'GD_IN_15:ON:%IX100.5'
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

actuators['M1_BROKEN'] = 'GD_IN_10:OFF:%IX102.4' #12 %IX101.0 IX102.4
actuators['M2_BROKEN'] = 'GD_IN_11:OFF:%IX103.1' #22 %IX101.1
actuators['M1_REPAIR'] = 'GD_IN_12:ON:%IX102.7' #%IX101.2
actuators['M2_REPAIR'] = 'GD_IN_13:ON:%IX103.0'#%IX101.3


actuators['M1_REPAIR_OUT'] = 'INTERN_4:ON'
actuators['M2_REPAIR_OUT'] = 'INTERN_5:ON'

actuators['M1_REPAIR_DONE'] = 'INTERN_4:OFF'
actuators['M2_REPAIR_DONE'] = 'INTERN_5:OFF'


actuators['M1_REPAIR_OUT_ON'] = 'GD_OUT_12:ON:%QX101.2'
actuators['M2_REPAIR_OUT_ON'] = 'GD_OUT_13:ON:%QX101.3'
actuators['M1_REPAIR_OUT_OFF'] = 'GD_OUT_12:OFF:%QX101.2'
actuators['M2_REPAIR_OUT_OFF'] = 'GD_OUT_13:OFF:%QX101.3'

actuators['R1_PERMITED'] = 'INTERN_2:ON'
actuators['R2_PERMITED'] = 'INTERN_3:ON'

actuators['R1_NOT_PERMITED'] = 'INTERN_2:OFF'
actuators['R2_NOT_PERMITED'] = 'INTERN_3:OFF'

actuators['11'] = 'INTERN_0:ON'
actuators['21'] = 'INTERN_1:ON'  # M1_arriving


Mascaras = dict([])
Mascaras['GD_OUT_2'] = [('GD_OUT_3', '%QX100.3')]  # BANDM1 -> EMITER

Mascaras['NOT GD_IN_10'] = [('GD_OUT_10', '%QX101.0')]  # M1_BROKEN -> M1_BROKEN
Mascaras['NOT GD_IN_11'] = [('GD_OUT_11', '%QX101.1')]  # M2_BROKEN -> M2_BROKEN




new_process = ag.process('2Machines1Buffer_repair')


M1 = new_process.new_automaton('M1')
new_process.add_state(M1, 4, [], [True, True, True, True])
new_process.add_transition(M1, [(0, 1), (1, 2), (2, 3), (3, 0)],
                           ['M1_ON', 'M1_Bussy', 'M1_OFF', 'M1_END'],
                           ['M1_ON', 'M1_Bussy', 'M1_END'])  # 'M1_ON'

Buffer_llenado = new_process.new_automaton('Buffer_llenado')
new_process.add_state(Buffer_llenado, 10, [], [True, True, True, True, True, True, True, True, True, True, True])
new_process.add_transition(Buffer_llenado, [(0, 1), (1, 2), (2, 3), (3, 4), (4, 5),
                                            (5, 2), (7, 2),
                                            (5, 6), (6, 7), (7, 8), (8, 5),
                                            (1, 9), (9, 1)],
                           ['start', 'M1_END', 'Buffer_conveyor_ON', 'Piece_ready', 'Buffer_conveyor_OFF',
                            'M2_END', 'M2_END',
                            'M1_END', 'Buffer_conveyor_ON', 'Piece_located', 'Buffer_conveyor_OFF',
                            'M1_BROKEN', 'M1_END'],
                           ['start', 'M1_END', 'M2_END', 'Piece_ready', 'Piece_located', 'M1_BROKEN'])

Blade = new_process.new_automaton('Blade')
new_process.add_state(Blade, 4, [], [])
new_process.add_transition(Blade, [(0, 1), (1, 2), (2, 3), (3, 0)],
                           ['M2_END', 'Blade_OFF', 'Piece_ready', 'Blade_ON'],
                           ['M2_END', 'Piece_ready'])

generate = new_process.new_automaton('generate')
new_process.add_state(generate, 6, [], [])
new_process.add_transition(generate, [(0, 1), (1, 2), (2, 3), (3, 4), (4, 0), (1, 5), (5, 0)],
                           ['M1_Bussy', 'M1_END', 'Piece_restard_ON', 'Piece_located', 'Piece_restard_OFF',
                            'M1_BROKEN', 'M1_END'],
                           ['Piece_located', 'M1_Bussy', 'M1_END', 'M1_BROKEN', 'M1_END'])

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
new_process.add_state(REQ_M1, 3, [], [True, False, False])
new_process.add_transition(REQ_M1, [(0, 1), (1, 0), (1, 2), (2, 0)],
                           ['11', 'Piece_located', 'M1_BROKEN', 'M1_NOT_Bussy'],
                           ['Piece_located', 'M1_BROKEN', 'M1_NOT_Bussy'])
REQ_M2 = new_process.new_automaton('REQ_M2')
new_process.add_state(REQ_M2, 3, [], [True, False, False])
new_process.add_transition(REQ_M2, [(0, 1), (1, 0), (1, 2), (2, 0)],
                           ['21', 'M2_END', 'M2_BROKEN', 'M2_END'],
                           ['M2_END', 'M2_BROKEN'])

REQ_Buffer = new_process.new_automaton('REQ_Buffer')
new_process.add_state(REQ_Buffer, 3, [], [True, True, True])
new_process.add_transition(REQ_Buffer, [(0, 1), (1, 0), (1, 2), (2, 1)],
                           ['Piece_located', '21', 'Piece_located', '21'], ['Piece_located'])


REQ_repair = new_process.new_automaton('REQ_repair')
new_process.add_state(REQ_repair,2,[],[True, True])
new_process.add_transition(REQ_repair,[(0, 0), (0, 1), (1, 0)],
                           ['M1_REPAIR_OUT_ON', 'M2_BROKEN', 'M2_REPAIR_OUT_ON'],
                           ['M2_BROKEN'])

new_process.complete_spec(REQ_repair)

REQ_start = new_process.new_automaton('REQ_start')
new_process.add_state(REQ_start, 2, ["waiting", 'start'], [True, True])
new_process.add_transition(REQ_start, [(0, 1), (1, 1), (1, 1)],
                           ['start', '11', '21'], ['start'])
new_process.add_self_event(REQ_M1, 'start')

new_process.complete_spec(REQ_start)

repair = new_process.new_automaton('repair')
new_process.add_state(repair, 20, [], [True, True, True, True, True, True, True, True,
                                       True, True, True, True, True, True, True, True, True, True, True, True])
new_process.add_transition(repair, [(0, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 0),
                                    (0, 7), (7, 8), (8, 9), (9, 10), (10, 11), (11, 12), (12, 0),
                                    (2, 13), (13, 14), (14, 15), (15, 16), (16, 17), (17, 18), (18, 19), (19,1),
                                    (8, 15)
                                    ],
                           ['M1_BROKEN', 'R1_PERMITED', 'M1_REPAIR', 'M1_REPAIR_OUT', 'R1_NOT_PERMITED',
                            'M1_NOT_Bussy', 'M1_REPAIR_OUT_OFF',

                            'M2_BROKEN', 'R2_PERMITED', 'M2_REPAIR', 'M2_REPAIR_OUT', 'R2_NOT_PERMITED',
                            'M2_END', 'M2_REPAIR_OUT_OFF',

                            'M2_BROKEN', 'R1_NOT_PERMITED', 'R2_PERMITED', 'M2_REPAIR', 'M2_REPAIR_OUT', 'R2_NOT_PERMITED',
                            'M2_END', 'M2_REPAIR_OUT_OFF',

                            'M1_BROKEN'],
                           ['M1_BROKEN', 'M2_BROKEN', 'M1_REPAIR', 'M2_REPAIR','M1_NOT_Bussy', 'M2_END'])



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
spec = new_process.automata_syncronize([REQ_Buffer, REQ_start, REQ_repair, all], name_sync='spec')
sup = new_process.supcon(plant, spec, 'sup')
supdat = new_process.condat(plant, sup, 'supdat')
simsup = new_process.supreduce(plant, sup, supdat, 'simsup')

new_process.load_automata([plant, sup])

# ('21', 'M2_ON'), ('11', 'M1_ON')
AISLATED = [[M1, M2, sup_BA, generate, Buffer_llenado, Blade, repair],
            [('21', 'M2_ON'), ('11', 'M1_ON'), ('M1_REPAIR_OUT', 'M1_REPAIR_OUT_ON'),
             ('M2_REPAIR_OUT', 'M2_REPAIR_OUT_ON')]]

new_process.generate_image(
    [M1, M2, Buffer_alimentar, Blade, sup_BA, sup, plant, REQ_M1, Buffer_llenado, REQ_Buffer,
     REQ_M2, sup, REQ_repair, repair])

new_process.generate_ST_OPENPLC([sup],
                                [plant],
                                actuators, '2M1B_R', Mascaras=Mascaras, Aislados=AISLATED, initial = 'start')
new_process.print_events()
