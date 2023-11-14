import automat_generate as ag

actuators = dict([])
actuators['lids_conveyor_on'] = 'GD_OUT_2:ON:%QX100.2'
actuators['lids_conveyor_off'] = 'GD_OUT_2:OFF'
actuators['bases_conveyor_on'] = 'GD_OUT_3:ON:%QX100.3'
actuators['bases_conveyor_off'] = 'GD_OUT_3:OFF'
actuators['clamp_lid_on'] = 'GD_OUT_4:ON:%QX100.4'
actuators['clamp_lid_off'] = 'GD_OUT_4:OFF'
actuators['clamp_base_on'] = 'GD_OUT_5:ON:%QX100.5'
actuators['clamp_base_off'] = 'GD_OUT_5:OFF'
actuators['z_axis_on'] = 'GD_OUT_6:ON:%QX100.6'
actuators['z_axis_off'] = 'GD_OUT_6:OFF'
actuators['grab_on'] = 'GD_OUT_7:ON:%QX100.7'
actuators['grab_off'] = 'GD_OUT_7:OFF'
actuators['x_axis_on'] = 'GD_OUT_8:ON:%QX100.8'
actuators['x_axis_off'] = 'GD_OUT_8:OFF'
actuators['blade_on'] = 'GD_OUT_9:ON:%QX100.9'
actuators['blade_off'] = 'GD_OUT_9:OFF'
actuators['start'] = 'GD_IN_15:ON:%IX100.15'
actuators['lid_at_place_FE'] = 'FE_LaP:GD_IN_2:%IX100.2'
actuators['lid_clampled'] = "GD_IN_4:ON:%IX100.4"
actuators['base_at_place_FE'] = 'FE_BaP:GD_IN_3:%IX100.3'
actuators['part_leaving_FE'] = 'FE_PaL:GD_IN_9:%IX100.9'
actuators['base_clampled'] = "GD_IN_5:ON:%IX100.5"
actuators['z_movement_finish'] = 'FE_Zag:GD_IN_6:%IX100.6'
actuators['x_movement_finish'] = 'FE_Xag:GD_IN_7:%IX100.7'
actuators['blade_pos_limit'] = 'GD_IN_8:ON:%IX100.8'

new_process = ag.process('PLANTA1')
new_process2 = ag.process('EJEMPLO1')
M1 = new_process2.new_automaton('M1_join')
new_process2.add_state(M1, 3, ['I1', 'D1', 'P1'], [True])
new_process2.add_transition(M1, [(0, 2), (2, 0), (2, 1), (1, 0)],
                           ['start1', 'end1', 'breakdown1', 'repair1'], uncontrollable=['end1', 'breakdown1'])

M2 = new_process2.new_automaton('M2')
new_process2.add_state(M2, 3, ['I2', 'D2', 'P2'], [True])
new_process2.add_transition(M2, [(0, 2), (2, 0), (2, 1), (1, 0)],
                           ['start2', 'end2', 'breakdown2', 'repair2'], uncontrollable=['end2', 'breakdown2'])
buffer = new_process2.new_automaton('buffer')
new_process2.add_state(buffer, 3, ['empty', 'inter', 'full'], [True, True, True])
new_process2.add_transition(buffer, [(0, 1), (1, 2), (2, 1), (1, 0)],
                           ['end1', 'end1', 'start2', 'start2'], uncontrollable=['end1'])

repair = new_process2.new_automaton('repair')
new_process2.add_state(repair, 2, ['2ok', '2down'], [True, True])
new_process2.add_transition(repair, [(0, 0), (0, 1), (1, 0)],
                           ['repair1', 'breakdown2', 'repair2'], uncontrollable=['breakdown2'])
new_process2.generate_all_automata()

