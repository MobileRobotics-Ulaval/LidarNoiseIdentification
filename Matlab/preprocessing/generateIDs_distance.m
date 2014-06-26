%%
clear;
clc;
%---------------------------------
% URG

urg.indoor.folderName = 'URG_22-Jun-2012-14_41_50/';

%---------------------------------
% White Board
urg.indoor.board.d0_2.plateIDs = [0, 1, 2, 3, 4, 5];
urg.indoor.board.d0_2.laserIDs = [6, 7, 8];
urg.indoor.board.d0_2.bagID = 0;

urg.indoor.board.d1_0.plateIDs = [0, 1, 2, 3, 4, 5];
urg.indoor.board.d1_0.laserIDs = [9, 10, 11];
urg.indoor.board.d1_0.bagID = 1;

urg.indoor.board.d2_0.plateIDs = [0, 1, 2, 3, 4, 5];
urg.indoor.board.d2_0.laserIDs = [12, 13, 14];
urg.indoor.board.d2_0.bagID = 2;

urg.indoor.board.d4_0.plateIDs = [0, 1, 2, 3, 4, 5];
urg.indoor.board.d4_0.laserIDs = [15, 16, 17];
urg.indoor.board.d4_0.bagID = 3;

% no data for 8 m

%---------------------------------
% Alu

% La r�flexion du sensor sur la plaque induit des erreurs
% urg.indoor.alu.d0_2.plateIDs = [21, 22, 23, 24, 25, 26]; 
% urg.indoor.alu.d0_2.laserIDs = [39, 40, 41];
% urg.indoor.alu.d0_2.bagID = 9;

urg.indoor.alu.d1_0.plateIDs = [21, 22, 23, 24, 25, 26];
urg.indoor.alu.d1_0.laserIDs = [36, 37, 38];
urg.indoor.alu.d1_0.bagID = 8;

urg.indoor.alu.d2_0.plateIDs = [21, 22, 23, 24, 25, 26];
urg.indoor.alu.d2_0.laserIDs = [33, 34, 35];
urg.indoor.alu.d2_0.bagID = 7;

urg.indoor.alu.d4_0.plateIDs = [21, 22, 23, 24, 25, 26];
urg.indoor.alu.d4_0.laserIDs = [30, 31, 32];
urg.indoor.alu.d4_0.bagID = 6;
% no data for 8 m

%---------------------------------
% Steel
urg.indoor.steel.d0_2.plateIDs =  [42, 43, 44, 45, 46, 47];
urg.indoor.steel.d0_2.laserIDs = [48, 49, 50];
urg.indoor.steel.d0_2.bagID = 10;

urg.indoor.steel.d1_0.plateIDs =  [42, 43, 44, 45, 46, 47];
urg.indoor.steel.d1_0.laserIDs = [51, 52, 53];
urg.indoor.steel.d1_0.bagID = 11;

urg.indoor.steel.d2_0.plateIDs =  [42, 43, 44, 45, 46, 47];
urg.indoor.steel.d2_0.laserIDs = [54, 55, 56];
urg.indoor.steel.d2_0.bagID = 12;

urg.indoor.steel.d4_0.plateIDs =  [42, 43, 44, 45, 46, 47];
urg.indoor.steel.d4_0.laserIDs = [57, 58, 59];
urg.indoor.steel.d4_0.bagID = 13;
% no data for 8 m

%---------------------------------
% Iron
urg.indoor.iron.d0_2.plateIDs =  [63, 64, 65, 66, 67, 68];
urg.indoor.iron.d0_2.laserIDs = [81, 82, 83];
urg.indoor.iron.d0_2.bagID = 19;

urg.indoor.iron.d1_0.plateIDs =  [63, 64, 65, 66, 67, 68];
urg.indoor.iron.d1_0.laserIDs = [78, 79, 80];
urg.indoor.iron.d1_0.bagID = 18;

urg.indoor.iron.d2_0.plateIDs =  [63, 64, 65, 66, 67, 68];
urg.indoor.iron.d2_0.laserIDs = [75, 76, 77];
urg.indoor.iron.d2_0.bagID = 17;

