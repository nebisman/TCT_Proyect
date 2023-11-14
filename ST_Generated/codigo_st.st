PROGRAM tesis0
	VAR
		random : random_number;
		random_numer : DINT;
		state : ARRAY [0..1] OF DINT;
		slt0 : ARRAY [0..33] OF DINT;
		FE_M1 : F_TRIG;
	END_VAR
	VAR
		GD_IN_1 AT %IX100.0 : BOOL;
		GD_OUT_0 AT %QX100.0 : BOOL;
		GD_OUT_1 AT %QX100.1 : BOOL;
		GD_OUT_2 AT %QX100.2 : BOOL;
		GD_OUT_3 AT %QX100.3 : BOOL;
	END_VAR
	FE_M1(CLK:= GD_IN_1);
	random(
		IN := True,
		OUT => random_numer);
	IF state[0] = 0 & GD_IN_1 THEN
  		state[0] := 1;
  	ELSIF state[0] = 2 & FE_M1.Q THEN
  		state[0] := 3;
  	ELSIF state[0] = 2 & GD_IN_1 THEN
  		state[0] := 4;
  	ELSIF state[0] = 3 & GD_IN_1 THEN
  		state[0] := 8;
  	ELSIF state[0] = 4 & FE_M1.Q THEN
  		state[0] := 8;
  	ELSIF state[0] = 5 & FE_M1.Q THEN
  		state[0] := 9;
  	ELSIF state[0] = 5 & GD_IN_1 THEN
  		state[0] := 12;
  	ELSIF state[0] = 6 & FE_M1.Q THEN
  		state[0] := 10;
  	ELSIF state[0] = 6 & GD_IN_1 THEN
  		state[0] := 13;
  	ELSIF state[0] = 7 & FE_M1.Q THEN
  		state[0] := 11;
  	ELSIF state[0] = 7 & GD_IN_1 THEN
  		state[0] := 14;
  	ELSIF state[0] = 9 & GD_IN_1 THEN
  		state[0] := 18;
  	ELSIF state[0] = 10 & GD_IN_1 THEN
  		state[0] := 19;
  	ELSIF state[0] = 11 & GD_IN_1 THEN
  		state[0] := 20;
  	ELSIF state[0] = 12 & FE_M1.Q THEN
  		state[0] := 18;
  	ELSIF state[0] = 13 & FE_M1.Q THEN
  		state[0] := 19;
  	ELSIF state[0] = 14 & FE_M1.Q THEN
  		state[0] := 20;
  	ELSIF state[0] = 15 & FE_M1.Q THEN
  		state[0] := 22;
  	ELSIF state[0] = 15 & GD_IN_1 THEN
  		state[0] := 27;
  	ELSIF state[0] = 16 & FE_M1.Q THEN
  		state[0] := 23;
  	ELSIF state[0] = 16 & GD_IN_1 THEN
  		state[0] := 28;
  	ELSIF state[0] = 17 & FE_M1.Q THEN
  		state[0] := 25;
  	ELSIF state[0] = 17 & GD_IN_1 THEN
  		state[0] := 29;
  	ELSIF state[0] = 21 & GD_IN_1 THEN
  		state[0] := 31;
  	ELSIF state[0] = 22 & GD_IN_1 THEN
  		state[0] := 32;
  	ELSIF state[0] = 23 & GD_IN_1 THEN
  		state[0] := 33;
  	ELSIF state[0] = 24 & GD_IN_1 THEN
  		state[0] := 34;
  	ELSIF state[0] = 25 & GD_IN_1 THEN
  		state[0] := 35;
  	ELSIF state[0] = 26 & GD_IN_1 THEN
  		state[0] := 36;
  	ELSIF state[0] = 27 & FE_M1.Q THEN
  		state[0] := 32;
  	ELSIF state[0] = 28 & FE_M1.Q THEN
  		state[0] := 33;
  	ELSIF state[0] = 29 & FE_M1.Q THEN
  		state[0] := 35;
  	ELSIF state[0] = 30 & FE_M1.Q THEN
  		state[0] := 38;
  	ELSIF state[0] = 30 & GD_IN_1 THEN
  		state[0] := 41;
  	ELSIF state[0] = 37 & GD_IN_1 THEN
  		state[0] := 42;
  	ELSIF state[0] = 38 & GD_IN_1 THEN
  		state[0] := 43;
  	ELSIF state[0] = 39 & GD_IN_1 THEN
  		state[0] := 44;
  	ELSIF state[0] = 40 & GD_IN_1 THEN
  		state[0] := 45;
  	ELSIF state[0] = 41 & FE_M1.Q THEN
  		state[0] := 43;
  	ELSIF state[0] = 46 & GD_IN_1 THEN
  		state[0] := 47;
  	END_IF;


	CASE state[0] OF
  		1:
  			GD_OUT_0 := 1;
		2:
  			CASE slt0[0] OF
  				0:
  					GD_OUT_1 := 1;
  				1:
  					GD_OUT_2 := 1;
  				2:
  					GD_OUT_3 := 1;
  			END_CASE;
  			slt0[0] := (random_numer + slt0[0]) MOD 3;
  			random_numer := random_numer - slt0[0];
 		3:
  			CASE slt0[1] OF
  				0:
  					GD_OUT_0 := 0;
  				1:
  					GD_OUT_1 := 1;
  				2:
  					GD_OUT_2 := 1;
  				3:
  					GD_OUT_3 := 1;
  			END_CASE;
  			slt0[1] := (random_numer + slt0[1]) MOD 4;
  			random_numer := random_numer - slt0[1];
 		4:
  			CASE slt0[2] OF
  				0:
  					GD_OUT_1 := 1;
  				1:
  					GD_OUT_2 := 1;
  				2:
  					GD_OUT_3 := 1;
  			END_CASE;
  			slt0[2] := (random_numer + slt0[2]) MOD 3;
  			random_numer := random_numer - slt0[2];
 		5:
  			CASE slt0[3] OF
  				0:
  					GD_OUT_2 := 1;
  				1:
  					GD_OUT_3 := 1;
  			END_CASE;
  			slt0[3] := (random_numer + slt0[3]) MOD 2;
  			random_numer := random_numer - slt0[3];
 		6:
  			CASE slt0[4] OF
  				0:
  					GD_OUT_1 := 1;
  				1:
  					GD_OUT_3 := 1;
  			END_CASE;
  			slt0[4] := (random_numer + slt0[4]) MOD 2;
  			random_numer := random_numer - slt0[4];
 		7:
  			CASE slt0[5] OF
  				0:
  					GD_OUT_1 := 1;
  				1:
  					GD_OUT_2 := 1;
  			END_CASE;
  			slt0[5] := (random_numer + slt0[5]) MOD 2;
  			random_numer := random_numer - slt0[5];
 		8:
  			CASE slt0[6] OF
  				0:
  					GD_OUT_0 := 0;
  				1:
  					GD_OUT_1 := 1;
  				2:
  					GD_OUT_2 := 1;
  				3:
  					GD_OUT_3 := 1;
  			END_CASE;
  			slt0[6] := (random_numer + slt0[6]) MOD 4;
  			random_numer := random_numer - slt0[6];
 		9:
  			CASE slt0[7] OF
  				0:
  					GD_OUT_0 := 0;
  				1:
  					GD_OUT_2 := 1;
  				2:
  					GD_OUT_3 := 1;
  			END_CASE;
  			slt0[7] := (random_numer + slt0[7]) MOD 3;
  			random_numer := random_numer - slt0[7];
 		10:
  			CASE slt0[8] OF
  				0:
  					GD_OUT_0 := 0;
  				1:
  					GD_OUT_1 := 1;
  				2:
  					GD_OUT_3 := 1;
  			END_CASE;
  			slt0[8] := (random_numer + slt0[8]) MOD 3;
  			random_numer := random_numer - slt0[8];
 		11:
  			CASE slt0[9] OF
  				0:
  					GD_OUT_0 := 0;
  				1:
  					GD_OUT_1 := 1;
  				2:
  					GD_OUT_2 := 1;
  			END_CASE;
  			slt0[9] := (random_numer + slt0[9]) MOD 3;
  			random_numer := random_numer - slt0[9];
 		12:
  			CASE slt0[10] OF
  				0:
  					GD_OUT_2 := 1;
  				1:
  					GD_OUT_3 := 1;
  			END_CASE;
  			slt0[10] := (random_numer + slt0[10]) MOD 2;
  			random_numer := random_numer - slt0[10];
 		13:
  			CASE slt0[11] OF
  				0:
  					GD_OUT_1 := 1;
  				1:
  					GD_OUT_3 := 1;
  			END_CASE;
  			slt0[11] := (random_numer + slt0[11]) MOD 2;
  			random_numer := random_numer - slt0[11];
 		14:
  			CASE slt0[12] OF
  				0:
  					GD_OUT_1 := 1;
  				1:
  					GD_OUT_2 := 1;
  			END_CASE;
  			slt0[12] := (random_numer + slt0[12]) MOD 2;
  			random_numer := random_numer - slt0[12];
 		15:
  			GD_OUT_3 := 1;
		16:
  			GD_OUT_2 := 1;
		17:
  			GD_OUT_1 := 1;
		18:
  			CASE slt0[13] OF
  				0:
  					GD_OUT_0 := 0;
  				1:
  					GD_OUT_2 := 1;
  				2:
  					GD_OUT_3 := 1;
  			END_CASE;
  			slt0[13] := (random_numer + slt0[13]) MOD 3;
  			random_numer := random_numer - slt0[13];
 		19:
  			CASE slt0[14] OF
  				0:
  					GD_OUT_0 := 0;
  				1:
  					GD_OUT_1 := 1;
  				2:
  					GD_OUT_3 := 1;
  			END_CASE;
  			slt0[14] := (random_numer + slt0[14]) MOD 3;
  			random_numer := random_numer - slt0[14];
 		20:
  			CASE slt0[15] OF
  				0:
  					GD_OUT_0 := 0;
  				1:
  					GD_OUT_1 := 1;
  				2:
  					GD_OUT_2 := 1;
  			END_CASE;
  			slt0[15] := (random_numer + slt0[15]) MOD 3;
  			random_numer := random_numer - slt0[15];
 		21:
  			GD_OUT_1 := 0;
  		22:
  			CASE slt0[16] OF
  				0:
  					GD_OUT_0 := 0;
  				1:
  					GD_OUT_3 := 1;
  			END_CASE;
  			slt0[16] := (random_numer + slt0[16]) MOD 2;
  			random_numer := random_numer - slt0[16];
 		23:
  			CASE slt0[17] OF
  				0:
  					GD_OUT_0 := 0;
  				1:
  					GD_OUT_2 := 1;
  			END_CASE;
  			slt0[17] := (random_numer + slt0[17]) MOD 2;
  			random_numer := random_numer - slt0[17];
 		24:
  			GD_OUT_2 := 0;
  		25:
  			CASE slt0[18] OF
  				0:
  					GD_OUT_0 := 0;
  				1:
  					GD_OUT_1 := 1;
  			END_CASE;
  			slt0[18] := (random_numer + slt0[18]) MOD 2;
  			random_numer := random_numer - slt0[18];
 		26:
  			GD_OUT_0 := 0;
  		27:
  			GD_OUT_3 := 1;
		28:
  			GD_OUT_2 := 1;
		29:
  			GD_OUT_1 := 1;
		31:
  			CASE slt0[19] OF
  				0:
  					GD_OUT_0 := 1;
  				1:
  					GD_OUT_1 := 0;
  			END_CASE;
  			slt0[19] := (random_numer + slt0[19]) MOD 2;
  			random_numer := random_numer - slt0[19];
 		32:
  			CASE slt0[20] OF
  				0:
  					GD_OUT_0 := 0;
  				1:
  					GD_OUT_3 := 1;
  			END_CASE;
  			slt0[20] := (random_numer + slt0[20]) MOD 2;
  			random_numer := random_numer - slt0[20];
 		33:
  			CASE slt0[21] OF
  				0:
  					GD_OUT_0 := 0;
  				1:
  					GD_OUT_2 := 1;
  			END_CASE;
  			slt0[21] := (random_numer + slt0[21]) MOD 2;
  			random_numer := random_numer - slt0[21];
 		34:
  			CASE slt0[22] OF
  				0:
  					GD_OUT_0 := 1;
  				1:
  					GD_OUT_2 := 0;
  			END_CASE;
  			slt0[22] := (random_numer + slt0[22]) MOD 2;
  			random_numer := random_numer - slt0[22];
 		35:
  			CASE slt0[23] OF
  				0:
  					GD_OUT_0 := 0;
  				1:
  					GD_OUT_1 := 1;
  			END_CASE;
  			slt0[23] := (random_numer + slt0[23]) MOD 2;
  			random_numer := random_numer - slt0[23];
 		36:
  			CASE slt0[24] OF
  				0:
  					GD_OUT_0 := 1;
  				1:
  					GD_OUT_0 := 0;
  			END_CASE;
  			slt0[24] := (random_numer + slt0[24]) MOD 2;
  			random_numer := random_numer - slt0[24];
 		37:
  			CASE slt0[25] OF
  				0:
  					GD_OUT_1 := 0;
  				1:
  					GD_OUT_2 := 0;
  			END_CASE;
  			slt0[25] := (random_numer + slt0[25]) MOD 2;
  			random_numer := random_numer - slt0[25];
 		38:
  			GD_OUT_0 := 0;
  		39:
  			CASE slt0[26] OF
  				0:
  					GD_OUT_1 := 0;
  				1:
  					GD_OUT_0 := 0;
  			END_CASE;
  			slt0[26] := (random_numer + slt0[26]) MOD 2;
  			random_numer := random_numer - slt0[26];
 		40:
  			CASE slt0[27] OF
  				0:
  					GD_OUT_2 := 0;
  				1:
  					GD_OUT_0 := 0;
  			END_CASE;
  			slt0[27] := (random_numer + slt0[27]) MOD 2;
  			random_numer := random_numer - slt0[27];
 		42:
  			CASE slt0[28] OF
  				0:
  					GD_OUT_0 := 1;
  				1:
  					GD_OUT_1 := 0;
  				2:
  					GD_OUT_2 := 0;
  			END_CASE;
  			slt0[28] := (random_numer + slt0[28]) MOD 3;
  			random_numer := random_numer - slt0[28];
 		43:
  			GD_OUT_0 := 0;
  		44:
  			CASE slt0[29] OF
  				0:
  					GD_OUT_0 := 1;
  				1:
  					GD_OUT_1 := 0;
  				2:
  					GD_OUT_0 := 0;
  			END_CASE;
  			slt0[29] := (random_numer + slt0[29]) MOD 3;
  			random_numer := random_numer - slt0[29];
 		45:
  			CASE slt0[30] OF
  				0:
  					GD_OUT_0 := 1;
  				1:
  					GD_OUT_2 := 0;
  				2:
  					GD_OUT_0 := 0;
  			END_CASE;
  			slt0[30] := (random_numer + slt0[30]) MOD 3;
  			random_numer := random_numer - slt0[30];
 		46:
  			CASE slt0[31] OF
  				0:
  					GD_OUT_1 := 0;
  				1:
  					GD_OUT_2 := 0;
  				2:
  					GD_OUT_0 := 0;
  			END_CASE;
  			slt0[31] := (random_numer + slt0[31]) MOD 3;
  			random_numer := random_numer - slt0[31];
 		47:
  			CASE slt0[32] OF
  				0:
  					GD_OUT_0 := 1;
  				1:
  					GD_OUT_1 := 0;
  				2:
  					GD_OUT_2 := 0;
  				3:
  					GD_OUT_0 := 0;
  			END_CASE;
  			slt0[32] := (random_numer + slt0[32]) MOD 4;
  			random_numer := random_numer - slt0[32];
 	END_CASE;
	IF state[0] = 1 & GD_OUT_0 THEN
  		state[0] := 2;
  	ELSIF state[0] = 2 & GD_OUT_1 THEN
  		state[0] := 5;
  	ELSIF state[0] = 2 & GD_OUT_2 THEN
  		state[0] := 6;
  	ELSIF state[0] = 2 & GD_OUT_3 THEN
  		state[0] := 7;
  	ELSIF state[0] = 3 & NOT GD_OUT_0 THEN
  		state[0] := 0;
  	ELSIF state[0] = 3 & GD_OUT_1 THEN
  		state[0] := 9;
  	ELSIF state[0] = 3 & GD_OUT_2 THEN
  		state[0] := 10;
  	ELSIF state[0] = 3 & GD_OUT_3 THEN
  		state[0] := 11;
  	ELSIF state[0] = 4 & GD_OUT_1 THEN
  		state[0] := 12;
  	ELSIF state[0] = 4 & GD_OUT_2 THEN
  		state[0] := 13;
  	ELSIF state[0] = 4 & GD_OUT_3 THEN
  		state[0] := 14;
  	ELSIF state[0] = 5 & GD_OUT_2 THEN
  		state[0] := 15;
  	ELSIF state[0] = 5 & GD_OUT_3 THEN
  		state[0] := 16;
  	ELSIF state[0] = 6 & GD_OUT_1 THEN
  		state[0] := 15;
  	ELSIF state[0] = 6 & GD_OUT_3 THEN
  		state[0] := 17;
  	ELSIF state[0] = 7 & GD_OUT_1 THEN
  		state[0] := 16;
  	ELSIF state[0] = 7 & GD_OUT_2 THEN
  		state[0] := 17;
  	ELSIF state[0] = 8 & NOT GD_OUT_0 THEN
  		state[0] := 1;
  	ELSIF state[0] = 8 & GD_OUT_1 THEN
  		state[0] := 18;
  	ELSIF state[0] = 8 & GD_OUT_2 THEN
  		state[0] := 19;
  	ELSIF state[0] = 8 & GD_OUT_3 THEN
  		state[0] := 20;
  	ELSIF state[0] = 9 & NOT GD_OUT_0 THEN
  		state[0] := 21;
  	ELSIF state[0] = 9 & GD_OUT_2 THEN
  		state[0] := 22;
  	ELSIF state[0] = 9 & GD_OUT_3 THEN
  		state[0] := 23;
  	ELSIF state[0] = 10 & NOT GD_OUT_0 THEN
  		state[0] := 24;
  	ELSIF state[0] = 10 & GD_OUT_1 THEN
  		state[0] := 22;
  	ELSIF state[0] = 10 & GD_OUT_3 THEN
  		state[0] := 25;
  	ELSIF state[0] = 11 & NOT GD_OUT_0 THEN
  		state[0] := 26;
  	ELSIF state[0] = 11 & GD_OUT_1 THEN
  		state[0] := 23;
  	ELSIF state[0] = 11 & GD_OUT_2 THEN
  		state[0] := 25;
  	ELSIF state[0] = 12 & GD_OUT_2 THEN
  		state[0] := 27;
  	ELSIF state[0] = 12 & GD_OUT_3 THEN
  		state[0] := 28;
  	ELSIF state[0] = 13 & GD_OUT_1 THEN
  		state[0] := 27;
  	ELSIF state[0] = 13 & GD_OUT_3 THEN
  		state[0] := 29;
  	ELSIF state[0] = 14 & GD_OUT_1 THEN
  		state[0] := 28;
  	ELSIF state[0] = 14 & GD_OUT_2 THEN
  		state[0] := 29;
  	ELSIF state[0] = 15 & GD_OUT_3 THEN
  		state[0] := 30;
  	ELSIF state[0] = 16 & GD_OUT_2 THEN
  		state[0] := 30;
  	ELSIF state[0] = 17 & GD_OUT_1 THEN
  		state[0] := 30;
  	ELSIF state[0] = 18 & NOT GD_OUT_0 THEN
  		state[0] := 31;
  	ELSIF state[0] = 18 & GD_OUT_2 THEN
  		state[0] := 32;
  	ELSIF state[0] = 18 & GD_OUT_3 THEN
  		state[0] := 33;
  	ELSIF state[0] = 19 & NOT GD_OUT_0 THEN
  		state[0] := 34;
  	ELSIF state[0] = 19 & GD_OUT_1 THEN
  		state[0] := 32;
  	ELSIF state[0] = 19 & GD_OUT_3 THEN
  		state[0] := 35;
  	ELSIF state[0] = 20 & NOT GD_OUT_0 THEN
  		state[0] := 36;
  	ELSIF state[0] = 20 & GD_OUT_1 THEN
  		state[0] := 33;
  	ELSIF state[0] = 20 & GD_OUT_2 THEN
  		state[0] := 35;
  	ELSIF state[0] = 21 & NOT GD_OUT_1 THEN
  		state[0] := 0;
  	ELSIF state[0] = 22 & NOT GD_OUT_0 THEN
  		state[0] := 37;
  	ELSIF state[0] = 22 & GD_OUT_3 THEN
  		state[0] := 38;
  	ELSIF state[0] = 23 & NOT GD_OUT_0 THEN
  		state[0] := 39;
  	ELSIF state[0] = 23 & GD_OUT_2 THEN
  		state[0] := 38;
  	ELSIF state[0] = 24 & NOT GD_OUT_2 THEN
  		state[0] := 0;
  	ELSIF state[0] = 25 & NOT GD_OUT_0 THEN
  		state[0] := 40;
  	ELSIF state[0] = 25 & GD_OUT_1 THEN
  		state[0] := 38;
  	ELSIF state[0] = 26 & NOT GD_OUT_0 THEN
  		state[0] := 0;
  	ELSIF state[0] = 27 & GD_OUT_3 THEN
  		state[0] := 41;
  	ELSIF state[0] = 28 & GD_OUT_2 THEN
  		state[0] := 41;
  	ELSIF state[0] = 29 & GD_OUT_1 THEN
  		state[0] := 41;
  	ELSIF state[0] = 31 & GD_OUT_0 THEN
  		state[0] := 5;
  	ELSIF state[0] = 31 & NOT GD_OUT_1 THEN
  		state[0] := 1;
  	ELSIF state[0] = 32 & NOT GD_OUT_0 THEN
  		state[0] := 42;
  	ELSIF state[0] = 32 & GD_OUT_3 THEN
  		state[0] := 43;
  	ELSIF state[0] = 33 & NOT GD_OUT_0 THEN
  		state[0] := 44;
  	ELSIF state[0] = 33 & GD_OUT_2 THEN
  		state[0] := 43;
  	ELSIF state[0] = 34 & GD_OUT_0 THEN
  		state[0] := 6;
  	ELSIF state[0] = 34 & NOT GD_OUT_2 THEN
  		state[0] := 1;
  	ELSIF state[0] = 35 & NOT GD_OUT_0 THEN
  		state[0] := 45;
  	ELSIF state[0] = 35 & GD_OUT_1 THEN
  		state[0] := 43;
  	ELSIF state[0] = 36 & GD_OUT_0 THEN
  		state[0] := 7;
  	ELSIF state[0] = 36 & NOT GD_OUT_0 THEN
  		state[0] := 1;
  	ELSIF state[0] = 37 & NOT GD_OUT_1 THEN
  		state[0] := 24;
  	ELSIF state[0] = 37 & NOT GD_OUT_2 THEN
  		state[0] := 21;
  	ELSIF state[0] = 38 & NOT GD_OUT_0 THEN
  		state[0] := 46;
  	ELSIF state[0] = 39 & NOT GD_OUT_1 THEN
  		state[0] := 26;
  	ELSIF state[0] = 39 & NOT GD_OUT_0 THEN
  		state[0] := 21;
  	ELSIF state[0] = 40 & NOT GD_OUT_2 THEN
  		state[0] := 26;
  	ELSIF state[0] = 40 & NOT GD_OUT_0 THEN
  		state[0] := 24;
  	ELSIF state[0] = 42 & GD_OUT_0 THEN
  		state[0] := 15;
  	ELSIF state[0] = 42 & NOT GD_OUT_1 THEN
  		state[0] := 34;
  	ELSIF state[0] = 42 & NOT GD_OUT_2 THEN
  		state[0] := 31;
  	ELSIF state[0] = 43 & NOT GD_OUT_0 THEN
  		state[0] := 47;
  	ELSIF state[0] = 44 & GD_OUT_0 THEN
  		state[0] := 16;
  	ELSIF state[0] = 44 & NOT GD_OUT_1 THEN
  		state[0] := 36;
  	ELSIF state[0] = 44 & NOT GD_OUT_0 THEN
  		state[0] := 31;
  	ELSIF state[0] = 45 & GD_OUT_0 THEN
  		state[0] := 17;
  	ELSIF state[0] = 45 & NOT GD_OUT_2 THEN
  		state[0] := 36;
  	ELSIF state[0] = 45 & NOT GD_OUT_0 THEN
  		state[0] := 34;
  	ELSIF state[0] = 46 & NOT GD_OUT_1 THEN
  		state[0] := 40;
  	ELSIF state[0] = 46 & NOT GD_OUT_2 THEN
  		state[0] := 39;
  	ELSIF state[0] = 46 & NOT GD_OUT_0 THEN
  		state[0] := 37;
  	ELSIF state[0] = 47 & GD_OUT_0 THEN
  		state[0] := 30;
  	ELSIF state[0] = 47 & NOT GD_OUT_1 THEN
  		state[0] := 45;
  	ELSIF state[0] = 47 & NOT GD_OUT_2 THEN
  		state[0] := 44;
  	ELSIF state[0] = 47 & NOT GD_OUT_0 THEN
  		state[0] := 42;
  	END_IF;

END_PROGRAM

CONFIGURATION Config0

	RESOURCE Res0 ON PLC
		TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
		PROGRAM instance0 WITH task0 : tesis0;
	END_RESOURCE
END_CONFIGURATION