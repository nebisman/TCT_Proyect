# CTCT ADS auto-generated

SUP4

State size (State set will be (0,1....,size-1)):
# <-- Enter state size, in range 0 to 2000000, on line below.
7

Marker states:
# <-- Enter marker states, one per line.
# To mark all states, enter *.
# If no marker states, leave line blank.
# End marker list with blank line.
1

Vocal states:
# <-- Enter vocal output states, one per line.
# Format: State  Vocal_Output.  Vocal_Output in range 10 to 99.
# Example: 0 10
# If no vocal states, leave line blank.
# End vocal list with blank line.

Transitions:
# <-- Enter transition triple, one per line.
# Format: Exit_(Source)_State  Transition_Label  Entrance_(Target)_State.
# Transition_Label in range 0 to 9999.
# Example: 2 0 1 (for transition labeled 0 from state 2 to state 1).
0     0   1    
0     10  0    
0     12  0    
1     0   1    
1     10  1    
1     12  1    
1     21  2    
2     0   2    
2     10  2    
2     12  3    
3     0   3    
3     10  3    
3     12  3    
3     23  4    
4     0   4    
4     10  4    
4     12  4    
4     25  5    
5     0   5    
5     10  6    
5     12  5    
6     0   6    
6     10  6    
6     12  6    
6     27  1    