Lids_conveyor = new_process.new_automaton('lids_conveyor')
new_process.add_state(Lids_conveyor, 2, ['lids_on', 'lids_off'], marked=[True, True])
new_process.add_transition(Lids_conveyor, [(0, 1), (1, 0)],
                           ['lids_conveyor_on', 'lids_conveyor_off'],
                           uncontrollable=[])
start = new_process.new_automaton('start')
new_process.add_state(start, 2, ["waiting", 'start'], [False, True])
new_process.add_transition(start, [(0, 1), (1, 1)],
                           ['start', 'lids_conveyor_on'], ['start'])
new_process.add_self_event(Lids_conveyor, 'start')

Clamp_lid = new_process.new_automaton('clamp_lid')
new_process.add_state(Clamp_lid, 2, names=["clamp_lid_off", "clamp_lid_on"],
                      marked=[True, True])
new_process.add_transition(Clamp_lid, [(0, 1), (1, 0)],
                           ["clamp_lid_on", "clamp_lid_off"],
                           uncontrollable=[])

Clamp_lid_REQ = new_process.new_automaton('clamp_lid_REQ')
new_process.add_state(Clamp_lid_REQ, 3, names=["Encendido", "esperando", "apagado"], marked=[True,False,False])
new_process.add_transition(Clamp_lid_REQ, [(0, 1), (1, 2), (2, 0)],
                           ["clamp_lid_on", "lid_clampled", "clamp_lid_off"],
                           uncontrollable=['lid_clampled'])
new_process.add_self_event(Clamp_lid, 'lid_clampled')

buffer_lid = new_process.new_automaton('buffer_lid')
new_process.add_state(buffer_lid, 5, ["enciende", "esperando", " llega_lids", "parar_banda", "encender_garra"],
                      [True])
new_process.add_transition(buffer_lid, [(0, 1), (1, 2), (2, 3), (3, 4), (4, 0)],
                           ['lids_conveyor_on', 'lid_at_place_FE', "lids_conveyor_off", 'clamp_lid_on', 'clamp_lid_off'],
                           ['lid_at_place_FE'])

new_process.add_self_event(Clamp_lid, 'lid_at_place_FE')
new_process.add_self_event(Lids_conveyor, 'lid_at_place_FE')

Grab = new_process.new_automaton('grab')
new_process.add_state(Grab, 2, names=["grab_off", "grab_on"], marked=[True, True])
new_process.add_transition(Grab, [(0, 1), (1, 0)],
                           ["grab_on", "grab_off"],
                           uncontrollable=[])

z_axis = new_process.new_automaton('z_axis')
new_process.add_state(z_axis, 4, names=["recogido", '1', "extendido", '0'],
                      marked=[True, True, True, True])
new_process.add_transition(z_axis, [(0, 1), (1, 2), (2, 3), (3, 0)],
                           ["z_axis_on", 'z_movement_finish', "z_axis_off", 'z_movement_finish'],
                           uncontrollable=['z_movement_finish'])

x_axis = new_process.new_automaton('x_axis')
new_process.add_state(x_axis, 4, names=["recogido", '1', "extendido", '0'],
                      marked=[True, True, True, True])
new_process.add_transition(x_axis, [(0, 1), (1, 2), (2, 3), (3, 0)],
                           ["x_axis_on", 'x_movement_finish', "x_axis_off", 'x_movement_finish'],
                           uncontrollable=['x_movement_finish'])

buffer_arm = new_process.new_automaton('buffer_arm')
new_process.add_state(buffer_arm, 16, list(range(0, 16)),
                      [True, False, False, False, False, False, False])
new_process.add_transition(buffer_arm, [(0, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 7), (7, 8), (8, 9),
                                        (9, 10), (10, 11), (11, 12), (12, 13), (13, 14), (14, 15), (15, 0)],
                           ['lid_clampled', 'z_axis_on', 'z_movement_finish', 'grab_on', 'clamp_lid_off', 'z_axis_off',
                            'z_movement_finish',   'x_axis_on', 'x_movement_finish', 'z_axis_on', 'z_movement_finish',
                            'grab_off', 'z_axis_off', 'z_movement_finish', 'x_axis_off', 'x_movement_finish'],
                           ['lid_clampled', 'z_movement_finish', 'x_movement_finish'])

