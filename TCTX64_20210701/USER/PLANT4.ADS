# CTCT ADS auto-generated

PLANT4

State size (State set will be (0,1....,size-1)):
# <-- Enter state size, in range 0 to 2000000, on line below.
4

Marker states:
# <-- Enter marker states, one per line.
# To mark all states, enter *.
# If no marker states, leave line blank.
# End marker list with blank line.
0
1
2
3

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
0     0   0    
0     10  0    
0     12  0    
0     21  1    
0     25  2    
1     0   1    
1     10  1    
1     12  1    
1     23  0    
1     25  3    
2     0   2    
2     10  2    
2     12  2    
2     21  3    
2     27  0    
3     0   3    
3     10  3    
3     12  3    
3     23  2    
3     27  1    

