IF state = 0 & FE_LaP.OutputBit THEN
	 state := 1;
ELSIF state = 2 & GD_IN_15 THEN
	 state := 3;
ELSIF state = 4 & GD_IN_15 THEN
	 state := 5;
ELSIF state = 6 & GD_IN_15 THEN
	 state := 7;
ELSIF state = 6 & GD_IN_4 THEN
	 state := 8;
ELSIF state = 7 & GD_IN_4 THEN
	 state := 9;
ELSIF state = 8 & GD_IN_15 THEN
	 state := 9;
END_IF;