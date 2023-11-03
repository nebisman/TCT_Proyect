PROGRAM tesis0
	VAR
		state : ARRAY [0..3] OF DINT;
		slt1 : ARRAY [0..31] OF DINT;
		FE_LaP : F_TRIG;
		FE_Zag : F_TRIG;
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
		GD_IN_6 AT %IX100.6 : BOOL;
	END_VAR
	FE_LaP(CLK:= GD_IN_2);
	FE_Zag(CLK:= GD_IN_6);
	IF state[0] = 0 & GD_IN_15 THEN
  		state[0] := 1;
  	ELSIF state[0] = 2 & FE_LaP.Q THEN
  		state[0] := 3;
  	ELSIF state[0] = 5 & GD_IN_4 THEN
  		state[0] := 6;
  	END_IF;
	CASE state[0] OF
  		1:
  			GD_OUT_2 := 1;
  		3:
  			GD_OUT_2 := 0;
  		4:
  			GD_OUT_4 := 1;
  		6:
  			GD_OUT_4 := 0;
  	END_CASE;
	IF state[0] = 1 & GD_OUT_2 THEN
  		state[0] := 2;
  	ELSIF state[0] = 3 & NOT GD_OUT_2 THEN
  		state[0] := 4;
  	ELSIF state[0] = 4 & GD_OUT_4 THEN
  		state[0] := 5;
  	ELSIF state[0] = 6 & NOT GD_OUT_4 THEN
  		state[0] := 1;
  	END_IF;	IF state[1] = 0 & GD_IN_4 THEN
  		state[1] := 1;
  	ELSIF state[1] = 2 & GD_IN_4 THEN
  		state[1] := 3;
  	ELSIF state[1] = 4 & FE_Zag.Q THEN
  		state[1] := 6;
  	ELSIF state[1] = 5 & FE_Zag.Q THEN
  		state[1] := 7;
  	ELSIF state[1] = 15 & GD_IN_4 THEN
  		state[1] := 19;
  	ELSIF state[1] = 15 & FE_Zag.Q THEN
  		state[1] := 20;
  	ELSIF state[1] = 17 & GD_IN_4 THEN
  		state[1] := 22;
  	ELSIF state[1] = 17 & FE_Zag.Q THEN
  		state[1] := 23;
  	ELSIF state[1] = 18 & GD_IN_4 THEN
  		state[1] := 24;
  	ELSIF state[1] = 18 & FE_Zag.Q THEN
  		state[1] := 0;
  	ELSIF state[1] = 19 & FE_Zag.Q THEN
  		state[1] := 25;
  	ELSIF state[1] = 20 & GD_IN_4 THEN
  		state[1] := 26;
  	ELSIF state[1] = 21 & GD_IN_4 THEN
  		state[1] := 27;
  	ELSIF state[1] = 21 & FE_Zag.Q THEN
  		state[1] := 2;
  	ELSIF state[1] = 22 & FE_Zag.Q THEN
  		state[1] := 28;
  	ELSIF state[1] = 23 & GD_IN_4 THEN
  		state[1] := 29;
  	ELSIF state[1] = 24 & FE_Zag.Q THEN
  		state[1] := 30;
  	ELSIF state[1] = 27 & FE_Zag.Q THEN
  		state[1] := 33;
  	ELSIF state[1] = 31 & FE_Zag.Q THEN
  		state[1] := 38;
  	ELSIF state[1] = 32 & FE_Zag.Q THEN
  		state[1] := 38;
  	ELSIF state[1] = 34 & FE_Zag.Q THEN
  		state[1] := 41;
  	ELSIF state[1] = 35 & FE_Zag.Q THEN
  		state[1] := 41;
  	ELSIF state[1] = 37 & FE_Zag.Q THEN
  		state[1] := 6;
  	ELSIF state[1] = 40 & FE_Zag.Q THEN
  		state[1] := 7;
  	ELSIF state[1] = 43 & FE_Zag.Q THEN
  		state[1] := 8;
  	ELSIF state[1] = 46 & FE_Zag.Q THEN
  		state[1] := 9;
  	ELSIF state[1] = 47 & FE_Zag.Q THEN
  		state[1] := 10;
  	ELSIF state[1] = 50 & FE_Zag.Q THEN
  		state[1] := 11;
  	ELSIF state[1] = 51 & FE_Zag.Q THEN
  		state[1] := 12;
  	ELSIF state[1] = 53 & FE_Zag.Q THEN
  		state[1] := 13;
  	ELSIF state[1] = 54 & FE_Zag.Q THEN
  		state[1] := 14;
  	ELSIF state[1] = 55 & FE_Zag.Q THEN
  		state[1] := 16;
  	END_IF;
	CASE state[1] OF
  		0:
  			GD_OUT_4 := 1;
  		1:
  			CASE slt1[0] OF
  				0:
  					GD_OUT_4 := 1;
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
  			GD_OUT_4 := 1;
  		6:
  			CASE slt1[1] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_7 := 1;
  			END_CASE;
  			slt1[1] := slt1[1] + 1;
  			IF slt1[1] = 2 THEN
  				slt1[1] := 0;
  			END_IF;
  		7:
  			GD_OUT_7 := 1;
  		8:
  			CASE slt1[2] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_7 := 0;
  			END_CASE;
  			slt1[2] := slt1[2] + 1;
  			IF slt1[2] = 2 THEN
  				slt1[2] := 0;
  			END_IF;
  		9:
  			CASE slt1[3] OF
  				0:
  					GD_OUT_4 := 0;
  				1:
  					GD_OUT_7 := 0;
  			END_CASE;
  			slt1[3] := slt1[3] + 1;
  			IF slt1[3] = 2 THEN
  				slt1[3] := 0;
  			END_IF;
  		10:
  			GD_OUT_4 := 1;
  		11:
  			CASE slt1[4] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_7 := 0;
  				2:
  					GD_OUT_6 := 0;
  			END_CASE;
  			slt1[4] := slt1[4] + 1;
  			IF slt1[4] = 3 THEN
  				slt1[4] := 0;
  			END_IF;
  		12:
  			GD_OUT_4 := 0;
  		13:
  			CASE slt1[5] OF
  				0:
  					GD_OUT_7 := 0;
  				1:
  					GD_OUT_6 := 0;
  			END_CASE;
  			slt1[5] := slt1[5] + 1;
  			IF slt1[5] = 2 THEN
  				slt1[5] := 0;
  			END_IF;
  		14:
  			CASE slt1[6] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_6 := 0;
  			END_CASE;
  			slt1[6] := slt1[6] + 1;
  			IF slt1[6] = 2 THEN
  				slt1[6] := 0;
  			END_IF;
  		15:
  			CASE slt1[7] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_7 := 0;
  			END_CASE;
  			slt1[7] := slt1[7] + 1;
  			IF slt1[7] = 2 THEN
  				slt1[7] := 0;
  			END_IF;
  		16:
  			GD_OUT_6 := 0;
  		17:
  			GD_OUT_7 := 0;
  		18:
  			GD_OUT_4 := 1;
  		19:
  			CASE slt1[8] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_7 := 0;
  			END_CASE;
  			slt1[8] := slt1[8] + 1;
  			IF slt1[8] = 2 THEN
  				slt1[8] := 0;
  			END_IF;
  		20:
  			CASE slt1[9] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_7 := 0;
  			END_CASE;
  			slt1[9] := slt1[9] + 1;
  			IF slt1[9] = 2 THEN
  				slt1[9] := 0;
  			END_IF;
  		22:
  			GD_OUT_7 := 0;
  		23:
  			GD_OUT_7 := 0;
  		24:
  			GD_OUT_4 := 1;
  		25:
  			CASE slt1[10] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_7 := 0;
  				2:
  					GD_OUT_6 := 1;
  			END_CASE;
  			slt1[10] := slt1[10] + 1;
  			IF slt1[10] = 3 THEN
  				slt1[10] := 0;
  			END_IF;
  		26:
  			CASE slt1[11] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_7 := 0;
  				2:
  					GD_OUT_6 := 1;
  			END_CASE;
  			slt1[11] := slt1[11] + 1;
  			IF slt1[11] = 3 THEN
  				slt1[11] := 0;
  			END_IF;
  		28:
  			CASE slt1[12] OF
  				0:
  					GD_OUT_7 := 0;
  				1:
  					GD_OUT_6 := 1;
  			END_CASE;
  			slt1[12] := slt1[12] + 1;
  			IF slt1[12] = 2 THEN
  				slt1[12] := 0;
  			END_IF;
  		29:
  			CASE slt1[13] OF
  				0:
  					GD_OUT_7 := 0;
  				1:
  					GD_OUT_6 := 1;
  			END_CASE;
  			slt1[13] := slt1[13] + 1;
  			IF slt1[13] = 2 THEN
  				slt1[13] := 0;
  			END_IF;
  		30:
  			CASE slt1[14] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_7 := 1;
  				2:
  					GD_OUT_6 := 1;
  			END_CASE;
  			slt1[14] := slt1[14] + 1;
  			IF slt1[14] = 3 THEN
  				slt1[14] := 0;
  			END_IF;
  		31:
  			CASE slt1[15] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_7 := 0;
  			END_CASE;
  			slt1[15] := slt1[15] + 1;
  			IF slt1[15] = 2 THEN
  				slt1[15] := 0;
  			END_IF;
  		32:
  			CASE slt1[16] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_7 := 0;
  			END_CASE;
  			slt1[16] := slt1[16] + 1;
  			IF slt1[16] = 2 THEN
  				slt1[16] := 0;
  			END_IF;
  		33:
  			CASE slt1[17] OF
  				0:
  					GD_OUT_7 := 1;
  				1:
  					GD_OUT_6 := 1;
  			END_CASE;
  			slt1[17] := slt1[17] + 1;
  			IF slt1[17] = 2 THEN
  				slt1[17] := 0;
  			END_IF;
  		34:
  			GD_OUT_7 := 0;
  		35:
  			GD_OUT_7 := 0;
  		36:
  			CASE slt1[18] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_7 := 0;
  				2:
  					GD_OUT_6 := 1;
  			END_CASE;
  			slt1[18] := slt1[18] + 1;
  			IF slt1[18] = 3 THEN
  				slt1[18] := 0;
  			END_IF;
  		37:
  			CASE slt1[19] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_7 := 1;
  			END_CASE;
  			slt1[19] := slt1[19] + 1;
  			IF slt1[19] = 2 THEN
  				slt1[19] := 0;
  			END_IF;
  		38:
  			CASE slt1[20] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_7 := 0;
  			END_CASE;
  			slt1[20] := slt1[20] + 1;
  			IF slt1[20] = 2 THEN
  				slt1[20] := 0;
  			END_IF;
  		39:
  			CASE slt1[21] OF
  				0:
  					GD_OUT_4 := 0;
  				1:
  					GD_OUT_7 := 0;
  				2:
  					GD_OUT_6 := 1;
  			END_CASE;
  			slt1[21] := slt1[21] + 1;
  			IF slt1[21] = 3 THEN
  				slt1[21] := 0;
  			END_IF;
  		40:
  			GD_OUT_7 := 1;
  		41:
  			GD_OUT_7 := 0;
  		42:
  			CASE slt1[22] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_6 := 1;
  			END_CASE;
  			slt1[22] := slt1[22] + 1;
  			IF slt1[22] = 2 THEN
  				slt1[22] := 0;
  			END_IF;
  		43:
  			CASE slt1[23] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_7 := 0;
  			END_CASE;
  			slt1[23] := slt1[23] + 1;
  			IF slt1[23] = 2 THEN
  				slt1[23] := 0;
  			END_IF;
  		44:
  			CASE slt1[24] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_7 := 0;
  				2:
  					GD_OUT_6 := 1;
  			END_CASE;
  			slt1[24] := slt1[24] + 1;
  			IF slt1[24] = 3 THEN
  				slt1[24] := 0;
  			END_IF;
  		45:
  			CASE slt1[25] OF
  				0:
  					GD_OUT_4 := 0;
  				1:
  					GD_OUT_6 := 1;
  			END_CASE;
  			slt1[25] := slt1[25] + 1;
  			IF slt1[25] = 2 THEN
  				slt1[25] := 0;
  			END_IF;
  		46:
  			CASE slt1[26] OF
  				0:
  					GD_OUT_4 := 0;
  				1:
  					GD_OUT_7 := 0;
  			END_CASE;
  			slt1[26] := slt1[26] + 1;
  			IF slt1[26] = 2 THEN
  				slt1[26] := 0;
  			END_IF;
  		47:
  			GD_OUT_4 := 1;
  		48:
  			CASE slt1[27] OF
  				0:
  					GD_OUT_7 := 0;
  				1:
  					GD_OUT_6 := 1;
  			END_CASE;
  			slt1[27] := slt1[27] + 1;
  			IF slt1[27] = 2 THEN
  				slt1[27] := 0;
  			END_IF;
  		49:
  			CASE slt1[28] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_6 := 1;
  			END_CASE;
  			slt1[28] := slt1[28] + 1;
  			IF slt1[28] = 2 THEN
  				slt1[28] := 0;
  			END_IF;
  		50:
  			CASE slt1[29] OF
  				0:
  					GD_OUT_4 := 1;
  				1:
  					GD_OUT_7 := 0;
  			END_CASE;
  			slt1[29] := slt1[29] + 1;
  			IF slt1[29] = 2 THEN
  				slt1[29] := 0;
  			END_IF;
  		51:
  			GD_OUT_4 := 0;
  		52:
  			GD_OUT_6 := 1;
  		53:
  			GD_OUT_7 := 0;
  		54:
  			GD_OUT_4 := 1;
  	END_CASE;
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
  	ELSIF state[1] = 8 & NOT GD_OUT_7 THEN
  		state[1] := 10;
  	ELSIF state[1] = 9 & NOT GD_OUT_4 THEN
  		state[1] := 11;
  	ELSIF state[1] = 9 & NOT GD_OUT_7 THEN
  		state[1] := 12;
  	ELSIF state[1] = 10 & GD_OUT_4 THEN
  		state[1] := 12;
  	ELSIF state[1] = 11 & GD_OUT_4 THEN
  		state[1] := 13;
  	ELSIF state[1] = 11 & NOT GD_OUT_7 THEN
  		state[1] := 14;
  	ELSIF state[1] = 11 & NOT GD_OUT_6 THEN
  		state[1] := 15;
  	ELSIF state[1] = 12 & NOT GD_OUT_4 THEN
  		state[1] := 14;
  	ELSIF state[1] = 13 & NOT GD_OUT_7 THEN
  		state[1] := 16;
  	ELSIF state[1] = 13 & NOT GD_OUT_6 THEN
  		state[1] := 17;
  	ELSIF state[1] = 14 & GD_OUT_4 THEN
  		state[1] := 16;
  	ELSIF state[1] = 14 & NOT GD_OUT_6 THEN
  		state[1] := 18;
  	ELSIF state[1] = 15 & GD_OUT_4 THEN
  		state[1] := 17;
  	ELSIF state[1] = 15 & NOT GD_OUT_7 THEN
  		state[1] := 18;
  	ELSIF state[1] = 16 & NOT GD_OUT_6 THEN
  		state[1] := 21;
  	ELSIF state[1] = 17 & NOT GD_OUT_7 THEN
  		state[1] := 21;
  	ELSIF state[1] = 18 & GD_OUT_4 THEN
  		state[1] := 21;
  	ELSIF state[1] = 19 & GD_OUT_4 THEN
  		state[1] := 22;
  	ELSIF state[1] = 19 & NOT GD_OUT_7 THEN
  		state[1] := 24;
  	ELSIF state[1] = 20 & GD_OUT_4 THEN
  		state[1] := 23;
  	ELSIF state[1] = 20 & NOT GD_OUT_7 THEN
  		state[1] := 0;
  	ELSIF state[1] = 22 & NOT GD_OUT_7 THEN
  		state[1] := 27;
  	ELSIF state[1] = 23 & NOT GD_OUT_7 THEN
  		state[1] := 2;
  	ELSIF state[1] = 24 & GD_OUT_4 THEN
  		state[1] := 27;
  	ELSIF state[1] = 25 & GD_OUT_4 THEN
  		state[1] := 28;
  	ELSIF state[1] = 25 & NOT GD_OUT_7 THEN
  		state[1] := 30;
  	ELSIF state[1] = 25 & GD_OUT_6 THEN
  		state[1] := 31;
  	ELSIF state[1] = 26 & GD_OUT_4 THEN
  		state[1] := 29;
  	ELSIF state[1] = 26 & NOT GD_OUT_7 THEN
  		state[1] := 1;
  	ELSIF state[1] = 26 & GD_OUT_6 THEN
  		state[1] := 32;
  	ELSIF state[1] = 28 & NOT GD_OUT_7 THEN
  		state[1] := 33;
  	ELSIF state[1] = 28 & GD_OUT_6 THEN
  		state[1] := 34;
  	ELSIF state[1] = 29 & NOT GD_OUT_7 THEN
  		state[1] := 3;
  	ELSIF state[1] = 29 & GD_OUT_6 THEN
  		state[1] := 35;
  	ELSIF state[1] = 30 & GD_OUT_4 THEN
  		state[1] := 33;
  	ELSIF state[1] = 30 & GD_OUT_7 THEN
  		state[1] := 36;
  	ELSIF state[1] = 30 & GD_OUT_6 THEN
  		state[1] := 37;
  	ELSIF state[1] = 31 & GD_OUT_4 THEN
  		state[1] := 34;
  	ELSIF state[1] = 31 & NOT GD_OUT_7 THEN
  		state[1] := 37;
  	ELSIF state[1] = 32 & GD_OUT_4 THEN
  		state[1] := 35;
  	ELSIF state[1] = 32 & NOT GD_OUT_7 THEN
  		state[1] := 4;
  	ELSIF state[1] = 33 & GD_OUT_7 THEN
  		state[1] := 39;
  	ELSIF state[1] = 33 & GD_OUT_6 THEN
  		state[1] := 40;
  	ELSIF state[1] = 34 & NOT GD_OUT_7 THEN
  		state[1] := 40;
  	ELSIF state[1] = 35 & NOT GD_OUT_7 THEN
  		state[1] := 5;
  	ELSIF state[1] = 36 & GD_OUT_4 THEN
  		state[1] := 39;
  	ELSIF state[1] = 36 & NOT GD_OUT_7 THEN
  		state[1] := 42;
  	ELSIF state[1] = 36 & GD_OUT_6 THEN
  		state[1] := 43;
  	ELSIF state[1] = 37 & GD_OUT_4 THEN
  		state[1] := 40;
  	ELSIF state[1] = 37 & GD_OUT_7 THEN
  		state[1] := 43;
  	ELSIF state[1] = 38 & GD_OUT_4 THEN
  		state[1] := 41;
  	ELSIF state[1] = 38 & NOT GD_OUT_7 THEN
  		state[1] := 6;
  	ELSIF state[1] = 39 & NOT GD_OUT_4 THEN
  		state[1] := 44;
  	ELSIF state[1] = 39 & NOT GD_OUT_7 THEN
  		state[1] := 45;
  	ELSIF state[1] = 39 & GD_OUT_6 THEN
  		state[1] := 46;
  	ELSIF state[1] = 40 & GD_OUT_7 THEN
  		state[1] := 46;
  	ELSIF state[1] = 41 & NOT GD_OUT_7 THEN
  		state[1] := 7;
  	ELSIF state[1] = 42 & GD_OUT_4 THEN
  		state[1] := 45;
  	ELSIF state[1] = 42 & GD_OUT_6 THEN
  		state[1] := 47;
  	ELSIF state[1] = 43 & GD_OUT_4 THEN
  		state[1] := 46;
  	ELSIF state[1] = 43 & NOT GD_OUT_7 THEN
  		state[1] := 47;
  	ELSIF state[1] = 44 & GD_OUT_4 THEN
  		state[1] := 48;
  	ELSIF state[1] = 44 & NOT GD_OUT_7 THEN
  		state[1] := 49;
  	ELSIF state[1] = 44 & GD_OUT_6 THEN
  		state[1] := 50;
  	ELSIF state[1] = 45 & NOT GD_OUT_4 THEN
  		state[1] := 49;
  	ELSIF state[1] = 45 & GD_OUT_6 THEN
  		state[1] := 51;
  	ELSIF state[1] = 46 & NOT GD_OUT_4 THEN
  		state[1] := 50;
  	ELSIF state[1] = 46 & NOT GD_OUT_7 THEN
  		state[1] := 51;
  	ELSIF state[1] = 47 & GD_OUT_4 THEN
  		state[1] := 51;
  	ELSIF state[1] = 48 & NOT GD_OUT_7 THEN
  		state[1] := 52;
  	ELSIF state[1] = 48 & GD_OUT_6 THEN
  		state[1] := 53;
  	ELSIF state[1] = 49 & GD_OUT_4 THEN
  		state[1] := 52;
  	ELSIF state[1] = 49 & GD_OUT_6 THEN
  		state[1] := 54;
  	ELSIF state[1] = 50 & GD_OUT_4 THEN
  		state[1] := 53;
  	ELSIF state[1] = 50 & NOT GD_OUT_7 THEN
  		state[1] := 54;
  	ELSIF state[1] = 51 & NOT GD_OUT_4 THEN
  		state[1] := 54;
  	ELSIF state[1] = 52 & GD_OUT_6 THEN
  		state[1] := 55;
  	ELSIF state[1] = 53 & NOT GD_OUT_7 THEN
  		state[1] := 55;
  	ELSIF state[1] = 54 & GD_OUT_4 THEN
  		state[1] := 55;
  	END_IF;
END_PROGRAM

CONFIGURATION Config0

	RESOURCE Res0 ON PLC
		TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
		PROGRAM instance0 WITH task0 : tesis0;
	END_RESOURCE
END_CONFIGURATION