Base_conveyor = new_process.new_automaton('base_conveyor')
new_process.add_state(Base_conveyor, 2, ['lids_on', 'lids_off'], marked=[True, True])
new_process.add_transition(Base_conveyor, [(0, 1), (1, 0)],
                           ['bases_conveyor_on', 'bases_conveyor_off'],
                           uncontrollable=[])

Clamp_base = new_process.new_automaton('clamp_base')
new_process.add_state(Clamp_base, 2, names=["clamp_base_off", "clamp_base_on"],
                      marked=[True, True])
new_process.add_transition(Clamp_base, [(0, 1), (1, 0)],
                           ["clamp_base_on", "clamp_base_off"],
                           uncontrollable=[])

Clamp_base_REQ = new_process.new_automaton('clamp_base_REQ')
new_process.add_state(Clamp_base_REQ, 3, names=["Encendido", "esperando", "apagado"], marked=[True,False,False])
new_process.add_transition(Clamp_base_REQ, [(0, 1), (1, 2), (2, 0)],
                           ["clamp_base_on", "base_clampled", "clamp_base_off"],
                           uncontrollable=['base_clampled'])
new_process.add_self_event(Clamp_base, 'base_clampled')

start_2 = new_process.new_automaton('start_2')
new_process.add_state(start_2, 2, ["waiting", 'start'], [False, True])
new_process.add_transition(start_2, [(0, 1), (1, 1)],
                           ['start', 'bases_conveyor_on'], ['start'])
new_process.add_self_event(Base_conveyor, 'start')

buffer_base = new_process.new_automaton('buffer_base')
new_process.add_state(buffer_base, 5, ["enciende", "esperando", " llega_lids", "parar_banda", "encender_garra"],
                      [True])
new_process.add_transition(buffer_base, [(0, 1), (1, 2), (2, 3), (3, 4), (4, 0)],
                           ['bases_conveyor_on', 'base_at_place_FE', "bases_conveyor_off", 'clamp_base_on', 'clamp_base_off'],
                           ['base_at_place_FE'])

new_process.add_self_event(Clamp_base, 'base_at_place_FE')
new_process.add_self_event(Base_conveyor, 'base_at_place_FE')

blade = new_process.new_automaton('Blade')
new_process.add_state(blade, 2, names=["knife_off", "knife_on"],
                      marked=[True, True])
new_process.add_transition(blade, [(0, 1), (1, 0)],
                           ["blade_on", "blade_off"],
                           uncontrollable=[])

complete_piece = new_process.new_automaton('complete_piece')
new_process.add_state(complete_piece,5,[],marked=[True, False, False, False])
new_process.add_transition(complete_piece,[(0, 1), (1, 2), (2, 3), (3, 4), (4,0)],
                           ['clamp_base_on', 'base_clampled', 'x_axis_on', 'grab_off', 'clamp_base_off'],
                           ['base_clampled'])

leave = new_process.new_automaton('leave')
new_process.add_state(leave,6,[],marked=[True, False, False, False])
new_process.add_transition(leave,[(0, 1), (1, 2), (2, 3), (3, 4), (4,5), (5,0)],
                           ['clamp_base_on','clamp_base_off', 'blade_on', 'blade_pos_limit', 'part_leaving_FE', 'blade_off', 'blade_pos_limit'],
                           ['blade_pos_limit','part_leaving_FE'])
new_process.add_self_event(blade, 'blade_pos_limit')
new_process.add_self_event(blade, 'part_leaving_FE')

new_process.complete_spec(start)
new_process.complete_spec(buffer_lid)
new_process.complete_spec(Clamp_lid_REQ)

new_process.complete_spec(start_2)
new_process.complete_spec(buffer_base)
new_process.complete_spec(Clamp_base_REQ)

