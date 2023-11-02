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