% no data for 4m
% urg.indoor.iron.d4_0.plateIDs =  [63, 64, 65, 66, 67, 68];
% urg.indoor.iron.d4_0.laserIDs = [72, 73, 74];
% urg.indoor.iron.d4_0.bagID = 16;

% no data for 8 m


%%
%---------------------------------
% utm

%********************
% Indoor
utm.indoor.folderName = 'UTM_22-Jun-2012-16_06_19/';

%---------------------------------
% White Board

% Erreur impossible � expliquer pour l'instant (cercles d'erreurs)
% utm.indoor.board.d0_2.plateIDs = [153, 154, 155, 156, 157, 158];
% utm.indoor.board.d0_2.laserIDs = [159, 160, 161];
% utm.indoor.board.d0_2.bagID = 15;
% 
% utm.indoor.board.d1_0.plateIDs = [153, 154, 155, 156, 157, 158];
% utm.indoor.board.d1_0.laserIDs = [162, 163, 164];
% utm.indoor.board.d1_0.bagID = 16;

utm.indoor.board.d2_0.plateIDs = [153, 154, 155, 156, 157, 158];
utm.indoor.board.d2_0.laserIDs = [165, 166, 167];
utm.indoor.board.d2_0.bagID = 17;

utm.indoor.board.d4_0.plateIDs = [153, 154, 155, 156, 157, 158];
utm.indoor.board.d4_0.laserIDs = [168, 169, 170];
utm.indoor.board.d4_0.bagID = 18;

utm.indoor.board.d8_0.plateIDs = [153, 154, 155, 156, 157, 158];
utm.indoor.board.d8_0.laserIDs = [171, 172, 173];
utm.indoor.board.d8_0.bagID = 19;

%---------------------------------
% Alu

% La r�flexion du sensor sur la plaque induit des erreurs
% utm.indoor.alu.d0_2.plateIDs = [132, 133, 134, 135, 136, 137];
% utm.indoor.alu.d0_2.laserIDs = [150, 151, 152];
% utm.indoor.alu.d0_2.bagID = 14;

utm.indoor.alu.d1_0.plateIDs = [132, 133, 134, 135, 136, 137];
utm.indoor.alu.d1_0.laserIDs = [147, 148, 149];
utm.indoor.alu.d1_0.bagID = 13;

utm.indoor.alu.d2_0.plateIDs = [132, 133, 134, 135, 136, 137];
utm.indoor.alu.d2_0.laserIDs = [144, 145, 146];
utm.indoor.alu.d2_0.bagID = 12;

utm.indoor.alu.d4_0.plateIDs = [132, 133, 134, 135, 136, 137];
utm.indoor.alu.d4_0.laserIDs = [141, 142, 143];
utm.indoor.alu.d4_0.bagID = 11;

utm.indoor.alu.d8_0.plateIDs = [132, 133, 134, 135, 136, 137];
utm.indoor.alu.d8_0.laserIDs = [138, 139, 140];
utm.indoor.alu.d8_0.bagID = 10;

%---------------------------------
% Steel
utm.indoor.steel.d0_2.plateIDs = [111, 112, 113, 114, 115, 116];
utm.indoor.steel.d0_2.laserIDs = [117, 118, 119];
utm.indoor.steel.d0_2.bagID = 5;

utm.indoor.steel.d1_0.plateIDs = [111, 112, 113, 114, 115, 116];
utm.indoor.steel.d1_0.laserIDs = [120, 121, 122];
utm.indoor.steel.d1_0.bagID = 6;

utm.indoor.steel.d2_0.plateIDs = [111, 112, 113, 114, 115, 116];
utm.indoor.steel.d2_0.laserIDs = [123, 124, 125];
utm.indoor.steel.d2_0.bagID = 7;

utm.indoor.steel.d4_0.plateIDs = [111, 112, 113, 114, 115, 116];
utm.indoor.steel.d4_0.laserIDs = [126, 127, 128];
utm.indoor.steel.d4_0.bagID = 8;

