%c1709305 coursework
%In this equaliser, to see changes applied, move the volume slider every
%time you change something in the equalisation settings.

clear all;
close all;

global ybase;
global m_carrier;
global Fs_carrier;
global player;
global voldb;
global volmag;
global cur_sam;
global Fs;
global eq;
global Ns;
global eq_val;
global sync_player;
global hhandles;
global m_module;
global Fs_module;

vol = 5;

voldb = 0;
volmag = 1;
ybase = [0; 0; 0; 0];
eq = [1; 1; 1; 1; 1; 1; 1; 1; 1; 1];
Fs = 48000;
y = [0; 0; 0; 0];


player = audioplayer(y,Fs);
sync_player = audioplayer(y, Fs);
eq_val = [32,64,125,250,500,1000,2000,4000,8000,16000];

untitled
