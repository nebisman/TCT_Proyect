# CTCT ADS auto-generated

PLANT3

State size (State set will be (0,1....,size-1)):
# <-- Enter state size, in range 0 to 2000000, on line below.
16

Marker states:
# <-- Enter marker states, one per line.
# To mark all states, enter *.
# If no marker states, leave line blank.
# End marker list with blank line.
0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15

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
0     9   1    
0     10  0    
0     12  0    
0     17  2    
0     25  3    
1     10  1    
1     11  0    
1     12  1    
1     17  4    
1     25  5    
2     8   6    
2     9   4    
2     10  2    
2     12  2    
2     25  7    
3     9   5    
3     10  3    
3     12  3    
3     17  7    
3     27  0    
4     8   8    
4     10  4    
4     11  2    
4     12  4    
4     25  9    
5     10  5    
5     11  3    
5     12  5    
5     17  9    
5     27  1    
6     9   8    
6     10  6    
6     12  6    
6     19  10   
6     25  11   
7     8   11   
7     9   9    
7     10  7    
7     12  7    
7     27  2    
8     10  8    
8     11  6    
8     12  8    
8     19  12   
8     25  13   
9     8   13   
9     10  9    
9     11  7    
9     12  9    
9     27  4    
10    8   0    
10    9   12   
10    10  10   
10    12  10   
10    25  14   
11    9   13   
11    10  11   
11    12  11   
11    19  14   
11    27  6    
12    8   1    
12    10  12   
12    11  10   
12    12  12   
12    25  15   
13    10  13   
13    11  11   
13    12  13   
13    19  15   
13    27  8    
14    8   3    
14    9   15   
14    10  14   
14    12  14   
14    27  10   
15    8   5    
15    10  15   
15    11  14   
15    12  15   
15    27  12   

