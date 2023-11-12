import math
import subprocess
import os
from PIL import Image
import matplotlib.pyplot as plt

compilador_autoit = "AutoIt3\AutoIt3.exe"
user_route = "TCTX64_20210701/USER"

state_size = """State size (State set will be (0,1....,size-1)):
# <-- Enter state size, in range 0 to 2000000, on line below."""
marker_state = "\n\n" + """Marker states:
# <-- Enter marker states, one per line.
# To mark all states, enter *.
# If no marker states, leave line blank.
# End marker list with blank line.
"""
vocal_state = """
Vocal states:
# <-- Enter vocal output states, one per line.
# Format: State  Vocal_Output.  Vocal_Output in range 10 to 99.
# Example: 0 10
# If no vocal states, leave line blank.
# End vocal list with blank line."""
transitions = "\n\n" + """Transitions:
# <-- Enter transition triple, one per line.
# Format: Exit_(Source)_State  Transition_Label  Entrance_(Target)_State.
# Transition_Label in range 0 to 9999.
# Example: 2 0 1 (for transition labeled 0 from state 2 to state 1)."""


class process:
    def __init__(self):
        self.automatas = dict([])
        self.componed = []
        self.dict_events = dict([])
        self.dict_events_name = dict([])
        self.dict_states = dict([])
        self.c_events = []
        self.uc_events = []

    def get_automata(self, name):
        return self.automatas[name]

    def auto2txt(self, names: list):
        for name in names:
            self.aux_auto2txt(name)

    def aux_auto2txt(self, name: str):
        ruta_carpeta = "TCTX64_20210701/USER/"
        generate_command = "0\n1\n33\n"
        generate_command += name + "\n" + name + "\n"

        with open(ruta_carpeta + "ctct.prm", "w") as archivo:
            archivo.write(generate_command)
        command = 'TCTX64_20210701\TCTX64_20210701.exe -cmdline'
        a = os.system(command)
        return a

    def print_events(self, actuators=[]):
        if len(actuators) == 0:
            for n in self.dict_events.keys():
                print(self.dict_events[n] + " -> " + n)
        else:
            for n in self.dict_events.keys():
                print(self.dict_events[n] + " -> " + n + " : " + actuators[n])

    def plot_automatas(self, nameList: list, numcolumns: int = 1, show=True):
        self.generate_image(nameList)
        num_filas = math.ceil(len(nameList) / numcolumns)
        if show:
            fig, axs = plt.subplots(num_filas, numcolumns, figsize=(15, 5 * num_filas))
            if len(nameList) == 1:
                axs = [axs]
            else:
                axs = axs.flatten()
            for i in range(len(nameList)):
                ruta = 'TCTX64_20210701/USER/' + nameList[i] + ".GIF"
                imagen = Image.open(ruta)
                # Mostrar la imagen
                axs[i].imshow(imagen)
                axs[i].axis('off')  # Ocultar los ejes
            plt.show()

    def generate_image(self, name_list: list):
        for name in name_list:
            self.aux_generate_image(name)

    def aux_generate_image(self, name):
        ruta_carpeta = "TCTX64_20210701/USER/"
        generate_command = "0\n1\n30\n"
        generate_command += name + "\n" + name + "\n"

        with open(ruta_carpeta + "ctct.prm", "w") as archivo:
            archivo.write(generate_command)
        command = 'TCTX64_20210701\TCTX64_20210701.exe -cmdline'
        a = os.system(command)
        return a

    def complete_spec(self, name):
        for s in self.automatas[name].states:
            for e in self.automatas[name].uc_events:
                active_events = s.get_active_events()
                if e not in active_events:
                    self.add_transition(name, [(s.get_id(), s.get_id())], [e], [e])
                # print(s.get_id(),e)

    def add_self_event(self, name, event):
        for s in self.automatas[name].states:
            active_events = s.get_active_events()
            if event not in active_events:
                self.add_transition(name, [(s.get_id(), s.get_id())], [event], [event])
            # print(s.get_id(),e)

    def coordinator(self, supervisores, plantas):
        TESTcoor = self.automata_syncronize(supervisores, "TESTcoor")
        planta = self.automata_syncronize(plantas, "plantaTotal")
        AEcoor = self.all_events(planta, 'AEcoor')
        noncoor = self.nonconflict(TESTcoor, AEcoor)
        return noncoor, TESTcoor, AEcoor

    def all_events(self, name, alleventsname):
        ruta_carpeta = "TCTX64_20210701/USER/"
        generate_command = "0\n1\n19\n"
        generate_command += name + "\n" + alleventsname + "\n" + "1\n"

        with open(ruta_carpeta + "ctct.prm", "w") as archivo:
            archivo.write(generate_command)
        command = '.\TCTX64_20210701\TCTX64_20210701.exe -cmdline'
        a = os.system(command)
        return alleventsname

    def supreduce(self, plant, sup, sup_dat, simsup):
        ruta_carpeta = "TCTX64_20210701/USER/"
        generate_command = "0\n1\n8\n"
        generate_command += plant + "\n" + sup + "\n" + sup_dat + "\n" + simsup + "\n"

        with open(ruta_carpeta + "ctct.prm", "w") as archivo:
            archivo.write(generate_command)
        command = '.\TCTX64_20210701\TCTX64_20210701.exe -cmdline'
        a = os.system(command)
        return simsup

    def condat(self, plant, sup, sup_dat):
        ruta_carpeta = "TCTX64_20210701/USER/"
        generate_command = "0\n1\n7\n"
        generate_command += plant + "\n" + sup + "\n" + sup_dat + "\n"

        with open(ruta_carpeta + "ctct.prm", "w") as archivo:
            archivo.write(generate_command)
        command = '.\TCTX64_20210701\TCTX64_20210701.exe -cmdline'
        a = os.system(command)
        return sup_dat

    def supcon(self, test, all, name: str = ""):
        if name == "":
            name = "sc_" + test[0]
        ruta_carpeta = "TCTX64_20210701/USER/"
        generate_command = "0\n1\n5\n"
        generate_command += test + "\n" + all + "\n" + name + "\n"

        with open(ruta_carpeta + "ctct.prm", "w") as archivo:
            archivo.write(generate_command)
        command = '.\TCTX64_20210701\TCTX64_20210701.exe -cmdline'
        a = os.system(command)
        return name

    def nonconflictcomponed(self, name):
        return self.nonconflict_aux(name, self.componed)

    def nonconflict(self, name_1, name_2):
        return len(self.nonconflict_aux(name_1, [name_2])) == 0

    def nonconflict_aux(self, name, names: list):
        conflicting = []
        for n in names:
            if not n == name:
                ruta_carpeta = "TCTX64_20210701/USER/"
                generate_command = "0\n1\n25\n"
                generate_command += name + '\n'
                generate_command += n + '\n'
                with open(ruta_carpeta + "ctct.prm", "w") as archivo:
                    archivo.write(generate_command)
                command = '.\TCTX64_20210701\TCTX64_20210701.exe -cmdline'
                a = os.system(command)
                with open(ruta_carpeta + "ctct.rst", "r") as archivo:
                    error = archivo.readline()
                    if error != '0\n':
                        print('error, no se logro calcular nonconflict\n')
                    else:
                        result = archivo.readline()
                        if result == '0\n':
                            conflicting.append((n))
        return conflicting

    def automata_to_ADS(self, name: str):
        if name not in self.automatas:
            return
        to_Print = "# CTCT ADS Template\n\n"
        to_Print += name + "\n\n"
        to_Print += state_size
        to_Print += "\n" + str(len(self.automatas[name].states))
        to_Print += marker_state
        for i in self.automatas[name].states_marked:
            to_Print += str(self.automatas[name].dict_states[i]) + "\n"
        to_Print += vocal_state
        to_Print += transitions
        for transition in self.automatas[name].transitions:
            to_Print += "\n" + transition[0] + " " + transition[1] + " " + transition[2]
        to_Print += "\n\n"
        with open(user_route + "/" + name + ".ADS", "w") as archivo:
            archivo.write(to_Print)
        return to_Print

    def to_ADS(self):
        for automata in self.automatas.values():
            self.automata_to_ADS(automata.name)

    def new_automata(self, name: str):
        self.automatas[name] = Automata(name)
        return name

    def add_state(self, name: str, number_of_states: int, names: list, marked: list):
        if len(names) == 0:
            names = range(0, number_of_states)
            names = [str(numero) for numero in names]
        self.automatas[name].add_state(number_of_states, names, marked)

    def add_transition(self, name, transitions: list, event: list, uncontrollable: list = []):
        self.automatas[name].add_transition(transitions, event, uncontrollable, self.uc_events, self.c_events,
                                            self.dict_events, self.dict_events_name)

    def generate_all_automata(self):
        for name in self.automatas.keys():
            self.generate_automata(name)

    def generate_automata(self, name):
        ruta_carpeta = "TCTX64_20210701/USER/"
        generate_command = "0\n1\n0\n"

        if name in self.automatas.keys():
            generate_command += name + '\n' + str(len(self.automatas[name].dict_states)) + "\n"
            for marker in self.automatas[name].states_marked:
                generate_command += str(self.automatas[name].dict_states[marker]) + ' '
            generate_command += "-1\n"
            for transition in self.automatas[name].transitions:
                generate_command += str(transition[0]) + ' ' + str(transition[1]) + ' ' + str(transition[2]) + "\n"
        with open(ruta_carpeta + "ctct.prm", "w") as archivo:
            archivo.write(generate_command)
        command = '.\TCTX64_20210701\TCTX64_20210701.exe -cmdline'
        a = os.system(command)
        return a
        # Lista de comandos que deseas enviar

    def automata_syncronize(self, names: list, name_sync: str = ""):
        ruta_carpeta = "TCTX64_20210701/USER/"
        to_sync = ""
        num_sync = 0
        if name_sync == "":
            name_sync = "("
            for n in names:
                name_sync += n[0]
            name_sync = ")"

        generate_command = "0\n1\n3\n"
        for name in names:
            to_sync += name + "\n"
            num_sync += 1
        name_sync = name_sync.upper()
        generate_command += name_sync + "\n" + str(num_sync) + "\n" + to_sync
        with open(ruta_carpeta + "ctct.prm", "w") as archivo:
            archivo.write(generate_command)
        command = '.\TCTX64_20210701\TCTX64_20210701.exe -cmdline'
        a = os.system(command)
        self.componed.append(name_sync)
        return name_sync

    def automata_syncronize_autoit(self, names: list, timefactor: int = 1):
        out = "("
        ruta = 'TCTX64_20210701\TCTX64_20210701.exe'
        # Código AutoIt generado desde Python
        codigo_autoit = """Run('cmd.exe')
                    Sleep(500)
                    send('"""
        codigo_autoit += ruta + """{ENTER}')
                    send('{ENTER}')
                    Sleep(100)
                    send('T')
                    send('3')
                    Sleep(500)
                    """
        codigo_autoit += "send('" + str(len(names)) + "{ENTER}')\n"
        for name in names:
            if name not in self.automatas:
                return name + ' not in session'
            codigo_autoit += "send('" + name + "{ENTER}')\nSleep(10)\n"
            out += name[0]
        out += ')'
        codigo_autoit += "send('" + out + "{ENTER}')\n"
        codigo_autoit += """send('Y{ENTER}')
        send('{ENTER}')
        send('FE')
        """
        codigo_autoit += "send('" + out + "{ENTER}')\n"
        codigo_autoit += "send('A')\n"
        codigo_autoit += "send('" + out + "{ENTER}')\n"
        codigo_autoit += "send('Y')\n"
        codigo_autoit += """send('{ENTER}')
        send('{ENTER}')
        send('x')
        send('x')
        send('exit{ENTER}')"""
        with open("aut3/sync.au3", "w") as archivo:
            archivo.write(codigo_autoit)
        au32exe('aut3/sync')
        run_exe('aut3/sync')
        self.read_ADS(out.upper())
        return out.upper()

    def read_TXT(self, names: list):
        for name in names:
            self.aux_read_TXT(name)

    def aux_read_TXT(self, name):
        aux = ""
        marker = []
        transitions = []
        events = []
        uc_events = []
        with open(user_route + "/" + name + ".TXT", "r") as archivo:
            marked = -1
            transitions = []
            uc_events = []
            events = []
            for linea in archivo:
                if '# states: ' in linea:
                    aux = linea.split()
                    name = aux[0]
                    num_state = int(aux[3])
                    self.new_automata(name)
                if len(linea.split()) == 1 and marked == -1:
                    marked = int(linea.split()[0])
                    self.add_state(name, num_state, [], [[x == marked for x in range(0, num_state)]])
                    continue
                if "[" not in linea:
                    continue
                if marked == -1:
                    self.add_state(name, num_state, [], [])
                    marked = 0
                aux_transitions = linea.replace(" ", "").replace("[", "").replace("\n", "").split("]")
                aux_transitions.pop()
                for transition in aux_transitions:
                    aux = transition.split(',')
                    transitions.append((int(aux[0]), int(aux[2])))
                    if aux[1] in self.dict_events_name.keys():
                        event = self.dict_events_name[aux[1]]
                    else:
                        event = aux[1]
                    if event not in events:
                        if int(aux[1]) % 2 == 0:
                            uc_events.append(event)
                    events.append(event)
        self.add_transition(name, transitions, events, uc_events)
        return name

    def read_ADS(self, name):
        aux = ""
        marker = []
        transitions = []
        events = []
        uc_events = []
        with open(user_route + "/" + name + ".ADS", "r") as archivo:
            # Recorre el archivo línea por línea
            for linea in archivo:
                # Verifica si la línea contiene la palabra "Python"
                if "#" in linea or "Vocal" in linea:
                    continue
                if aux == "Transitions":
                    if linea == "\n":
                        continue
                    transition = linea.split(" ")
                    transition = [int(num) for num in transition if num.strip()]
                    transitions.append((transition[0], transition[2]))
                    event = self.dict_events_name[str(transition[1])]
                    if event not in events:
                        if transition[1] % 2 == 0:
                            uc_events.append(event)
                    events.append(event)
                if "Transitions" in linea:
                    aux = "Transitions"
                if aux == "Marker":
                    if linea == "\n":
                        continue
                    marker.append(int(linea))
                if "Marker" in linea:
                    aux = "Marker"
                if aux == 'State':
                    if linea == "\n":
                        continue
                    num_state = int(linea)
                if "State" in linea:
                    aux = "State"
        self.new_automata(name)
        names = list(range(0, num_state))
        marked = []
        for i in names:
            if i in marker:
                marked.append(True)
            else:
                marked.append(False)
        names = [str(num) for num in names]
        self.add_state(name, num_state, names, marked)
        self.add_transition(name, transitions, events, uc_events)
        return name

    def generate_ST_OPENPLC(self, supervisors: list, plants: list, actuators: dict):
        RANDOM = "FUNCTION_BLOCK random_number\n\tVAR_INPUT\n\t\tIN : BOOL;\n\tEND_VAR\n\tVAR\n\t\tM : BOOL;"
        RANDOM += "\n\t\tINIT : BOOL;\n\tEND_VAR\n\tVAR_OUTPUT\n\t\tOUT : DINT;\n\tEND_VAR\n"
        RANDOM += "\n\tIF INIT = 0 THEN\n\t\t{#include <stdio.h>}\n\t\t{#include <stdlib.h>}\n\t\tIN := 1;\n\tEND_IF;"
        RANDOM += "\n\tIF M = 0 and IN = 1 THEN\n\t\t{SetFbVar(OUT,rand())}\n\tEND_IF;\nEND_FUNCTION_BLOCK\n"
        HEADER = "PROGRAM tesis0\n"
        END = "\nEND_PROGRAM\n\n"
        END += "CONFIGURATION Config0\n\n\tRESOURCE Res0 ON PLC\n\t\tTASK task0(INTERVAL := T#20ms,PRIORITY := 0);"
        END += "\n\t\tPROGRAM instance0 WITH task0 : tesis0;" + "\n\tEND_RESOURCE\nEND_CONFIGURATION"

        if len(supervisors) == 1:
            return self.aux_generate_ST_OPENPLC(supervisors, actuators)
        Coordinators = []
        Intersections = dict([])
        for i in range(len(supervisors)):
            for j in range(i + 1, len(supervisors)):
                nonconflict, TESTcoor, alltest = self.coordinator([supervisors[i], supervisors[j]],
                                                                  [plants[i], plants[j]])  # revisa si son conflictivos
                if not nonconflict:
                    print('conflict', i, j)
                    TESTSUP = self.supcon(TESTcoor, alltest, "TESTSUP")
                    TESTSUP_dat = self.condat(TESTcoor, TESTSUP, 'TESTSUPdat')
                    CO = self.supreduce(TESTcoor, TESTSUP, TESTSUP_dat, "CO_" + str(i) + "_" + str(j))
                    self.plot_automatas([CO, TESTcoor, alltest, TESTSUP], 1, False)
                    DEStoADS(CO)
                    self.read_ADS(CO)
                    Coordinators.append(CO)
                a = set(self.automatas[supervisors[i]].c_events)
                b = set(self.automatas[supervisors[j]].c_events)
                intersect = list(a & b)
                intersect = set([actuators[act].split(':')[0] for act in intersect])
                if len(intersect) != 0:
                    for inter in intersect:
                        if inter in Intersections.keys():
                            if i not in Intersections[inter]:
                                Intersections[inter].append(i)
                            if j not in Intersections[inter]:
                                Intersections[inter].append(j)
                        else:
                            Intersections[inter] = [i, j]
        COsw = ""
        COc = ""
        COu = ""
        st = []
        if_controllable = ""
        if_uncontrollable = ""
        sc = ""
        j = 0
        if len(actuators) != 0:
            for i in range(len(supervisors)):
                if_c, if_u = self.ifs(supervisors[i], actuators, i)
                s, n_r = self.sw_case(supervisors[i], actuators, i, i, Intersections)
                j += 1
                if_controllable += if_c + "\n"
                if_uncontrollable += if_u + '\n'
                sc += "\n" + s + "\n"
                st.append(n_r)
        for c in Coordinators:
            COsw += self.coordinator_sc(c, actuators=actuators, state_it=j)
            a, b = self.ifs(c, actuators, j)
            st.append(0)
            j += 1
            COc += a
            COu += b
        intersection = self.intersection(Intersections, len(Coordinators) != 0)
        declaration = self.declaration_OPENPLC(actuators, st, j, Intersections, Coordinators)
        out = RANDOM + HEADER
        out += declaration + if_uncontrollable + COu + COsw + sc + intersection + COc + if_controllable
        out += END
        with open('ST_Generated/codigo_st.st', 'w') as archivo:
            archivo.write(out)
        return out

    def aux_generate_ST_OPENPLC(self, name: list = [], actuators: dict = dict([]), CO=""):
        COsw = ""
        COc = ""
        COu = ""
        if CO != "":
            COsw = self.coordinator_sc(CO, actuators=actuators)
            COc, Cou = self.ifs(CO, actuators, 2)
        Intersections = dict([])
        if len(name) > 1:
            for i in range(len(name)):
                for j in range(i + 1, len(name)):
                    a = set(self.automatas[name[i]].c_events)
                    b = set(self.automatas[name[j]].c_events)
                    intersect = list(a & b)
                    intersect = set([actuators[act].split(':')[0] for act in intersect])
                    if len(intersect) != 0:
                        for inter in intersect:
                            if inter in Intersections.keys():
                                if i not in Intersections[inter]:
                                    Intersections[inter].append(i)
                                if j not in Intersections[inter]:
                                    Intersections[inter].append(j)
                            else:
                                Intersections[inter] = [i, j]

        HEADER = "PROGRAM tesis0\n"
        END = "\nEND_PROGRAM\n\n"
        END += "CONFIGURATION Config0\n\n\tRESOURCE Res0 ON PLC\n\t\tTASK task0(INTERVAL := T#20ms,PRIORITY := 0);"
        END += "\n\t\tPROGRAM instance0 WITH task0 : tesis0;" + "\n\tEND_RESOURCE\nEND_CONFIGURATION"

        st = []
        if_controllable = ""
        if_uncontrollable = ""
        sc = ""
        if len(actuators) != 0:
            for i in range(len(name)):
                if_c, if_u = self.ifs(name[i], actuators, i)
                s, n_r = self.sw_case(name[i], actuators, i, intersection=Intersections)
                if_controllable += if_c + "\n"
                if_uncontrollable += if_u + '\n'
                sc += "\n" + s + "\n"
                st.append(n_r)
        print(if_uncontrollable + sc + if_controllable)
        declaration = self.declaration_OPENPLC(actuators, st, len(name), Intersections, CO)
        intersection = self.intersection(Intersections, CO != "")
        out = HEADER + declaration + if_uncontrollable + COu + COsw + sc + intersection + COc + if_controllable + END
        with open('ST_Generated/codigo_st.st', 'w') as archivo:
            archivo.write(out)
        return out

    def intersection(self, intersection: dict, CO=False, addG="_G[", addC="_C[", name_intersection="aux"):
        out = ""
        for inter in intersection.keys():
            aux = ""
            coor = ""
            bandera = inter if not CO else name_intersection
            out += "\tIF "
            guesses = []
            for act in range(len(intersection[inter])):
                guesses.append(inter + addG + str(act) + "]")
            if len(guesses) == 2:
                out += guesses[0] + " <> " + guesses[1] + " THEN\n"
                out += "\t\t" + guesses[0] + " := " + inter + ";\n"
                out += "\t\t" + guesses[1] + " := " + inter + ";"
            else:
                i = 0
                j = 1
                while j < len(guesses):
                    aux += "\t\t" + guesses[i] + " := " + inter + ";\n"
                    out += "(" + guesses[i] + " <> " + guesses[j] + ")"
                    i += 1
                    j += 1
                    if j != len(guesses):
                        out += " OR "
                    else:
                        out += " THEN\n"
                aux += "\t\t" + guesses[j - 1] + " := " + inter + ";\t\t\t"
            if CO:
                coor += "\tIF " + bandera + " XOR " + inter + " THEN\n\t\t"
                coor += "IF NOT " + bandera + " & " + inter + addC + "0] THEN\n\t\t\t"
                coor += inter + " := 0;\n\t\t"
                coor += "ELSIF " + bandera + " & " + inter + addC + "1] THEN\n\t\t\t"
                coor += inter + " := 1;"
                coor += "\n\t\tEND_IF;"
                coor += "\n\tEND_IF;\n"
            out += aux + '\n'
            out += "\tEND_IF;\n\t"
            out += bandera + " := " + guesses[0] + ";\n"
            out += coor
        return out

    def declaration_OPENPLC(self, actuators, n_state: list, n_automata=0, intersetion: dict = dict([]), CO=list):
        declaration = "\tVAR\n"
        clocks = ""
        start = "\tVAR\n"
        start += '\t\trandom : random_number;\n'
        start += '\t\trandom_numer : DINT;\n'
        start += "\t\tstate : ARRAY [0.." + str(n_automata) + "] OF DINT;\n"
        if len(CO) != 0:
            declared = []
            start += "\t\taux : BOOL := 0;\n"
            for coor in CO:
                for i in self.automatas[coor].c_events:
                    aux = actuators[i].split(':')[0]
                    if aux not in declared:
                        start += "\t\t" + aux + "_C : ARRAY [0..1] OF BOOL;\n"
                        declared.append(aux)
        for i in range(0, n_automata):
            if n_state[i] == 0:
                continue
            start += "\t\tslt" + str(i) + " : ARRAY [0.." + str(n_state[i]) + "] OF DINT;\n"
        if len(intersetion.keys()) > 0:
            for inter in intersetion.keys():
                start += "\t\t" + inter + "_G : ARRAY [0.." + str(len(intersetion[inter])) + "] OF BOOL;\n"

        declared = []
        for act in actuators.values():
            aux = act.split(':')
            if aux[1] == 'ON' or aux[1] == 'OFF':
                if aux[0] in declared:
                    continue
                declaration += "\t\t" + aux[0] + " AT "
                declared.append(aux[0])
                if "IN" in aux[0]:
                    declaration += aux[2] + " : BOOL;\n"
                elif "OUT" in aux[0]:
                    declaration += aux[2] + " : BOOL;\n"
            else:
                if aux[1] not in declared:
                    declared.append(aux[1])
                    declaration += "\t\t" + aux[1] + " AT "
                    if "IN" in aux[1]:
                        declaration += aux[2] + " : BOOL;\n"
                    elif "OUT" in aux[1]:
                        declaration += aux[2] + " : BOOL;\n"
                start += "\t\t" + aux[0] + " : "
                if "FE" in aux[0]:
                    start += "F_TRIG;\n"
                if "RE" in aux[0]:
                    start += "R_TRIG;\n"

                clocks += "\t" + aux[0] + '(CLK:= ' + aux[1] + ');\n'
                ran = "\trandom(\n\t\tIN := True,\n\t\tOUT => random_numer);\n"
        start += "\tEND_VAR\n"
        declaration += "\tEND_VAR\n"
        return start + declaration + clocks + ran

    def ifs(self, name: str, actuators=dict([]), n_state=0):
        if_uncontrollable = "\t"
        if_controllable = "\t"
        for i in range(0, len(self.automatas[name].transitions)):
            origin = self.automatas[name].transitions[i][0]
            destination = self.automatas[name].transitions[i][2]
            event = self.automatas[name].transitions[i][1]
            if len(actuators) == 0:
                name_event = self.dict_events_name[event]
            else:
                name_event = actuators[self.dict_events_name[event]]
            name_event = name_event.split(':')
            if name_event[1] == 'OFF':
                name_event = 'NOT ' + name_event[0]
            else:
                name_event = name_event[0]
            if origin == destination:
                continue
            if self.dict_events_name[event] in self.c_events:
                if_controllable += "IF state[" + str(n_state) + "] = " + str(origin) \
                                   + " & " + name_event \
                                   + " THEN\n  " + "\t\t" + "state[" + str(n_state) + "] := " \
                                   + str(destination) + ";\n  " + "\tELS"
            elif self.dict_events_name[event] in self.uc_events:
                if_uncontrollable += "IF state[" + str(n_state) + "] = " + str(origin) + " & "
                if_uncontrollable += name_event + ('.Q' if 'FE' in name_event or 'RE' in name_event else '')
                if_uncontrollable += " THEN\n  " + "\t\t" + "state[" + str(n_state) + "] := "
                if_uncontrollable += str(destination) + ";\n  " + "\tELS"
        if if_controllable == "\t": if_controllable = ""
        if if_uncontrollable == "\t": if_uncontrollable = ""
        if not if_controllable == "":
            if_controllable = if_controllable.rstrip("ELS") + "END_IF;"
        if not if_uncontrollable == "":
            if_uncontrollable = if_uncontrollable.rstrip("ELS") + "END_IF;\n"
        return if_controllable, if_uncontrollable

    def sw_case(self, name, actuators=dict([]), n_aut=0, n_state=0, intersection: dict = dict([])):
        act_guess = dict([])
        for inter in intersection.keys():
            for i in range(len(intersection[inter])):
                if intersection[inter][i] == n_aut:
                    if i in act_guess.keys():
                        act_guess[i].append(inter)
                    else:
                        act_guess[i] = [inter]
        n_r = 0
        state_list = self.automatas[name].states
        case = "\tCASE state[" + str(n_aut) + "] OF\n  "
        for state in state_list:
            events = [event for event in state.get_active_events() if event not in self.uc_events]
            num_event = len(events)
            if len(events) != 0:
                case += "\t\t" + str(state.get_id()) + ":\n  "
                if num_event > 1:
                    case += "\t\t\tCASE " + "slt" + str(n_state) + "[" + str(n_r) + "] OF\n  "
                    for i in range(0, num_event):
                        name_event = events[i] if len(actuators) == 0 else actuators[events[i]]
                        case += "\t\t\t\t" + str(i) + ":" + "\n  "
                        aux = name_event.split(":")
                        guess = ""
                        for i in act_guess.keys():
                            if aux[0] in act_guess[i]:
                                guess = "_G[" + str(i) + "]"
                        if "OFF" in name_event:
                            case += "\t\t\t\t\t" + aux[0]
                            case += guess
                            case += " := 0;\n  "
                        else:
                            case += "\t\t\t\t\t" + aux[0]
                            case += guess
                            case += " := 1;\n  "
                    case += "\t\t\tEND_CASE;\n  "
                    case += ("\t\t\t" + "slt" + str(n_state) + "[" + str(n_r) + "] := " + "(random_numer + " + "slt" +
                             str(n_state) + "[" + str(n_r) + "]" + ") MOD " + str(num_event) + ";\n  ")
                    case += "\t\t\t" + "random_numer := " + "random_numer - " + "slt" + str(n_state) + "[" + str(
                        n_r) + "];\n "
                    n_r += 1

                elif num_event == 1:
                    name_event = name_event = events[0] if len(actuators) == 0 else actuators[events[0]]
                    aux = name_event.split(":")
                    guess = ""
                    for i in act_guess.keys():
                        if aux[0] in act_guess[i]:
                            guess = "_G[" + str(i) + "]"
                    if "OFF" in name_event:
                        case += "\t\t\t" + aux[0]
                        case += guess
                        case += " := 0;\n  "
                    else:
                        case += "\t\t\t" + aux[0]
                        case += guess
                        case += " := 1;\n"

        return [case + "\tEND_CASE;", n_r]

    def coordinator_sc(self, name, state_it: int = 2, actuators=dict([])):
        state_list = self.automatas[name].states
        case = "\tCASE state[" + str(state_it) + "] OF\n  "
        for state in state_list:
            all_events = self.automatas[name].c_events
            events = [event for event in state.get_active_events() if event not in self.uc_events]
            num_event = len(all_events)
            if len(events) != 0:
                case += "\t\t" + str(state.get_id()) + ":\n  "
                for i in range(0, num_event):
                    name_event = all_events[i] if len(actuators) == 0 else actuators[all_events[i]]
                    aux = name_event.split(":")
                    if "OFF" in name_event:
                        case += "\t\t\t" + aux[0]
                        case += "_C" + "[0]"
                    else:
                        case += "\t\t\t" + aux[0]
                        case += "_C" + "[1]"
                    if all_events[i] in events:
                        case += " := 1;\n"
                    else:
                        case += " := 0;\n"

        case += "\tEND_CASE;\n  "
        return case


