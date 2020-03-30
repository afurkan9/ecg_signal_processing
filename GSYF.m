clc;
clear;
clear all;


  load('ecgm.mat'); %ecg data
 %aralik = 1:40000 ;
% sig = ecg(aralik);
sig = (val)/360 ;

fs= 360;
ts= 1/fs
freq = 0:ts:7;


window = round(length(sig)/4);
noverlap = window/2;
 [pxx,f] = pwelch(sig,window,noverlap,freq,fs);
 
 plot(f,pxx,'r')
 title('Spektral Guç Yogunlugu');
%plot(ECG1)

figure();
noise = 50*rand(1,length(sig));
ECG2 = sig + noise;

[pxx,f] = pwelch(ECG2,window,noverlap,freq,fs);
 plot(f,pxx,'r')
 title('Gürültülü Spektral Guç Yogunlugu');
 figure();

 plot(val);
 title('ECG DATA');