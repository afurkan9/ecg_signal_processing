clc;
clear;
clear all;

t = -2*pi:0.01:2*pi;

x1 = 10*sin(2*pi*t);

x2 = 20*sin(2*pi*2*t);

x3 = 30*sin(2*pi*3*t);
toplam_isaret = x1+ x2 +x3;
gurultu = 10*rand(1,length(x1));
s = toplam_isaret + gurultu;

plot(t,s,'linewidth' ,2)

figure();
%--------------
%g�� spektral yo�unluk fonksiyonu (pwelch) kullanarak hesaplad�k
window = round(length(s)/4);
noverlap = window/2;
freq = 0:0.01:5;
fs = 100; % Hz �rnekleme aral��� ald�k
[pxx,f] = pwelch(s,window,noverlap,freq,fs);
title('g�� spektral yo�unlu�u');
plot(f,pxx)

%kalbe elektriksel uyar� ; P Dalgas�
% ard�ndan kalbin at�m� ile  Q R S T komplesi g�zlemlenir.
%kalbin ortas�na elektrotlar yerle�tirildikten sonra 1-8kHz kadar kay�t
%al�nabilmektedir

%------------------
%% R tepesi yakalama (Rpeak)

clear all
load('ECG_ECGraw.mat')

index = 1:10000;
ECG = ecg(index)

[pks,locs] = findpeaks(ecg(index),...
    'minpeakdistance',100,'MINPEAKHEIGHT',4000);

Rpeaks = zeros(1,length(ecg(index)));
Rpeaks(locs) = ecg(locs);
figure
plot(ECG);
hold on
stem(Rpeaks,'r')
%Heart beat rate in(beats/second) can be calculated by the  formula:
% rate = 60*sampling rate /(R-R interval) 

RR = diff(locs);    %n.konumdan n-1. konumu ��kar
figure
plot(RR,'ro')

HR = (60000./RR)

figure,
plot(HR,'o')

meanHR = mean(HR)