def DEStoADS(name):
    ruta = 'TCTX64_20210701\TCTX64_20210701.exe'
    codigo_autoit = """Run('cmd.exe')
        Sleep(1000)
        send('"""
    codigo_autoit += ruta + """{ENTER}')
        send('{ENTER}')
        Sleep(500)
        send('T')
        send('FE')\n"""
    codigo_autoit += "send('" + name + "{ENTER}')\n" + "send('a')\n" + "send('" + name + "{ENTER}')\n"
    codigo_autoit += """send('y')
        Sleep(100)
        send('{ENTER}')
        send('{ENTER}')
        send('x')
        send('x')
        send('exit{ENTER}')
        """
    with open("aut3/DESADS.au3", "w") as archivo:
        archivo.write(codigo_autoit)
    au32exe('aut3/DESADS')
    run_exe('aut3/DESADS')


class State:
    def __init__(self, id):
        self.id = id
        self.active_events = []

    def __str__(self):
        return "id: " + str(self.id) + ", name: " + str(self.actuators)

    def add_active_event(self, event: str):
        try:
            self.active_events.append(event)
        except:
            print(event)
            print(self.id)

    def __repr__(self):
        # return "{ " + str(self.id) + " ," + str(self.actuators) + ", ev: " + str(self.active_events) + "}"
        return str(self.id)

    def get_active_events(self):
        return self.active_events

    def get_id(self):
        return self.id


