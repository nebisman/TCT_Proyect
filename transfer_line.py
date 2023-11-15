import automat_generate as ag

actuators = dict([])

actuators['start'] = 'GD_IN_0:ON:%IX100.0'
actuators['2'] = 'RE_M1:GD_IN_1:%IX100.1'  # M1_arriving
actuators['M2_END'] = 'FE_M2E:GD_IN_6:%IX100.6'  # 4
actuators['Piece_out'] = 'FE_PO:GD_IN_9:%IX100.9'  # 6
actuators['Piece_reprocessed'] = 'FE_PR:GD_IN_10:%IX100.10'  # 8
actuators['M2_ON'] = 'GD_OUT_7:ON:%QX100.7'  # 3
actuators['M2_OFF'] = 'GD_OUT_7:OFF'
actuators['M2_Bussy'] = 'GD_IN_6:ON:%IX100.6'
actuators['Piece_at_review'] = 'FE_CP:GD_IN_7:%IX100.7'  # M1_arriving
actuators['Piece_at_TU'] = 'RE_CP:GD_IN_7:%IX100.7'  # M1_arriving
actuators['M1_BAND_ON'] = 'GD_OUT_0:ON:%QX100.0'  # 1
actuators['M1_BAND_OFF'] = 'GD_OUT_0:OFF'
actuators['M1_arrived'] = 'FE_M1:GD_IN_1:%IX100.1'
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
actuators['TU_BAND_ON'] = 'GD_OUT_9:ON:%QX100.9'  # 5
actuators['TU_BAND_OFF'] = 'GD_OUT_9:OFF'
actuators['TU_ARM_ON'] = 'GD_OUT_10:ON:%QX100.10'
actuators['TU_ARM_OFF'] = 'GD_OUT_10:OFF'
actuators['Piece_right'] = 'GD_IN_8:ON:%IX100.8'
actuators['Piece_wrong'] = 'GD_IN_8:OFF'

Mascaras = dict([])
Mascaras['GD_OUT_0'] = [('GD_OUT_1', '%QX100.1'), ('GD_OUT_2', '%QX100.2'),
                        ('GD_OUT_3', '%QX100.3')]  # BANDM1 -> ARM_M1, ARM_SPEED_M1
Mascaras['GD_OUT_10'] = [('GD_OUT_11', '%QX100.11')]  # ARM_TU -> ARMSPEED_TU

new_process = ag.process('TRANSFER_LINE')

# sup_M1

Banda_M1 = new_process.new_automaton('Banda_M1')
new_process.add_state(Banda_M1, 2, [], [True, True])
new_process.add_transition(Banda_M1, [(0, 1), (1, 0)], ['M1_BAND_ON', 'M1_BAND_OFF'],  # 1
                           ['M1_BAND_ON'])

M1_piece = new_process.new_automaton('M1_piece')
new_process.add_state(M1_piece, 2, [], [True, True])
new_process.add_transition(M1_piece, [(0, 1), (1, 0)], ['M1_arrived', 'M1_BAND_OFF'], ['M1_arrived'])
new_process.add_self_event(Banda_M1, 'M1_arrived')

# BUFFER 1

Clamp = new_process.new_automaton('Clamp')
new_process.add_state(Clamp, 2, [], [True, True])
new_process.add_transition(Clamp, [(0, 1), (1, 0)],
                           ["Clamp_on", "Clamp_off"],
                           [])

Blade = new_process.new_automaton('Blade')
new_process.add_state(Blade, 2, [], [True, True])
new_process.add_transition(Blade, [(0, 1), (1, 0)],
                           ["BLADE_ON", "BLADE_OFF"], [])

Clamp_REQ = new_process.new_automaton('Camp_REQ')
new_process.add_state(Clamp_REQ, 3, ["Encendido", "esperando", "apagado"], [True, True, True])
new_process.add_transition(Clamp_REQ, [(0, 1), (1, 2), (2, 0)],
                           ["Clamp_on", "Clamped", "Clamp_off"],
                           ['Clamped'])
new_process.add_self_event(Clamp, 'Clamped')

Banda_buffer = new_process.new_automaton('Banda_buffer')
new_process.add_state(Banda_buffer, 2, [], [True, True])
new_process.add_transition(Banda_buffer, [(0, 1), (1, 0)], ['BUFFER_BAND_ON', 'BUFFER_BAND_OFF'],
                           [])

