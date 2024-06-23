# Automata Synthesis and Visualization README

## Overview

This repository contains code for automata synthesis, visualization, and control using TCT (Template Control Theory). The provided Python scripts enable the creation, manipulation, and visualization of automata, as well as the generation of Structured Text (ST) code for use with OpenPLC.

## Features

- Automata creation and manipulation
- Transition and event handling
- Visualization of automata using Graphviz
- Generation of ST code for automata control in OpenPLC
- Coordination and synchronization of multiple automata
- Conflict detection between automata

## Dependencies

The following libraries are required to run the scripts:

- Python 3.x
- `PIL` (Pillow)
- `matplotlib`
- `pytct`
- `graphviz`

## Installation

1. Clone the repository:
   
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. Install the required dependencies:
   
   ```bash
   pip install pillow matplotlib graphviz
   ```

3. Ensure Graphviz is installed on your system and added to the system PATH.

4. For the pytct library follow the instructions [Here](https://omucai.github.io/PyTCT-docs/)

## Usage

### 1. Creating Automata

Automata can be created and manipulated using the `Automata` and `State` classes. Example:

```python
import STSupervisorTCT as stst
proc = stst.process("output_directory")
M_0 = Automata("M_0")
automaton.add_state(M_0, 3, ["state0", "state1", "state2"], [False, True, False])
automaton.add_transition(M_0, [(0, 1), (1, 2)], ["event0", "event1"])
process.generate_all_automata()
```

### 2. Visualizing Automata

Automata can be visualized using the `process` class. Example:

```python
proc.plot_automatas(["example"])
```

### 4. Generate supervisors

```python
PLANT = new_ststprocess.automata_syncronize(automata_names=[M_0], name_sync='PLANT')
ALL = new_ststprocess.all_events(automata_name=PLANT, alleventsname='ALL')
SPEC = new_ststprocess.automata_syncronize(automata_names=[ALL], name_sync='SPEC')
SUP = new_ststprocess.supcon(PLANT, SPEC, 'SUP')
SUPDAT = new_ststprocess.condat(PLANT, SUP, 'SUPDAT')
SIMSUP = new_ststprocess.supreduce(PLANT, SUP, SUPDAT, 'SIMSUP')
```

### 3. Generating ST Code

ST code for OpenPLC can be generated using the `generate_ST_OPENPLC` method. Example:

```python
from automata import process

proc = process("output_directory")
proc.generate_ST_OPENPLC(["SUP"], plants=["M_0"], actuators=actuator_dict)
```

### 4. Additional Methods

The `process` class provides additional methods for automata synchronization, conflict detection, and more. Refer to the code for detailed usage.

## Directory Structure

- `STSupervisorTCT`: Contains the main classes and methods for automata creation, manipulation, and visualization.
- `output_directory/`: Directory for storing generated automata files and images.
- `Small_factory.py, Transfer_line.py, Assembly_line.py `: Contains an example for each scene in  the folder `Factory scenes`
- `GenetaredST`: Directory for storing generated Structured Text code.

## Contributing

Contributions are welcome! Please create a pull request with a detailed description of your changes.

# 

---

For any questions or issues, please open an issue in the repository.
