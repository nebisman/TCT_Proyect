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
actuators['movement_finish'] = 'FE_Zag:GD_IN_6:%IX100.6'

new_process = ag.process()

'''M1 = new_process.automata('M1')
new_process.add_state(M1, 3, ['I1', 'D1', 'P1'], [True])
new_process.add_transition(M1, [(0, 2), (2, 0), (2, 1), (1, 0)],
                           ['start1', 'end1', 'breakdown1', 'repair1'], uncontrollable=['end1', 'breakdown1'])

M2 = new_process.automata('M2')
new_process.add_state(M2, 3, ['I2', 'D2', 'P2'], [True])
new_process.add_transition(M2, [(0, 2), (2, 0), (2, 1), (1, 0)],
                           ['start2', 'end2', 'breakdown2', 'repair2'], uncontrollable=['end2', 'breakdown2'])
buffer = new_process.automata('buffer')
new_process.add_state(buffer, 3, ['empty', 'inter', 'full'], [True, True, True])
new_process.add_transition(buffer, [(0, 1), (1, 2), (2, 1), (1, 0)],
                           ['end1', 'end1', 'start2', 'start2'], uncontrollable=['end1'])

repair = new_process.automata('repair')
new_process.add_state(repair, 2, ['2ok', '2down'], [True, True])
new_process.add_transition(repair, [(0, 0), (0, 1), (1, 0)],
                           ['repair1', 'breakdown2', 'repair2'], uncontrollable=['breakdown2'])'''

Lids_conveyor = new_process.automata('lids_conveyor')
new_process.add_state(Lids_conveyor, 2, ['lids_on', 'lids_off'], marked=[True, True])
new_process.add_transition(Lids_conveyor, [(0, 1), (1, 0)],
                           ['lids_conveyor_on', 'lids_conveyor_off'],
                           uncontrollable=[])
start = new_process.automata('start')
new_process.add_state(start, 2, ["waiting", 'start'], [False, True])
new_process.add_transition(start, [(0, 1), (1, 1)],
                           ['start', 'lids_conveyor_on'], ['start'])
new_process.add_self_event(Lids_conveyor, 'start')

Clamp_lid = new_process.automata('clamp_lid')
new_process.add_state(Clamp_lid, 2, names=["clamp_lid_off", "clamp_lid_on"],
                      marked=[True, True])
new_process.add_transition(Clamp_lid, [(0, 1), (1, 0)],
                           ["clamp_lid_on", "clamp_lid_off"],
                           uncontrollable=[])

Clamp_lid_REQ = new_process.automata('clamp_lid_REQ')
new_process.add_state(Clamp_lid_REQ, 3, names=["Encendido", "esperando", "apagado"], marked=[True, True, True])
new_process.add_transition(Clamp_lid_REQ, [(0, 1), (1, 2), (2, 0)],
                           ["clamp_lid_on", "lid_clampled", "clamp_lid_off"],
                           uncontrollable=['lid_clampled'])
new_process.add_self_event(Clamp_lid, 'lid_clampled')

buffer_lid = new_process.automata('buffer_lid')
new_process.add_state(buffer_lid, 5, ["enciende", "esperando", " llega_lids", "parar_banda", "encender_garra"],
                      [True])
new_process.add_transition(buffer_lid, [(0, 1), (1, 2), (2, 3), (3, 4), (4, 0)],
                           ['lids_conveyor_on', 'lid_at_place_FE', "lids_conveyor_off", 'clamp_lid_on', 'clamp_lid_off'],
                           ['lid_at_place_FE'])

new_process.add_self_event(Clamp_lid, 'lid_at_place_FE')
new_process.add_self_event(Lids_conveyor, 'lid_at_place_FE')

Grab = new_process.automata('grab')
new_process.add_state(Grab, 2, names=["grab_off", "grab_on"], marked=[True, True])
new_process.add_transition(Grab, [(0, 1), (1, 0)],
                           ["grab_on", "grab_off"],
                           uncontrollable=[])

z_axis = new_process.automata('z_axis')
new_process.add_state(z_axis, 4, names=["recogido", '1', "extendido", '0'],
                      marked=[True, True, True, True])
new_process.add_transition(z_axis, [(0, 1), (1, 2), (2, 3), (3, 0)],
                           ["z_axis_on", 'movement_finish', "z_axis_off", 'movement_finish'],
                           uncontrollable=['movement_finish'])

buffer_z = new_process.automata('buffer_z')
new_process.add_state(buffer_z, 5, ["z_recogida", "lids_lista", "z_extendida", "lid_agarrada", "restart"],
                      [False, False, False, False, True])
new_process.add_transition(buffer_z, [(0, 1), (1, 2), (2, 3), (3, 4), (4, 0)],
                           ['lid_clampled', 'movement_finish', 'grab_on', 'clamp_lid_off', 'z_axis_off',], ['lid_clampled', 'movement_finish'])

new_process.complete_spec(start)
new_process.complete_spec(buffer_lid)
new_process.complete_spec(Clamp_lid_REQ)
new_process.complete_spec(buffer_z)

new_process.generate_all_automata()

plant = new_process.automata_syncronize([Lids_conveyor, Clamp_lid], name_sync='plant')
all = new_process.all_events(plant, 'all')
spec = new_process.automata_syncronize([buffer_lid, Clamp_lid_REQ, start, all], name_sync='spec')
sup = new_process.supcon(plant, spec, 'sup')
supdat = new_process.condat(plant, sup, 'supdat')
simsup = new_process.supreduce(plant, sup, supdat, 'simsup')

new_process.plot_automatas([sup, spec, all, plant, simsup, buffer_lid, Clamp_lid_REQ, start, Lids_conveyor, Clamp_lid], 1, False)
new_process.print_events(actuators)
#ag.DEStoADS(sup)
new_process.read_ADS(sup)


plant2 = new_process.automata_syncronize([Clamp_lid, Grab, z_axis], name_sync='plant2')
all2 = new_process.all_events(plant2, 'all2')
spec2 = new_process.automata_syncronize([buffer_z, all2], name_sync='spec2')
sup2 = new_process.supcon(plant2, spec2, 'sup2')
supdat2 = new_process.condat(plant2, sup2, 'supdat2')
simsup2 = new_process.supreduce(plant2, sup2, supdat2, 'simsup2')

new_process.plot_automatas([sup2, spec2, all2, plant2, simsup2, buffer_z, z_axis, Grab], 1, False)
new_process.print_events(actuators)
#ag.DEStoADS(sup2)
new_process.read_ADS(sup2)
nonconflict, TESTcoor, alltest = new_process.coordinator([sup, sup2],[plant,plant2])  # revisa si son conflictivos
nonconflict2 = new_process.nonconflict(sup, sup2)  # revisa si son conflictivos
print(nonconflict)
print(nonconflict2)

new_process.plot_automatas([sup2, spec2, all2, plant2, simsup2, buffer_z, z_axis, Grab, TESTcoor], 1, False)

TESTSUP = new_process.supcon(TESTcoor, alltest, "TESTSUP")
TESTSUP_dat = new_process.condat(TESTcoor, TESTSUP, 'TESTSUPdat')
CO = new_process.supreduce(TESTcoor,TESTSUP,TESTSUP_dat,"simsupCO")
new_process.plot_automatas([CO],1,False)


a=new_process.generate_ST_OPENPLC([sup,sup2], actuators)
print(a)