new_process.complete_spec(buffer_arm)
new_process.complete_spec(complete_piece)
new_process.complete_spec(leave)

new_process.generate_all_automata()

plant = new_process.automata_syncronize([Lids_conveyor, Clamp_lid], name_sync='Plant_M1')
all = new_process.all_events(plant, 'all')
spec = new_process.automata_syncronize([buffer_lid, Clamp_lid_REQ, start, all], name_sync='spec')
sup = new_process.supcon(plant, spec, 'sup')
supdat = new_process.condat(plant, sup, 'supdat')
simsup = new_process.supreduce(plant, sup, supdat, 'simsup')

#new_process.plot_automatas([Lids_conveyor, Clamp, buffer_lid, Clamp_REQ, start, all, sup_M1, Plant_M1], 1, False)


plant2 = new_process.automata_syncronize([Clamp_lid, Grab, z_axis, x_axis], name_sync='plant2')
all2 = new_process.all_events(plant2, 'all2')
spec2 = new_process.automata_syncronize([buffer_arm, all2], name_sync='spec2')
sup2 = new_process.supcon(plant2, spec2, 'sup2')
supdat2 = new_process.condat(plant2, sup2, 'supdat2')
simsup2 = new_process.supreduce(plant2, sup2, supdat2, 'simsup2')

#new_process.plot_automatas([Clamp, Grab, z_axis, x_axis, spec2, plant2, sup2], 1, True)

plant3 = new_process.automata_syncronize([Clamp_base, Grab, x_axis], name_sync='plant3')
all3 = new_process.all_events(plant3, 'all3')
spec3 = new_process.automata_syncronize([complete_piece, all3], name_sync='spec3')
sup3 = new_process.supcon(plant3, spec3, 'sup3')
supdat3 = new_process.condat(plant3, sup3, 'supdat3')
simsup3 = new_process.supreduce(plant3, sup3, supdat3, 'simsup3')


#new_process.plot_automatas([Clamp_base, Grab, x_axis, spec3, sup3, all, plant3], 1, False)

plant4 = new_process.automata_syncronize([Base_conveyor, Clamp_base], name_sync='plant4')
all4 = new_process.all_events(plant4, 'all4')
spec4 = new_process.automata_syncronize([buffer_base, Clamp_base_REQ, start_2, all4], name_sync='spec4')
sup4 = new_process.supcon(plant4, spec4, 'sup4')
supdat4 = new_process.condat(plant4, sup4, 'supdat4')
simsup4 = new_process.supreduce(plant4, sup4, supdat4, 'simsup4')

#new_process.plot_automatas([Base_conveyor, Clamp_base, spec4, sup4, plant4, all4], 1, False)

plant5 = new_process.automata_syncronize([Clamp_base, blade], name_sync='plant5')
all5 = new_process.all_events(plant5, 'all5')
spec5 = new_process.automata_syncronize([leave, all5], name_sync='spec5')
sup5 = new_process.supcon(plant5, spec5, 'sup5')
supdat5 = new_process.condat(plant5, sup5, 'supdat5')
simsup5 = new_process.supreduce(plant5, sup5, supdat5, 'simsup45')

new_process.plot_automatas([Grab, blade, spec5, sup5, plant5, all5], 1, False)
new_process2.plot_automatas([M1,M2,buffer,repair], 1, False)


new_process.load_automata([sup, sup2, sup3, sup4, sup5])
new_process.load_automata([plant, plant2, plant3, plant4, plant5])


print(new_process.get_automata('sup_M1'))
print(new_process.get_automata('sup2'))
print(new_process.get_automata('sup3'))
print(new_process.get_automata('sup4'))
print(new_process.get_automata('sup5'))
new_process.generate_ST_OPENPLC([sup, sup2, sup3, sup4, sup5],[plant, plant2, plant3, plant4, plant5], actuators,'sera')



