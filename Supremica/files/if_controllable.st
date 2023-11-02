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