utm.indoor.steel.d8_0.plateIDs = [111, 112, 113, 114, 115, 116];
utm.indoor.steel.d8_0.laserIDs = [129, 130, 131];
utm.indoor.steel.d8_0.bagID = 9;


%---------------------------------
% Iron
utm.indoor.iron.d0_2.plateIDs = [63, 64, 65, 66, 67, 68];
utm.indoor.iron.d0_2.laserIDs = [108, 109, 110];
utm.indoor.iron.d0_2.bagID = 4;

utm.indoor.iron.d1_0.plateIDs = [63, 64, 65, 66, 67, 68];
utm.indoor.iron.d1_0.laserIDs = [105, 106, 107];
utm.indoor.iron.d1_0.bagID = 3;

utm.indoor.iron.d2_0.plateIDs = [63, 64, 65, 66, 67, 68];
utm.indoor.iron.d2_0.laserIDs = [102, 103, 104];
utm.indoor.iron.d2_0.bagID = 2;

utm.indoor.iron.d4_0.plateIDs = [63, 64, 65, 66, 67, 68];
utm.indoor.iron.d4_0.laserIDs = [99, 100, 101];
utm.indoor.iron.d4_0.bagID = 1;

utm.indoor.iron.d8_0.plateIDs = [63, 64, 65, 66, 67, 68];
utm.indoor.iron.d8_0.laserIDs = [96, 97, 98];
utm.indoor.iron.d8_0.bagID = 0;


%********************
% Outdoor
utm.outdoor.folderName = 'UTM_21-Jun-2012-14_08_01/';

%---------------------------------
% White Board
utm.outdoor.board.d0_2.plateIDs = [0, 1, 2, 3, 4, 5];
utm.outdoor.board.d0_2.laserIDs = [6, 7, 8];
utm.outdoor.board.d0_2.bagID = 0;

utm.outdoor.board.d1_0.plateIDs = [0, 1, 2, 3, 4, 5];
utm.outdoor.board.d1_0.laserIDs = [9, 10, 11];
utm.outdoor.board.d1_0.bagID = 1;

utm.outdoor.board.d2_0.plateIDs = [0, 1, 2, 3, 4, 5];
utm.outdoor.board.d2_0.laserIDs = [12, 13, 14];
utm.outdoor.board.d2_0.bagID = 2;

utm.outdoor.board.d4_0.plateIDs = [0, 1, 2, 3, 4, 5];
utm.outdoor.board.d4_0.laserIDs = [15, 16, 17];
utm.outdoor.board.d4_0.bagID = 3;

utm.outdoor.board.d8_0.plateIDs = [0, 1, 2, 3, 4, 5];
utm.outdoor.board.d8_0.laserIDs = [18, 19, 20];
utm.outdoor.board.d8_0.bagID = 4;

%---------------------------------
% Alu

% La r�flexion du sensor sur la plaque induit des erreurs
% utm.outdoor.alu.d0_2.plateIDs = [21, 22, 23, 24, 25, 26];
% utm.outdoor.alu.d0_2.laserIDs = [39, 40, 41];
% utm.outdoor.alu.d0_2.bagID = 9;

utm.outdoor.alu.d1_0.plateIDs = [21, 22, 23, 24, 25, 26];
utm.outdoor.alu.d1_0.laserIDs = [36, 37, 38];
utm.outdoor.alu.d1_0.bagID = 8;

utm.outdoor.alu.d2_0.plateIDs = [21, 22, 23, 24, 25, 26];
utm.outdoor.alu.d2_0.laserIDs = [33, 34, 35];
utm.outdoor.alu.d2_0.bagID = 7;

utm.outdoor.alu.d4_0.plateIDs = [21, 22, 23, 24, 25, 26];
utm.outdoor.alu.d4_0.laserIDs = [30, 31, 32];
utm.outdoor.alu.d4_0.bagID = 6;

