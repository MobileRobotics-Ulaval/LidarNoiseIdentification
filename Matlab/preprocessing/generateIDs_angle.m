clear;
clc;
%---------------------------------
% LMS

lms.indoor.folderName = 'LMS151_11-Dec-2013-11_59_55/';

%---------------------------------
% Board

lms.indoor.board.a0.laserIDs = [79, 80, 81];
lms.indoor.board.a0.plateIDs = [3, 4, 5, 6, 7, 8];
lms.indoor.board.a0.bagID = 0;
lms.indoor.board.a15.laserIDs = [79, 80, 81];
lms.indoor.board.a15.plateIDs = [9, 10, 11, 12, 13, 14];
lms.indoor.board.a15.bagID = 1;
lms.indoor.board.a30.laserIDs = [79, 80, 81];
lms.indoor.board.a30.plateIDs = [15, 16, 17, 18, 19, 20];
lms.indoor.board.a30.bagID = 2;
lms.indoor.board.a45.laserIDs = [79, 80, 81];
lms.indoor.board.a45.plateIDs = [21, 22, 23, 24, 25, 26];
lms.indoor.board.a45.bagID = 3;
lms.indoor.board.a60.laserIDs = [79, 80, 81];
lms.indoor.board.a60.plateIDs = [27, 28, 29, 30, 31, 32];
lms.indoor.board.a60.bagID = 4;
lms.indoor.board.a75.laserIDs = [79, 80, 81];
lms.indoor.board.a75.plateIDs = [33, 34, 35, 36, 37, 38];
lms.indoor.board.a75.bagID = 5;

%---------------------------------
% Alu

lms.indoor.alu.a0.laserIDs = [79, 80, 81];
lms.indoor.alu.a0.plateIDs = [69, 70, 71, 72, 73, 74];
lms.indoor.alu.a0.bagID = 11;
lms.indoor.alu.a15.laserIDs = [79, 80, 81];
lms.indoor.alu.a15.plateIDs = [63, 64, 65, 66, 67, 68];
lms.indoor.alu.a15.bagID = 10;
lms.indoor.alu.a30.laserIDs = [79, 80, 81];
lms.indoor.alu.a30.plateIDs = [57, 58, 59, 60, 61, 62];
lms.indoor.alu.a30.bagID = 9;
lms.indoor.alu.a45.laserIDs = [79, 80, 81];
lms.indoor.alu.a45.plateIDs = [51, 52, 53, 54, 55, 56];
lms.indoor.alu.a45.bagID = 8;
lms.indoor.alu.a60.laserIDs = [79, 80, 81];
lms.indoor.alu.a60.plateIDs = [45, 46 ,47 ,48, 49, 50];
lms.indoor.alu.a60.bagID = 7;
lms.indoor.alu.a75.laserIDs = [79, 80, 81];
lms.indoor.alu.a75.plateIDs = [39, 40, 41, 42, 43, 44];
lms.indoor.alu.a75.bagID = 6;

%---------------------------------
% Steel

lms.indoor.steel.a0.laserIDs = [79, 80, 81];
lms.indoor.steel.a0.plateIDs = [82, 83, 84, 85, 86, 87];
lms.indoor.steel.a0.bagID = 12;
lms.indoor.steel.a15.laserIDs = [79, 80, 81];
lms.indoor.steel.a15.plateIDs = [88, 89, 90 91, 92, 93];
lms.indoor.steel.a15.bagID = 13;
lms.indoor.steel.a30.laserIDs = [79, 80, 81];
lms.indoor.steel.a30.plateIDs = [94, 95, 96, 97, 98, 99];
lms.indoor.steel.a30.bagID = 14;
lms.indoor.steel.a45.laserIDs = [79, 80, 81];
lms.indoor.steel.a45.plateIDs = [100, 101, 102, 103, 104, 105];
lms.indoor.steel.a45.bagID = 15;
lms.indoor.steel.a60.laserIDs = [79, 80, 81];
lms.indoor.steel.a60.plateIDs = [106, 107, 108, 109, 110, 111];
lms.indoor.steel.a60.bagID = 16;
lms.indoor.steel.a75.laserIDs = [79, 80, 81];
lms.indoor.steel.a75.plateIDs = [112, 113, 114, 115, 116, 117];
lms.indoor.steel.a75.bagID = 17;

%---------------------------------
% iron

lms.indoor.iron.a75.laserIDs = [79, 80, 81];
lms.indoor.iron.a75.plateIDs = [118, 119, 120, 121, 122, 123];
lms.indoor.iron.a75.bagID = 18;
lms.indoor.iron.a60.laserIDs = [79, 80, 81];
lms.indoor.iron.a60.plateIDs = [124, 125, 126, 127, 128, 129];
lms.indoor.iron.a60.bagID = 19;
lms.indoor.iron.a45.laserIDs = [79, 80, 81];
lms.indoor.iron.a45.plateIDs = [130, 131, 132, 133, 134, 135];
lms.indoor.iron.a45.bagID = 20;
lms.indoor.iron.a30.laserIDs = [79, 80, 81];
lms.indoor.iron.a30.plateIDs = [136, 137, 138, 139, 140, 141];
lms.indoor.iron.a30.bagID = 21;
lms.indoor.iron.a15.laserIDs = [79, 80, 81];
lms.indoor.iron.a15.plateIDs = [142, 143, 144, 145, 146, 147];
lms.indoor.iron.a15.bagID = 22;
lms.indoor.iron.a0.laserIDs = [79, 80, 81];
lms.indoor.iron.a0.plateIDs = [148, 149, 150, 151, 152, 153];
lms.indoor.iron.a0.bagID = 23;

