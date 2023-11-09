PROGRAM tesis0
	VAR
		state : ARRAY [0..5] OF DINT;
		slt1 : ARRAY [0..8] OF DINT;
		slt2 : ARRAY [0..15] OF DINT;
		GD_OUT_4_G : ARRAY [0..2] OF BOOL;
		GD_OUT_7_G : ARRAY [0..2] OF BOOL;
		GD_OUT_8_G : ARRAY [0..2] OF BOOL;
		GD_OUT_5_G : ARRAY [0..3] OF BOOL;
		FE_LaP : F_TRIG;
		FE_BaP : F_TRIG;
		FE_PaL : F_TRIG;
		FE_Zag : F_TRIG;
		FE_Xag : F_TRIG;
	END_VAR
	VAR
		GD_OUT_2 AT %QX100.2 : BOOL;
		GD_OUT_3 AT %QX100.3 : BOOL;
		GD_OUT_4 AT %QX100.4 : BOOL;
		GD_OUT_5 AT %QX100.5 : BOOL;
		GD_OUT_6 AT %QX100.6 : BOOL;
		GD_OUT_7 AT %QX100.7 : BOOL;
		GD_OUT_8 AT %QX100.8 : BOOL;
		GD_OUT_9 AT %QX100.9 : BOOL;
		GD_IN_15 AT %IX100.15 : BOOL;
		GD_IN_2 AT %IX100.2 : BOOL;
		GD_IN_4 AT %IX100.4 : BOOL;
		GD_IN_3 AT %IX100.3 : BOOL;
		GD_IN_9 AT %IX100.9 : BOOL;
		GD_IN_5 AT %IX100.5 : BOOL;
		GD_IN_6 AT %IX100.6 : BOOL;
		GD_IN_7 AT %IX100.7 : BOOL;
		GD_IN_8 AT %IX100.8 : BOOL;
	END_VAR
	FE_LaP(CLK:= GD_IN_2);
	FE_BaP(CLK:= GD_IN_3);
	FE_PaL(CLK:= GD_IN_9);
	FE_Zag(CLK:= GD_IN_6);
	FE_Xag(CLK:= GD_IN_7);
	IF state[0] = 0 & GD_IN_15 THEN
  		state[0] := 1;
  	ELSIF state[0] = 2 & FE_LaP.Q THEN
  		state[0] := 3;
  	ELSIF state[0] = 5 & GD_IN_4 THEN
  		state[0] := 6;
  	END_IF;

	IF state[1] = 0 & GD_IN_4 THEN
  		state[1] := 1;
  	ELSIF state[1] = 2 & GD_IN_4 THEN
  		state[1] := 3;
  	ELSIF state[1] = 4 & FE_Zag.Q THEN
  		state[1] := 6;
  	ELSIF state[1] = 5 & FE_Zag.Q THEN
  		state[1] := 7;
  	ELSIF state[1] = 12 & FE_Zag.Q THEN
  		state[1] := 14;
  	ELSIF state[1] = 13 & FE_Zag.Q THEN
  		state[1] := 15;
  	ELSIF state[1] = 16 & FE_Xag.Q THEN
  		state[1] := 18;
  	ELSIF state[1] = 17 & FE_Xag.Q THEN
  		state[1] := 19;
  	ELSIF state[1] = 20 & FE_Zag.Q THEN
  		state[1] := 22;
  	ELSIF state[1] = 21 & FE_Zag.Q THEN
  		state[1] := 23;
  	ELSIF state[1] = 26 & FE_Zag.Q THEN
  		state[1] := 28;
  	ELSIF state[1] = 27 & FE_Zag.Q THEN
  		state[1] := 29;
  	ELSIF state[1] = 30 & FE_Xag.Q THEN
  		state[1] := 0;
  	ELSIF state[1] = 31 & FE_Xag.Q THEN
  		state[1] := 2;
  	END_IF;

	IF state[2] = 2 & GD_IN_5 THEN
  		state[2] := 4;
  	ELSIF state[2] = 3 & GD_IN_5 THEN
  		state[2] := 5;
  	ELSIF state[2] = 6 & FE_Xag.Q THEN
  		state[2] := 8;
  	ELSIF state[2] = 7 & FE_Xag.Q THEN
  		state[2] := 9;
  	ELSIF state[2] = 10 & FE_Xag.Q THEN
  		state[2] := 12;
  	ELSIF state[2] = 11 & FE_Xag.Q THEN
  		state[2] := 16;
  	ELSIF state[2] = 13 & FE_Xag.Q THEN
  		state[2] := 20;
  	ELSIF state[2] = 14 & FE_Xag.Q THEN
  		state[2] := 17;
  	ELSIF state[2] = 15 & FE_Xag.Q THEN
  		state[2] := 19;
  	ELSIF state[2] = 18 & FE_Xag.Q THEN
  		state[2] := 25;
  	ELSIF state[2] = 21 & FE_Xag.Q THEN
  		state[2] := 24;
  	ELSIF state[2] = 22 & FE_Xag.Q THEN
  		state[2] := 27;
  	ELSIF state[2] = 22 & GD_IN_5 THEN
  		state[2] := 29;
  	ELSIF state[2] = 23 & FE_Xag.Q THEN
  		state[2] := 30;
  	ELSIF state[2] = 26 & FE_Xag.Q THEN
  		state[2] := 0;
  	ELSIF state[2] = 27 & GD_IN_5 THEN
  		state[2] := 34;
  	ELSIF state[2] = 28 & FE_Xag.Q THEN
  		state[2] := 32;
  	ELSIF state[2] = 28 & GD_IN_5 THEN
  		state[2] := 35;
  	ELSIF state[2] = 29 & FE_Xag.Q THEN
  		state[2] := 34;
  	ELSIF state[2] = 31 & FE_Xag.Q THEN
  		state[2] := 1;
  	ELSIF state[2] = 32 & GD_IN_5 THEN
  		state[2] := 37;
  	ELSIF state[2] = 33 & FE_Xag.Q THEN
  		state[2] := 2;
  	ELSIF state[2] = 33 & GD_IN_5 THEN
  		state[2] := 38;
  	ELSIF state[2] = 35 & FE_Xag.Q THEN
  		state[2] := 37;
  	ELSIF state[2] = 36 & FE_Xag.Q THEN
  		state[2] := 3;
  	ELSIF state[2] = 36 & GD_IN_5 THEN
  		state[2] := 39;
  	ELSIF state[2] = 38 & FE_Xag.Q THEN
  		state[2] := 4;
  	ELSIF state[2] = 39 & FE_Xag.Q THEN
  		state[2] := 5;
  	END_IF;

	IF state[3] = 0 & GD_IN_15 THEN
  		state[3] := 1;
  	ELSIF state[3] = 2 & FE_BaP.Q THEN
  		state[3] := 3;
  	ELSIF state[3] = 5 & GD_IN_5 THEN
  		state[3] := 6;
  	END_IF;

	IF state[4] = 3 & GD_IN_8 THEN
  		state[4] := 4;
  	ELSIF state[4] = 4 & FE_PaL.Q THEN
  		state[4] := 5;
  	END_IF;


	CASE state[0] OF
  		1:
  			GD_OUT_2 := 1;
		3:
  			GD_OUT_2 := 0;
  		4:
  			GD_OUT_4_G[0] := 1;
		6:
  			GD_OUT_4_G[0] := 0;
  	END_CASE;

	CASE state[1] OF
  		0:
  			GD_OUT_4_G[1] := 1;
		1:
  			CASE slt1[0] OF
  				0:
  					GD_OUT_4_G[1] := 1;
  				1:
  					GD_OUT_6 := 1;
  			END_CASE;
  			slt1[0] := slt1[0] + 1;
  			IF slt1[0] = 2 THEN
  				slt1[0] := 0;
  			END_IF;
  		3:
  			GD_OUT_6 := 1;
		4:
  			GD_OUT_4_G[1] := 1;
		6:
  			CASE slt1[1] OF
  				0:
  					GD_OUT_4_G[1] := 1;
  				1:
  					GD_OUT_7_G[0] := 1;
  			END_CASE;
  			slt1[1] := slt1[1] + 1;
  			IF slt1[1] = 2 THEN
  				slt1[1] := 0;
  			END_IF;
  		7:
  			GD_OUT_7_G[0] := 1;
		8:
  			GD_OUT_4_G[1] := 1;
		9:
  			GD_OUT_4_G[1] := 0;
  		10:
  			CASE slt1[2] OF
  				0:
  					GD_OUT_4_G[1] := 1;
  				1:
  					GD_OUT_6 := 0;
  			END_CASE;
  			slt1[2] := slt1[2] + 1;
  			IF slt1[2] = 2 THEN
  				slt1[2] := 0;
  			END_IF;
  		11:
  			GD_OUT_6 := 0;
  		12:
  			GD_OUT_4_G[1] := 1;
		14:
  			CASE slt1[3] OF
  				0:
  					GD_OUT_4_G[1] := 1;
  				1:
  					GD_OUT_8_G[0] := 1;
  			END_CASE;
  			slt1[3] := slt1[3] + 1;
  			IF slt1[3] = 2 THEN
  				slt1[3] := 0;
  			END_IF;
  		15:
  			GD_OUT_8_G[0] := 1;
		16:
  			GD_OUT_4_G[1] := 1;
		18:
  			CASE slt1[4] OF
  				0:
  					GD_OUT_4_G[1] := 1;
  				1:
  					GD_OUT_6 := 1;
  			END_CASE;
  			slt1[4] := slt1[4] + 1;
  			IF slt1[4] = 2 THEN
  				slt1[4] := 0;
  			END_IF;
  		19:
  			GD_OUT_6 := 1;
		20:
  			GD_OUT_4_G[1] := 1;
		22:
  			CASE slt1[5] OF
  				0:
  					GD_OUT_4_G[1] := 1;
  				1:
  					GD_OUT_7_G[0] := 0;
  			END_CASE;
  			slt1[5] := slt1[5] + 1;
  			IF slt1[5] = 2 THEN
  				slt1[5] := 0;
  			END_IF;
  		23:
  			GD_OUT_7_G[0] := 0;
  		24:
  			CASE slt1[6] OF
  				0:
  					GD_OUT_4_G[1] := 1;
  				1:
  					GD_OUT_6 := 0;
  			END_CASE;
  			slt1[6] := slt1[6] + 1;
  			IF slt1[6] = 2 THEN
  				slt1[6] := 0;
  			END_IF;
  		25:
  			GD_OUT_6 := 0;
  		26:
  			GD_OUT_4_G[1] := 1;
		28:
  			CASE slt1[7] OF
  				0:
  					GD_OUT_4_G[1] := 1;
  				1:
  					GD_OUT_8_G[0] := 0;
  			END_CASE;
  			slt1[7] := slt1[7] + 1;
  			IF slt1[7] = 2 THEN
  				slt1[7] := 0;
  			END_IF;
  		29:
  			GD_OUT_8_G[0] := 0;
  		30:
  			GD_OUT_4_G[1] := 1;
	END_CASE;

	CASE state[2] OF
  		0:
  			CASE slt2[0] OF
  				0:
  					GD_OUT_7_G[1] := 1;
  				1:
  					GD_OUT_5_G[0] := 1;
  			END_CASE;
  			slt2[0] := slt2[0] + 1;
  			IF slt2[0] = 2 THEN
  				slt2[0] := 0;
  			END_IF;
  		1:
  			GD_OUT_5_G[0] := 1;
		2:
  			GD_OUT_7_G[1] := 1;
		4:
  			CASE slt2[1] OF
  				0:
  					GD_OUT_7_G[1] := 1;
  				1:
  					GD_OUT_8_G[1] := 1;
  			END_CASE;
  			slt2[1] := slt2[1] + 1;
  			IF slt2[1] = 2 THEN
  				slt2[1] := 0;
  			END_IF;
  		5:
  			GD_OUT_8_G[1] := 1;
		6:
  			GD_OUT_7_G[1] := 1;
		7:
  			GD_OUT_7_G[1] := 0;
  		8:
  			CASE slt2[2] OF
  				0:
  					GD_OUT_7_G[1] := 1;
  				1:
  					GD_OUT_8_G[1] := 0;
  			END_CASE;
  			slt2[2] := slt2[2] + 1;
  			IF slt2[2] = 2 THEN
  				slt2[2] := 0;
  			END_IF;
  		9:
  			CASE slt2[3] OF
  				0:
  					GD_OUT_7_G[1] := 0;
  				1:
  					GD_OUT_8_G[1] := 0;
  			END_CASE;
  			slt2[3] := slt2[3] + 1;
  			IF slt2[3] = 2 THEN
  				slt2[3] := 0;
  			END_IF;
  		10:
  			CASE slt2[4] OF
  				0:
  					GD_OUT_7_G[1] := 1;
  				1:
  					GD_OUT_5_G[0] := 0;
  			END_CASE;
  			slt2[4] := slt2[4] + 1;
  			IF slt2[4] = 2 THEN
  				slt2[4] := 0;
  			END_IF;
  		11:
  			GD_OUT_7_G[1] := 1;
		12:
  			CASE slt2[5] OF
  				0:
  					GD_OUT_7_G[1] := 1;
  				1:
  					GD_OUT_8_G[1] := 0;
  				2:
  					GD_OUT_5_G[0] := 0;
  			END_CASE;
  			slt2[5] := slt2[5] + 1;
  			IF slt2[5] = 3 THEN
  				slt2[5] := 0;
  			END_IF;
  		13:
  			GD_OUT_7_G[1] := 0;
  		14:
  			GD_OUT_5_G[0] := 0;
  		15:
  			CASE slt2[6] OF
  				0:
  					GD_OUT_7_G[1] := 1;
  				1:
  					GD_OUT_5_G[0] := 1;
  			END_CASE;
  			slt2[6] := slt2[6] + 1;
  			IF slt2[6] = 2 THEN
  				slt2[6] := 0;
  			END_IF;
  		16:
  			GD_OUT_7_G[1] := 1;
		17:
  			CASE slt2[7] OF
  				0:
  					GD_OUT_8_G[1] := 0;
  				1:
  					GD_OUT_5_G[0] := 0;
  			END_CASE;
  			slt2[7] := slt2[7] + 1;
  			IF slt2[7] = 2 THEN
  				slt2[7] := 0;
  			END_IF;
  		18:
  			CASE slt2[8] OF
  				0:
  					GD_OUT_7_G[1] := 1;
  				1:
  					GD_OUT_5_G[0] := 0;
  			END_CASE;
  			slt2[8] := slt2[8] + 1;
  			IF slt2[8] = 2 THEN
  				slt2[8] := 0;
  			END_IF;
  		19:
  			CASE slt2[9] OF
  				0:
  					GD_OUT_7_G[1] := 1;
  				1:
  					GD_OUT_8_G[1] := 0;
  				2:
  					GD_OUT_5_G[0] := 1;
  			END_CASE;
  			slt2[9] := slt2[9] + 1;
  			IF slt2[9] = 3 THEN
  				slt2[9] := 0;
  			END_IF;
  		20:
  			GD_OUT_7_G[1] := 0;
  		21:
  			GD_OUT_5_G[0] := 1;
		22:
  			GD_OUT_7_G[1] := 1;
		23:
  			GD_OUT_5_G[0] := 0;
  		24:
  			CASE slt2[10] OF
  				0:
  					GD_OUT_8_G[1] := 0;
  				1:
  					GD_OUT_5_G[0] := 1;
  			END_CASE;
  			slt2[10] := slt2[10] + 1;
  			IF slt2[10] = 2 THEN
  				slt2[10] := 0;
  			END_IF;
  		25:
  			CASE slt2[11] OF
  				0:
  					GD_OUT_7_G[1] := 1;
  				1:
  					GD_OUT_5_G[0] := 0;
  			END_CASE;
  			slt2[11] := slt2[11] + 1;
  			IF slt2[11] = 2 THEN
  				slt2[11] := 0;
  			END_IF;
  		26:
  			CASE slt2[12] OF
  				0:
  					GD_OUT_7_G[1] := 1;
  				1:
  					GD_OUT_5_G[0] := 1;
  			END_CASE;
  			slt2[12] := slt2[12] + 1;
  			IF slt2[12] = 2 THEN
  				slt2[12] := 0;
  			END_IF;
  		27:
  			CASE slt2[13] OF
  				0:
  					GD_OUT_7_G[1] := 1;
  				1:
  					GD_OUT_8_G[1] := 0;
  			END_CASE;
  			slt2[13] := slt2[13] + 1;
  			IF slt2[13] = 2 THEN
  				slt2[13] := 0;
  			END_IF;
  		29:
  			GD_OUT_7_G[1] := 1;
		30:
  			GD_OUT_5_G[0] := 0;
  		31:
  			GD_OUT_5_G[0] := 1;
		32:
  			GD_OUT_8_G[1] := 0;
  		33:
  			GD_OUT_7_G[1] := 1;
		34:
  			CASE slt2[14] OF
  				0:
  					GD_OUT_7_G[1] := 1;
  				1:
  					GD_OUT_8_G[1] := 0;
  			END_CASE;
  			slt2[14] := slt2[14] + 1;
  			IF slt2[14] = 2 THEN
  				slt2[14] := 0;
  			END_IF;
  		37:
  			GD_OUT_8_G[1] := 0;
  		38:
  			GD_OUT_7_G[1] := 1;
	END_CASE;

	CASE state[3] OF
  		1:
  			GD_OUT_3 := 1;
		3:
  			GD_OUT_3 := 0;
  		4:
  			GD_OUT_5_G[1] := 1;
		6:
  			GD_OUT_5_G[1] := 0;
  	END_CASE;

	CASE state[4] OF
  		0:
  			GD_OUT_5_G[2] := 1;
		1:
  			GD_OUT_5_G[2] := 0;
  		2:
  			GD_OUT_9 := 1;
		5:
  			GD_OUT_9 := 0;
  	END_CASE;
	IF GD_OUT_4_G[0] <> GD_OUT_4_G[1] THEN
		GD_OUT_4_G[0] := GD_OUT_4;
		GD_OUT_4_G[1] := GD_OUT_4;
	END_IF;
	GD_OUT_4 := GD_OUT_4_G[0];
	IF GD_OUT_7_G[0] <> GD_OUT_7_G[1] THEN
		GD_OUT_7_G[0] := GD_OUT_7;
		GD_OUT_7_G[1] := GD_OUT_7;
	END_IF;
	GD_OUT_7 := GD_OUT_7_G[0];
	IF GD_OUT_8_G[0] <> GD_OUT_8_G[1] THEN
		GD_OUT_8_G[0] := GD_OUT_8;
		GD_OUT_8_G[1] := GD_OUT_8;
	END_IF;
	GD_OUT_8 := GD_OUT_8_G[0];
	IF (GD_OUT_5_G[0] <> GD_OUT_5_G[1]) OR (GD_OUT_5_G[1] <> GD_OUT_5_G[2]) THEN
		GD_OUT_5_G[0] := GD_OUT_5;
		GD_OUT_5_G[1] := GD_OUT_5;
		GD_OUT_5_G[2] := GD_OUT_5;			
	END_IF;
	GD_OUT_5 := GD_OUT_5_G[0];
	IF state[0] = 1 & GD_OUT_2 THEN
  		state[0] := 2;
  	ELSIF state[0] = 3 & NOT GD_OUT_2 THEN
  		state[0] := 4;
  	ELSIF state[0] = 4 & GD_OUT_4 THEN
  		state[0] := 5;
  	ELSIF state[0] = 6 & NOT GD_OUT_4 THEN
  		state[0] := 1;
  	END_IF;
	IF state[1] = 0 & GD_OUT_4 THEN
  		state[1] := 2;
  	ELSIF state[1] = 1 & GD_OUT_4 THEN
  		state[1] := 3;
  	ELSIF state[1] = 1 & GD_OUT_6 THEN
  		state[1] := 4;
  	ELSIF state[1] = 3 & GD_OUT_6 THEN
  		state[1] := 5;
  	ELSIF state[1] = 4 & GD_OUT_4 THEN
  		state[1] := 5;
  	ELSIF state[1] = 6 & GD_OUT_4 THEN
  		state[1] := 7;
  	ELSIF state[1] = 6 & GD_OUT_7 THEN
  		state[1] := 8;
  	ELSIF state[1] = 7 & GD_OUT_7 THEN
  		state[1] := 9;
  	ELSIF state[1] = 8 & GD_OUT_4 THEN
  		state[1] := 9;
  	ELSIF state[1] = 9 & NOT GD_OUT_4 THEN
  		state[1] := 10;
  	ELSIF state[1] = 10 & GD_OUT_4 THEN
  		state[1] := 11;
  	ELSIF state[1] = 10 & NOT GD_OUT_6 THEN
  		state[1] := 12;
  	ELSIF state[1] = 11 & NOT GD_OUT_6 THEN
  		state[1] := 13;
  	ELSIF state[1] = 12 & GD_OUT_4 THEN
  		state[1] := 13;
  	ELSIF state[1] = 14 & GD_OUT_4 THEN
  		state[1] := 15;
  	ELSIF state[1] = 14 & GD_OUT_8 THEN
  		state[1] := 16;
  	ELSIF state[1] = 15 & GD_OUT_8 THEN
  		state[1] := 17;
  	ELSIF state[1] = 16 & GD_OUT_4 THEN
  		state[1] := 17;
  	ELSIF state[1] = 18 & GD_OUT_4 THEN
  		state[1] := 19;
  	ELSIF state[1] = 18 & GD_OUT_6 THEN
  		state[1] := 20;
  	ELSIF state[1] = 19 & GD_OUT_6 THEN
  		state[1] := 21;
  	ELSIF state[1] = 20 & GD_OUT_4 THEN
  		state[1] := 21;
  	ELSIF state[1] = 22 & GD_OUT_4 THEN
  		state[1] := 23;
  	ELSIF state[1] = 22 & NOT GD_OUT_7 THEN
  		state[1] := 24;
  	ELSIF state[1] = 23 & NOT GD_OUT_7 THEN
  		state[1] := 25;
  	ELSIF state[1] = 24 & GD_OUT_4 THEN
  		state[1] := 25;
  	ELSIF state[1] = 24 & NOT GD_OUT_6 THEN
  		state[1] := 26;
  	ELSIF state[1] = 25 & NOT GD_OUT_6 THEN
  		state[1] := 27;
  	ELSIF state[1] = 26 & GD_OUT_4 THEN
  		state[1] := 27;
  	ELSIF state[1] = 28 & GD_OUT_4 THEN
  		state[1] := 29;
  	ELSIF state[1] = 28 & NOT GD_OUT_8 THEN
  		state[1] := 30;
  	ELSIF state[1] = 29 & NOT GD_OUT_8 THEN
  		state[1] := 31;
  	ELSIF state[1] = 30 & GD_OUT_4 THEN
  		state[1] := 31;
  	END_IF;
	IF state[2] = 0 & GD_OUT_7 THEN
  		state[2] := 1;
  	ELSIF state[2] = 0 & GD_OUT_5 THEN
  		state[2] := 2;
  	ELSIF state[2] = 1 & GD_OUT_5 THEN
  		state[2] := 3;
  	ELSIF state[2] = 2 & GD_OUT_7 THEN
  		state[2] := 3;
  	ELSIF state[2] = 4 & GD_OUT_7 THEN
  		state[2] := 5;
  	ELSIF state[2] = 4 & GD_OUT_8 THEN
  		state[2] := 6;
  	ELSIF state[2] = 5 & GD_OUT_8 THEN
  		state[2] := 7;
  	ELSIF state[2] = 6 & GD_OUT_7 THEN
  		state[2] := 7;
  	ELSIF state[2] = 7 & NOT GD_OUT_7 THEN
  		state[2] := 10;
  	ELSIF state[2] = 8 & GD_OUT_7 THEN
  		state[2] := 9;
  	ELSIF state[2] = 8 & NOT GD_OUT_8 THEN
  		state[2] := 11;
  	ELSIF state[2] = 9 & NOT GD_OUT_7 THEN
  		state[2] := 12;
  	ELSIF state[2] = 9 & NOT GD_OUT_8 THEN
  		state[2] := 13;
  	ELSIF state[2] = 10 & GD_OUT_7 THEN
  		state[2] := 14;
  	ELSIF state[2] = 10 & NOT GD_OUT_5 THEN
  		state[2] := 15;
  	ELSIF state[2] = 11 & GD_OUT_7 THEN
  		state[2] := 13;
  	ELSIF state[2] = 12 & GD_OUT_7 THEN
  		state[2] := 17;
  	ELSIF state[2] = 12 & NOT GD_OUT_8 THEN
  		state[2] := 18;
  	ELSIF state[2] = 12 & NOT GD_OUT_5 THEN
  		state[2] := 19;
  	ELSIF state[2] = 13 & NOT GD_OUT_7 THEN
  		state[2] := 18;
  	ELSIF state[2] = 14 & NOT GD_OUT_5 THEN
  		state[2] := 21;
  	ELSIF state[2] = 15 & GD_OUT_7 THEN
  		state[2] := 21;
  	ELSIF state[2] = 15 & GD_OUT_5 THEN
  		state[2] := 22;
  	ELSIF state[2] = 16 & GD_OUT_7 THEN
  		state[2] := 20;
  	ELSIF state[2] = 17 & NOT GD_OUT_8 THEN
  		state[2] := 23;
  	ELSIF state[2] = 17 & NOT GD_OUT_5 THEN
  		state[2] := 24;
  	ELSIF state[2] = 18 & GD_OUT_7 THEN
  		state[2] := 23;
  	ELSIF state[2] = 18 & NOT GD_OUT_5 THEN
  		state[2] := 26;
  	ELSIF state[2] = 19 & GD_OUT_7 THEN
  		state[2] := 24;
  	ELSIF state[2] = 19 & NOT GD_OUT_8 THEN
  		state[2] := 26;
  	ELSIF state[2] = 19 & GD_OUT_5 THEN
  		state[2] := 27;
  	ELSIF state[2] = 20 & NOT GD_OUT_7 THEN
  		state[2] := 25;
  	ELSIF state[2] = 21 & GD_OUT_5 THEN
  		state[2] := 28;
  	ELSIF state[2] = 22 & GD_OUT_7 THEN
  		state[2] := 28;
  	ELSIF state[2] = 23 & NOT GD_OUT_5 THEN
  		state[2] := 31;
  	ELSIF state[2] = 24 & NOT GD_OUT_8 THEN
  		state[2] := 31;
  	ELSIF state[2] = 24 & GD_OUT_5 THEN
  		state[2] := 32;
  	ELSIF state[2] = 25 & GD_OUT_7 THEN
  		state[2] := 30;
  	ELSIF state[2] = 25 & NOT GD_OUT_5 THEN
  		state[2] := 0;
  	ELSIF state[2] = 26 & GD_OUT_7 THEN
  		state[2] := 31;
  	ELSIF state[2] = 26 & GD_OUT_5 THEN
  		state[2] := 33;
  	ELSIF state[2] = 27 & GD_OUT_7 THEN
  		state[2] := 32;
  	ELSIF state[2] = 27 & NOT GD_OUT_8 THEN
  		state[2] := 33;
  	ELSIF state[2] = 29 & GD_OUT_7 THEN
  		state[2] := 35;
  	ELSIF state[2] = 30 & NOT GD_OUT_5 THEN
  		state[2] := 1;
  	ELSIF state[2] = 31 & GD_OUT_5 THEN
  		state[2] := 36;
  	ELSIF state[2] = 32 & NOT GD_OUT_8 THEN
  		state[2] := 36;
  	ELSIF state[2] = 33 & GD_OUT_7 THEN
  		state[2] := 36;
  	ELSIF state[2] = 34 & GD_OUT_7 THEN
  		state[2] := 37;
  	ELSIF state[2] = 34 & NOT GD_OUT_8 THEN
  		state[2] := 38;
  	ELSIF state[2] = 37 & NOT GD_OUT_8 THEN
  		state[2] := 39;
  	ELSIF state[2] = 38 & GD_OUT_7 THEN
  		state[2] := 39;
  	END_IF;
	IF state[3] = 1 & GD_OUT_3 THEN
  		state[3] := 2;
  	ELSIF state[3] = 3 & NOT GD_OUT_3 THEN
  		state[3] := 4;
  	ELSIF state[3] = 4 & GD_OUT_5 THEN
  		state[3] := 5;
  	ELSIF state[3] = 6 & NOT GD_OUT_5 THEN
  		state[3] := 1;
  	END_IF;
	IF state[4] = 0 & GD_OUT_5 THEN
  		state[4] := 1;
  	ELSIF state[4] = 1 & NOT GD_OUT_5 THEN
  		state[4] := 2;
  	ELSIF state[4] = 2 & GD_OUT_9 THEN
  		state[4] := 3;
  	ELSIF state[4] = 5 & NOT GD_OUT_9 THEN
  		state[4] := 0;
  	END_IF;

END_PROGRAM

CONFIGURATION Config0

	RESOURCE Res0 ON PLC
		TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
		PROGRAM instance0 WITH task0 : tesis0;
	END_RESOURCE
END_CONFIGURATION