utm.outdoor.alu.d8_0.plateIDs = [21, 22, 23, 24, 25, 26];
utm.outdoor.alu.d8_0.laserIDs = [27, 28, 29];
utm.outdoor.alu.d8_0.bagID = 5;

%---------------------------------
% Steel
utm.outdoor.steel.d0_2.plateIDs = [42, 43, 44, 45, 46, 47];
utm.outdoor.steel.d0_2.laserIDs = [48, 49, 50];
utm.outdoor.steel.d0_2.bagID = 10;

utm.outdoor.steel.d1_0.plateIDs = [42, 43, 44, 45, 46, 47];
utm.outdoor.steel.d1_0.laserIDs = [51, 52, 53];
utm.outdoor.steel.d1_0.bagID = 11;

utm.outdoor.steel.d2_0.plateIDs = [42, 43, 44, 45, 46, 47];
utm.outdoor.steel.d2_0.laserIDs = [54, 55, 56];
utm.outdoor.steel.d2_0.bagID = 12;

utm.outdoor.steel.d4_0.plateIDs = [42, 43, 44, 45, 46, 47];
utm.outdoor.steel.d4_0.laserIDs = [57, 58, 59];
utm.outdoor.steel.d4_0.bagID = 13;

utm.outdoor.steel.d8_0.plateIDs = [42, 43, 44, 45, 46, 47];
utm.outdoor.steel.d8_0.laserIDs = [60, 61, 62];
utm.outdoor.steel.d8_0.bagID = 14;


%---------------------------------
% Iron
utm.outdoor.iron.d0_2.plateIDs = [63, 64, 65, 66, 67, 68];
utm.outdoor.iron.d0_2.laserIDs = [81, 82, 83];
utm.outdoor.iron.d0_2.bagID = 19;

utm.outdoor.iron.d1_0.plateIDs = [63, 64, 65, 66, 67, 68];
utm.outdoor.iron.d1_0.laserIDs = [78, 79, 80];
utm.outdoor.iron.d1_0.bagID = 18;

utm.outdoor.iron.d2_0.plateIDs = [63, 64, 65, 66, 67, 68];
utm.outdoor.iron.d2_0.laserIDs = [75, 76, 77];
utm.outdoor.iron.d2_0.bagID = 17;

utm.outdoor.iron.d4_0.plateIDs = [63, 64, 65, 66, 67, 68];
utm.outdoor.iron.d4_0.laserIDs = [72, 73, 74];
utm.outdoor.iron.d4_0.bagID = 16;

utm.outdoor.iron.d8_0.plateIDs = [63, 64, 65, 66, 67, 68];
utm.outdoor.iron.d8_0.laserIDs = [69, 70, 71];
utm.outdoor.iron.d8_0.bagID = 15;



%%
%---------------------------------
% LMS

%********************
% Outdoor
lms.outdoor.folderName = 'LMS100_21-Jun-2012-17_43_34/';

%---------------------------------
% White Board erreur étrange
lms.outdoor.board.d0_2.plateIDs = [143, 144, 145, 146, 147, 148];
lms.outdoor.board.d0_2.laserIDs = [164, 165, 166];
lms.outdoor.board.d0_2.bagID = 0;

lms.outdoor.board.d1_0.plateIDs = [143, 144, 145, 146, 147, 148];
lms.outdoor.board.d1_0.laserIDs = [167, 168, 169];
lms.outdoor.board.d1_0.bagID = 1;

lms.outdoor.board.d2_0.plateIDs = [143, 144, 145, 146, 147, 148];
lms.outdoor.board.d2_0.laserIDs = [170, 171, 172];
lms.outdoor.board.d2_0.bagID = 2;

lms.outdoor.board.d4_0.plateIDs = [143, 144, 145, 146, 147, 148];
lms.outdoor.board.d4_0.laserIDs = [173, 174, 175];
lms.outdoor.board.d4_0.bagID = 3;

lms.outdoor.board.d8_0.plateIDs = [143, 144, 145, 146, 147, 148];
lms.outdoor.board.d8_0.laserIDs = [176, 177, 178];
lms.outdoor.board.d8_0.bagID = 4;

