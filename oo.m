clc;
clear;
clear all;
load('100m.mat');
 ekgsig = (val-1024)/200 ;
 fs = 360;
 ts= 1/fs
 t =((1:length(ekgsig))/fs);
plot(t,ekgsig)