Buffer_join = new_process.new_automaton('Buffer_join')
new_process.add_state(Buffer_join, 12, [],
                      [True, True, True, True, True, True, True, True, True, True, True, True])
new_process.add_transition(Buffer_join, [(0, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 7), (7, 8), (8, 9),
                                         (9, 10), (10, 11), (11, 0)],
                           ['BUFFER_BAND_ON', 'Piece_at_buffer', "BUFFER_BAND_OFF", 'Clamp_on', 'Clamp_off',
                            'BLADE_ON', 'BLADE_LIMIT', 'BUFFER_BAND_ON', 'Buffer_out', "BUFFER_BAND_OFF", 'BLADE_OFF',
                            'BLADE_LIMIT'],
                           ['Piece_at_buffer', 'Buffer_out'])
new_process.add_self_event(Banda_buffer, 'Piece_at_buffer')
new_process.add_self_event(Banda_buffer, 'Buffer_out')
new_process.add_self_event(Blade, 'BLADE_LIMIT')

event_2 = new_process.new_automaton('event_2')
new_process.add_state(event_2, 3, [], [True, True, True])
new_process.add_transition(event_2, [(0, 1), (1, 2), (2, 0), (2, 2)], ['2', 'BUFFER_BAND_ON', 'Buffer_out',
                                                                       'BUFFER_BAND_ON'],
                           ['2', 'Buffer_out'])
new_process.add_self_event(Banda_buffer, '2')

# M2


M2 = new_process.new_automaton('M2')
new_process.add_state(M2, 4, [], [True, True, True, True])
new_process.add_transition(M2, [(0, 1), (1, 2), (2, 3), (3, 0)], ['M2_ON', 'M2_Bussy', 'M2_OFF', 'M2_END'],
                           ['M2_ON', 'M2_Bussy', 'M2_END'])

# B2
Banda_buffer2 = new_process.new_automaton('Banda_buffer2')
new_process.add_state(Banda_buffer2, 2, [], [True, True])
new_process.add_transition(Banda_buffer2, [(0, 1), (1, 0)], ['BUFFER2_BAND_ON', 'BUFFER2_BAND_OFF'],
                           [])

Buffer2_join = new_process.new_automaton('Buffer2_join')
new_process.add_state(Buffer2_join, 4, [], [True, True, True, True])
new_process.add_transition(Buffer2_join, [(0, 1), (1, 2), (2, 3), (3, 0)],
                           ['M2_END','BUFFER2_BAND_ON', 'Piece_at_TU', 'BUFFER2_BAND_OFF']
                           , ['Piece_at_TU','M2_END'])
new_process.add_self_events(Banda_buffer2, ['Piece_at_TU','M2_END'])

# TU


Banda_TU = new_process.new_automaton('Banda_TU')
new_process.add_state(Banda_TU, 2, [], [True, True])
new_process.add_transition(Banda_TU, [(0, 1), (1, 0)], ['TU_BAND_ON', 'TU_BAND_OFF'],
                           ['TU_BAND_ON'])

ARM_TU = new_process.new_automaton('ARM_TU')
new_process.add_state(ARM_TU, 2, [], [True, True])
new_process.add_transition(ARM_TU, [(0, 1), (1, 0)], ['TU_ARM_ON', 'TU_ARM_OFF'],
                           [])

TU_Function = new_process.new_automaton('TU_Function')
new_process.add_state(TU_Function, 9, [], [True, True, True, True, True, True, True, True, True])
new_process.add_transition(TU_Function, [(0, 1), (1, 2),
                                         (2, 3), (3, 4), (4, 0),
                                         (2, 5), (5, 6), (6, 7), (7, 8), (8, 0)],
                           ['TU_BAND_ON', 'Piece_at_review',  # Piece_at_TU ->5
                            'Piece_right', 'Piece_out', 'TU_BAND_OFF',
                            'Piece_wrong', 'TU_ARM_ON', 'Piece_reprocessed', 'TU_ARM_OFF', 'TU_BAND_OFF'],
                           ['TU_BAND_ON', 'Piece_at_review', 'Piece_right', 'Piece_out', 'Piece_reprocessed',
                            'Piece_wrong'])
