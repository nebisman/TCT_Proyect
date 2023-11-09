# CTCT ADS auto-generated

PLANT5

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
0     10  0    
0     12  0    
0     14  0    
0     16  0    
0     25  1    
0     29  2    
1     10  1    
1     12  1    
1     14  1    
1     16  1    
1     27  0    
1     29  3    
2     10  2    
2     12  2    
2     14  2    
2     16  2    
2     25  3    
2     31  0    
3     10  3    
3     12  3    
3     14  3    
3     16  3    
3     27  2    
3     31  1    

