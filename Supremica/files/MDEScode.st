IF NOT initial THEN
	state := 0;
	initial := 1;
END_IF;



CASE state OF
	0:
		GD_IN_15 := 1;
	1:
		GD_OUT_2 := 1;
	2:
		FE_LaP := 0;
	3:
		GD_OUT_2 := 0;
END_CASE;
IF state = 0 & GD_IN_15 THEN
	 state := 1;
ELSIF state = 1 & GD_OUT_2 THEN
	 state := 2;
ELSIF state = 2 & NOT FE_LaP THEN
	 state := 3;
ELSIF state = 3 & NOT GD_OUT_2 THEN
	 state := 0;
END_IF;