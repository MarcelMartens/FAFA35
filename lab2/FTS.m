% FTS.m

clear all
close all

[FileName,PathName] = uigetfile('*');        
path = fullfile(PathName,FileName);

A = importdata(FileName);

plot(A(:,1),A(:,2),'linewidth',2,'color','r')


