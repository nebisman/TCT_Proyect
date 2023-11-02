IF NOT initial THEN
	state := 4;
	initial := 1;
END_IF;

FE_LaP.InputBit := GD_IN_2;
OSFI(FE_LaP);

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
CASE state OF
	0:
	1:
		GD_OUT_2 := 0;
	2:
		GD_OUT_4 := 1;
	3:
		GD_OUT_4 := 1;
	4:
	5:
		GD_OUT_2 := 1;
	6:
	7:
	8:
		GD_OUT_4 := 0;
	9:
		GD_OUT_4 := 0;
END_CASE;
IF state = 1 & NOT GD_OUT_2 THEN
	 state := 2;
ELSIF state = 2 & GD_OUT_4 THEN
	 state := 6;
ELSIF state = 3 & GD_OUT_4 THEN
	 state := 7;
ELSIF state = 5 & GD_OUT_2 THEN
	 state := 0;
ELSIF state = 8 & NOT GD_OUT_4 THEN
	 state := 4;
ELSIF state = 9 & NOT GD_OUT_4 THEN
	 state := 5;
END_IF;