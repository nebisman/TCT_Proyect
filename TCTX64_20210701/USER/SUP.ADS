# CTCT ADS auto-generated

SUP

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
0     2   0    
0     4   0    
1     0   1    
1     1   2    
1     2   1    
1     4   1    
2     0   2    
2     2   2    
2     4   3    
3     0   3    
3     2   3    
3     3   4    
3     4   3    
4     0   4    
4     2   4    
4     4   4    
4     5   5    
5     0   5    
5     2   6    
5     4   5    
6     0   6    
6     2   6    
6     4   6    
6     7   1    