%---------------------------------
% UTM

utm.indoor.folderName = 'UTM_11-Dec-2013-15_33_41/';

%---------------------------------
% Board

utm.indoor.board.a0.laserIDs = [154, 155, 156];
utm.indoor.board.a0.plateIDs = [295, 296, 297, 298, 299, 300];
utm.indoor.board.a0.bagID = 23;
utm.indoor.board.a15.laserIDs = [154, 155, 156];
utm.indoor.board.a15.plateIDs = [289, 290, 291, 292, 293, 294];
utm.indoor.board.a15.bagID = 22;
utm.indoor.board.a30.laserIDs = [154, 155, 156];
utm.indoor.board.a30.plateIDs = [283, 284, 285, 286, 287, 288];
utm.indoor.board.a30.bagID = 21;
utm.indoor.board.a45.laserIDs = [154, 155, 156];
utm.indoor.board.a45.plateIDs = [277, 278, 279, 280, 281, 282];
utm.indoor.board.a45.bagID = 20;
utm.indoor.board.a60.laserIDs = [154, 155, 156];
utm.indoor.board.a60.plateIDs = [271, 272, 273, 274, 275, 276];
utm.indoor.board.a60.bagID = 19;
utm.indoor.board.a75.laserIDs = [154, 155, 156];
utm.indoor.board.a75.plateIDs = [265, 266, 267, 268, 269, 270];
utm.indoor.board.a75.bagID = 18;

%---------------------------------
% Alu

utm.indoor.alu.a0.laserIDs = [154, 155, 156];
utm.indoor.alu.a0.plateIDs = [229, 230, 231, 232, 233, 234];
utm.indoor.alu.a0.bagID = 12;
utm.indoor.alu.a15.laserIDs = [154, 155, 156];
utm.indoor.alu.a15.plateIDs = [235, 236, 237, 238, 239, 240];
utm.indoor.alu.a15.bagID = 13;
utm.indoor.alu.a30.laserIDs = [154, 155, 156];
utm.indoor.alu.a30.plateIDs = [241, 242, 243, 244, 245, 246];
utm.indoor.alu.a30.bagID = 14;
utm.indoor.alu.a45.laserIDs = [154, 155, 156];
utm.indoor.alu.a45.plateIDs = [247, 248, 249, 250, 251, 252];
utm.indoor.alu.a45.bagID = 15;
utm.indoor.alu.a60.laserIDs = [154, 155, 156];
utm.indoor.alu.a60.plateIDs = [253, 254, 255, 256, 257, 258];
utm.indoor.alu.a60.bagID = 16;
utm.indoor.alu.a75.laserIDs = [154, 155, 156];
utm.indoor.alu.a75.plateIDs = [259, 260, 261, 262, 263, 264];
utm.indoor.alu.a75.bagID = 17;

%---------------------------------
% Steel

utm.indoor.steel.a0.laserIDs = [154, 155, 156];
utm.indoor.steel.a0.plateIDs = [223, 224, 225, 226, 227, 228];
utm.indoor.steel.a0.bagID = 11;
utm.indoor.steel.a15.laserIDs = [154, 155, 156];
utm.indoor.steel.a15.plateIDs = [217, 218, 219, 220, 221, 222];
utm.indoor.steel.a15.bagID = 10;
utm.indoor.steel.a30.laserIDs = [154, 155, 156];
utm.indoor.steel.a30.plateIDs = [211, 212, 213, 214, 215, 216];
utm.indoor.steel.a30.bagID = 9;
utm.indoor.steel.a45.laserIDs = [154, 155, 156];
utm.indoor.steel.a45.plateIDs = [205, 206, 207, 208, 209, 210];
utm.indoor.steel.a45.bagID = 8;
utm.indoor.steel.a60.laserIDs = [154, 155, 156];
utm.indoor.steel.a60.plateIDs = [199, 200, 201, 202, 203, 204];
utm.indoor.steel.a60.bagID = 7;
utm.indoor.steel.a75.laserIDs = [154, 155, 156];
utm.indoor.steel.a75.plateIDs = [193, 194, 195, 196, 197, 198];
utm.indoor.steel.a75.bagID = 6;

%---------------------------------
% Iron

utm.indoor.iron.a0.laserIDs = [154, 155, 156];
utm.indoor.iron.a0.plateIDs = [157, 158, 159, 160, 161, 162];
utm.indoor.iron.a0.bagID = 0;
utm.indoor.iron.a15.laserIDs = [154, 155, 156];
utm.indoor.iron.a15.plateIDs = [163, 164, 165, 166, 167, 168];
utm.indoor.iron.a15.bagID = 1;
utm.indoor.iron.a30.laserIDs = [154, 155, 156];
utm.indoor.iron.a30.plateIDs = [169, 170, 171, 172, 173, 174];
utm.indoor.iron.a30.bagID = 2;
utm.indoor.iron.a45.laserIDs = [154, 155, 156];
utm.indoor.iron.a45.plateIDs = [175, 176, 177, 178, 179, 180];
utm.indoor.iron.a45.bagID = 3;
utm.indoor.iron.a60.laserIDs = [154, 155, 156];
utm.indoor.iron.a60.plateIDs = [181, 182, 183, 184, 185, 186];
utm.indoor.iron.a60.bagID = 4;
utm.indoor.iron.a75.laserIDs = [154, 155, 156];
utm.indoor.iron.a75.plateIDs = [187, 188, 189, 190, 191, 192];
utm.indoor.iron.a75.bagID = 5;

%%
data.lms = lms;
data.utm = utm;

clear lms utm urg