%---------------------------------
% Alu

% % La r�flexion du sensor sur la plaque induit des erreurs
% lms.outdoor.alu.d0_2.plateIDs = [179, 180, 181, 182, 183, 184];
% lms.outdoor.alu.d0_2.laserIDs = [197, 198, 199];
% lms.outdoor.alu.d0_2.bagID = 9;
% 
% % L'angle d'incidence eleve et la plaque reflechissante perd le beam
% lms.outdoor.alu.d1_0.plateIDs = [179, 180, 181, 182, 183, 184];
% lms.outdoor.alu.d1_0.laserIDs = [194, 195, 196];
% lms.outdoor.alu.d1_0.bagID = 8;

lms.outdoor.alu.d2_0.plateIDs = [179, 180, 181, 182, 183, 184];
lms.outdoor.alu.d2_0.laserIDs = [191, 192, 193];
lms.outdoor.alu.d2_0.bagID = 7;

lms.outdoor.alu.d4_0.plateIDs = [179, 180, 181, 182, 183, 184];
lms.outdoor.alu.d4_0.laserIDs = [188, 189, 190];
lms.outdoor.alu.d4_0.bagID = 6;

lms.outdoor.alu.d8_0.plateIDs = [179, 180, 181, 182, 183, 184];
lms.outdoor.alu.d8_0.laserIDs = [185, 186, 187];
lms.outdoor.alu.d8_0.bagID = 5;

%---------------------------------
% Steel
lms.outdoor.steel.d0_2.plateIDs = [200, 201, 202, 203, 204, 205];
lms.outdoor.steel.d0_2.laserIDs = [206, 207, 208];
lms.outdoor.steel.d0_2.bagID = 10;

lms.outdoor.steel.d1_0.plateIDs = [200, 201, 202, 203, 204, 205];
lms.outdoor.steel.d1_0.laserIDs = [209, 210, 211];
lms.outdoor.steel.d1_0.bagID = 11;

lms.outdoor.steel.d2_0.plateIDs = [200, 201, 202, 203, 204, 205];
lms.outdoor.steel.d2_0.laserIDs = [212, 213, 214];
lms.outdoor.steel.d2_0.bagID = 12;

lms.outdoor.steel.d4_0.plateIDs = [200, 201, 202, 203, 204, 205];
lms.outdoor.steel.d4_0.laserIDs = [215, 216, 217];
lms.outdoor.steel.d4_0.bagID = 13;

lms.outdoor.steel.d8_0.plateIDs = [200, 201, 202, 203, 204, 205];
lms.outdoor.steel.d8_0.laserIDs = [218, 219, 220];
lms.outdoor.steel.d8_0.bagID = 14;


%---------------------------------
% Iron
lms.outdoor.iron.d0_2.plateIDs = [221, 222, 223, 224, 225, 226];
lms.outdoor.iron.d0_2.laserIDs = [239, 240, 241];
lms.outdoor.iron.d0_2.bagID = 19;

lms.outdoor.iron.d1_0.plateIDs = [221, 222, 223, 224, 225, 226];
lms.outdoor.iron.d1_0.laserIDs = [236, 237, 238];
lms.outdoor.iron.d1_0.bagID = 18;

lms.outdoor.iron.d2_0.plateIDs = [221, 222, 223, 224, 225, 226];
lms.outdoor.iron.d2_0.laserIDs = [233, 234, 235];
lms.outdoor.iron.d2_0.bagID = 17;

lms.outdoor.iron.d4_0.plateIDs = [221, 222, 223, 224, 225, 226];
lms.outdoor.iron.d4_0.laserIDs = [230, 231, 232];
lms.outdoor.iron.d4_0.bagID = 16;

lms.outdoor.iron.d8_0.plateIDs = [221, 222, 223, 224, 225, 226];
lms.outdoor.iron.d8_0.laserIDs = [227, 228, 229];
lms.outdoor.iron.d8_0.bagID = 15;

%%
data.lms = lms;
data.utm = utm;
data.urg = urg;

clear lms utm urg