new_process.add_self_events(Banda_TU,
                            ['Piece_at_review', 'Piece_right', 'Piece_out', 'Piece_reprocessed', 'Piece_wrong'])

actuators['1'] = 'INTERN_1:ON'
actuators['3'] = 'INTERN_3:ON'  # M1_arriving
actuators['5'] = 'INTERN_5:ON'  # M1_arriving

M1_REQ = new_process.new_automaton('M1_REQ')
new_process.add_state(M1_REQ, 2, [], [True])
new_process.add_transition(M1_REQ, [(0, 1), (1, 0)], ['1', '2'], ['2'])

M2_REQ = new_process.new_automaton('M2_REQ')
new_process.add_state(M2_REQ, 2, [], [True])
new_process.add_transition(M2_REQ, [(0, 1), (1, 0)], ['3', 'Piece_at_TU'], ['Piece_at_TU'])

TU_REQ = new_process.new_automaton('TU_REQ')
new_process.add_state(TU_REQ, 2, [], [True])
new_process.add_transition(TU_REQ, [(0, 1), (1, 0), (1, 0)], ['5', 'Piece_out', 'Piece_reprocessed'],
                           ['Piece_out', 'Piece_reprocessed'])

B1SP = new_process.new_automaton('B1SP')
new_process.add_state(B1SP, 2, [], [True])
new_process.add_transition(B1SP, [(0, 1), (0, 1), (1, 0)], ['2', 'Piece_reprocessed', '3'],  # 2,8,3
                           ['2', 'Piece_reprocessed'])

B2SP = new_process.new_automaton('B2SP')  # EVENT 5
new_process.add_state(B2SP, 2, [], [True])
new_process.add_transition(B2SP, [(0, 1), (1, 0)], ['Piece_at_TU', '5'], ['Piece_at_TU'])  # 4,5

new_process.complete_spec(TU_Function)
new_process.complete_spec(Buffer2_join)
# new_process.complete_spec(M1_join)
new_process.complete_spec(M1_piece)
# new_process.complete_spec(start)
new_process.complete_spec(Clamp_REQ)
new_process.complete_spec(Buffer_join)
new_process.complete_spec(event_2)

new_process.generate_all_automata()

Plant_M1 = new_process.automata_syncronize([Banda_M1], name_sync='Plant_M1')  # , ARM_M1, ARM_M1_SPEED, Emiter_M1
allm1 = new_process.all_events(Plant_M1, 'allm1')
specm1 = new_process.automata_syncronize([M1_piece, allm1], name_sync='specm1')  # , start,
sup_M1 = new_process.supcon(Plant_M1, specm1, 'sup_M1')
supdatm1 = new_process.condat(Plant_M1, sup_M1, 'supdatm1')
simsupm1 = new_process.supreduce(Plant_M1, sup_M1, supdatm1, 'simsupm1')

new_process.load_automata([sup_M1, Plant_M1])

Plant_Buffer_1 = new_process.automata_syncronize([Banda_buffer, Clamp, Blade], name_sync='Plant_Buffer_1')
allb1 = new_process.all_events(Plant_Buffer_1, 'allb1')
specb1 = new_process.automata_syncronize([event_2, Buffer_join, Clamp_REQ, allb1], name_sync='specb1')
sup_B1 = new_process.supcon(Plant_Buffer_1, specb1, 'sup_B1')
supdatb1 = new_process.condat(Plant_Buffer_1, sup_B1, 'supdatb1')
simsupb1 = new_process.supreduce(Plant_Buffer_1, sup_B1, supdatb1, 'simsupb1')

new_process.load_automata([sup_B1, Plant_Buffer_1])

Plant_Buffer_2 = new_process.automata_syncronize([Banda_buffer2], name_sync='Plant_Buffer_2')
allb2 = new_process.all_events(Plant_Buffer_2, 'allb2')
specb2 = new_process.automata_syncronize([Buffer2_join, allb2], name_sync='specb2')
sup_B2 = new_process.supcon(Plant_Buffer_2, specb2, 'sup_B2')
supdatb2 = new_process.condat(Plant_Buffer_2, sup_B2, 'supdatb2')
simsupb2 = new_process.supreduce(Plant_Buffer_2, sup_B2, supdatb2, 'simsupb2')