class Automata:
    def __init__(self, name: str):
        self.name = name
        self.c_events = []
        self.uc_events = []
        self.transitions = []
        self.states = []
        self.dict_events = dict([])
        self.dict_states = dict([])
        self.states_marked = []

    def __str__(self):
        return "name: " + str(self.name) + ", # states: " + str(len(self.states)) + ", # transitions: " + str(
            len(self.transitions))

    def add_state(self, number_of_states: int, names: list, marked: list):
        dif_mark = number_of_states - len(marked)
        if dif_mark > 0:
            for i in range(0, dif_mark):
                marked.append(False)
        for i in range(0, number_of_states):
            state = State(i)
            self.states.append(state)
            self.dict_states[names[i]] = i
            if marked[i]:
                self.states_marked.append(names[i])

    def add_transition(self, transitions: list, event: list, uncontrollable: list = [], uc_events: list = [],
                       c_events: list = [], dict_events: dict = [], dict_events_name: dict = []):
        for i in range(0, len(event)):
            aux_event = event[i]
            aux_list = dict_events.keys()
            if event[i] not in self.uc_events and event[i] in uncontrollable:
                self.uc_events.append(event[i])
            if event[i] not in self.c_events and event[i] not in uncontrollable:
                self.c_events.append(event[i])

            if event[i] not in dict_events.keys():
                if event[i] in uncontrollable:
                    if event[i] not in uc_events:
                        uc_events.append(event[i])
                        id = 2 * (len(uc_events) - 1)
                        dict_events[event[i]] = str(id)
                        dict_events_name[str(id)] = event[i]
                else:
                    if event[i] not in c_events:
                        c_events.append(event[i])
                        id = 2 * (len(c_events) - 1) + 1
                        dict_events[event[i]] = str(id)
                        dict_events_name[str(id)] = event[i]

        for i in range(0, len(transitions)):
            aux = self.states[transitions[i][0]]
            eve = event[i]
            self.states[transitions[i][0]].add_active_event(event[i])
            self.transitions.append((str(transitions[i][0]), dict_events.get(event[i]), str(transitions[i][1])))
        # print(self.transitions)
        # print(dict_events)

    def to_ADS(self):

        to_Print = "# CTCT ADS Template\n\n"
        to_Print += self.name + "\n\n"
        to_Print += state_size
        to_Print += "\n" + str(len(self.states))
        to_Print += marker_state
        for i in self.states_marked:
            to_Print += self.dict_states[i] + "\n"
        to_Print += vocal_state
        to_Print += transitions
        for transition in self.transitions:
            to_Print += "\n" + transition[0] + " " + transition[1] + " " + transition[2]
        to_Print += "\n\n"
        with open(user_route + "/" + self.name + ".ADS", "w") as archivo:
            archivo.write(to_Print)
        return to_Print

    def generate_image(self, time_factor: int = 10):
        ruta = 'TCTX64_20210701.exe'
        # Código AutoIt generado desde Python
        codigo_autoit = """Run('cmd.exe')
        Sleep(500)
        send('cd TCTX64_20210701{ENTER}')
        send('"""
        codigo_autoit += ruta + """{ENTER}')
        Sleep(100)
        send('{ENTER}')
        Sleep(100)
        send('T')
        Sleep(100)
        send('CE')
        Sleep(1000)"""
        codigo_autoit += "\nsend('" + self.name + "{ENTER}')"
        codigo_autoit += """
        send('{ENTER}')
        send('y')
        send('{ENTER}')
        Sleep(""" + str((len(self.states) + len(self.transitions)) * time_factor) + """)
        send('x')
        send('x')
        send('exit{ENTER}')
        """
        with open("aut3/generate_image.au3", "w") as archivo:
            archivo.write(codigo_autoit)
        au32exe('aut3/generate_image')
        run_exe('aut3/generate_image')