new_process.load_automata([Plant_Buffer_2, sup_B2])

Plant_TU = new_process.automata_syncronize([Banda_TU, ARM_TU], name_sync='Plant_TU')
alltu = new_process.all_events(Plant_TU, 'alltu')
spectu = new_process.automata_syncronize([TU_Function, alltu], name_sync='spectu')
sup_TU = new_process.supcon(Plant_TU, spectu, 'sup_TU')
supdattu = new_process.condat(Plant_TU, sup_TU, 'supdatTU')
simsuptu = new_process.supreduce(Plant_TU, sup_TU, supdattu, 'simsuptu')

new_process.load_automata([Plant_TU, sup_TU])

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

new_process.plot_automatas([plant, plant2, spec2, spec, sup, sup2, B2SP, B1SP, M1_REQ, M2_REQ, TU_REQ, Buffer2_join],
                           show=False)

start = new_process.new_automaton('start')
new_process.add_state(start, 2, ["waiting", 'start'], [False, True])
new_process.add_transition(start, [(0, 1), (1, 1), (1, 1), (1, 1)],
                           ['start', '1', '3', '5'], ['start'])
new_process.add_self_event(M2_REQ, 'start')
new_process.complete_spec(start)
new_process.generate_all_automata()

plant_2 = new_process.automata_syncronize([M1_REQ, M2_REQ, TU_REQ], name_sync='plant_2')
all_2 = new_process.all_events(plant_2, 'all_2')
spec_2 = new_process.automata_syncronize([start, B1SP, all_2], name_sync='spec_2')
sup_2 = new_process.supcon(plant_2, spec_2, 'sup_2')
supdat_2 = new_process.condat(plant_2, sup_2, 'supdat_2')
simsup_2 = new_process.supreduce(plant_2, sup_2, supdat_2, 'simsup_2')

new_process.load_automata([plant_2, sup_2])

plant2_2 = new_process.automata_syncronize([M2_REQ, TU_REQ], name_sync='plant2_2')
all2_2 = new_process.all_events(plant2_2, 'all2_2')
spec2_2 = new_process.automata_syncronize([start, B2SP, all2_2], name_sync='spec2_2')
sup2_2 = new_process.supcon(plant2_2, spec2_2, 'sup2_2')
supdat2_2 = new_process.condat(plant2_2, sup2_2, 'supdat2_2')
simsup2_2 = new_process.supreduce(plant2_2, sup2_2, supdat2_2, 'simsup2_2')

new_process.load_automata([plant2_2, sup2_2])

# new_process.plot_automatas([plant,spec,sup, spec2, plant2, sup2], 2, True)

# new_process.generate_ST_OPENPLC([sup,sup2],[plant,plant2],actuators,'gigante', Mascaras)


new_process.plot_automatas(
    [Banda_M1, sup_M1, Plant_M1, specm1, M1_piece], 2, False)  # , Emiter_M1, ARM_M1, ARM_M1_SPEED, M1_join
new_process.plot_automatas([Blade, Buffer_join, Banda_buffer, Clamp, specb1, sup_B1, Plant_Buffer_1], show=False)
new_process.plot_automatas([M2], show=False)
new_process.plot_automatas([Plant_Buffer_2, sup_B2, specb2], show=False)
new_process.plot_automatas([Plant_TU, sup_TU, spectu], show=False)
new_process.plot_automatas([plant, plant2, spec2, spec, sup, sup2, B2SP, B1SP], show=False)
new_process.plot_automatas([plant_2, plant2_2, spec2_2, spec_2, sup_2, sup2_2], show=False)

AISLATED = [[sup_M1, sup_B1, M2, sup_B2, sup_TU], [('1', 'M1_BAND_ON'), ('3', 'M2_ON'), ('5', 'TU_BAND_ON')]]

new_process.generate_ST_OPENPLC([sup_2, sup2_2],
                                [plant_2, plant2_2],
                                actuators, 'transfer_line', Mascaras, AISLATED)
new_process.generate_ST_OPENPLC([sup_B2], [Plant_Buffer_2], actuators, 'prueba')
new_process.print_events()