def au32exe(name):
    # Inicia el proceso
    proceso = subprocess.Popen(
        "cmd",  # Puedes especificar otro comando o programa aquí
        shell=True,
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )

    # Lista de comandos que deseas enviar
    comandos = [
        'AutoIt3\Aut2Exe\Aut2exe.exe /in ' + name + '.au3 /out ' + name + '.exe',
        "exit",
    ]
    # Itera a través de los comandos y envíalos al proceso
    for comando in comandos:
        proceso.stdin.write(comando + "\n")
        proceso.stdin.flush()

    # Leer la salida estándar y la salida de error estándar
    salida_estandar, errores_estandar = proceso.communicate()
    # Cierra el flujo de entrada estándar
    proceso.stdin.close()
    # Espera a que el proceso termine
    proceso.wait()


def automatas_list():
    # Especifica la ruta de la carpeta que deseas explorar
    ruta_carpeta = "TCTX64_20210701/USER"

    # Utiliza la función os.listdir para obtener una lista de nombres de archivos en la carpeta
    nombres_archivos = os.listdir(ruta_carpeta)

    # Itera a través de la lista de nombres de archivos y muestra cada nombre
    for nombre_archivo in nombres_archivos:
        print(nombre_archivo)


def run_exe(name):
    archivo_autoit_compilado = name + ".exe"
    # Configura las opciones para ocultar la ventana de la consola
    opciones = subprocess.STARTUPINFO()
    opciones.dwFlags |= subprocess.STARTF_USESHOWWINDOW
    opciones.wShowWindow = subprocess.SW_HIDE

    # Ejecuta el archivo EXE sin mostrar la ventana de la consola
    proceso = subprocess.Popen([archivo_autoit_compilado], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True,
                               startupinfo=opciones)

    # Captura la salida estándar y de error del proceso AutoIt
    salida_estandar, errores_estandar = proceso.communicate()
    # Espera a que el proceso termine
    proceso.wait()


def generate_automata():
    ruta = 'TCTX64_20210701\TCTX64_20210701.exe'
    # Código AutoIt generado desde Python
    codigo_autoit = """Run('cmd.exe')
    Sleep(500)
    send('"""
    codigo_autoit += ruta + """{ENTER}')
    send('{ENTER}')
    Sleep(100)
    send('T')
    send('FD')
    send('2{ENTER}')
    send('{ENTER}')
    send('x')
    send('x')
    send('exit{ENTER}')
    """
    with open("aut3/generate.au3", "w") as archivo:
        archivo.write(codigo_autoit)
    au32exe('aut3/generate')
    run_exe('aut3/generate')
