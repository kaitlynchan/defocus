clear all; close all; clc
%intensities=zeros(1,length(distances));
distances=7.5:0.5:17.5;

%plots the maximum intensity over a range of columns across the center
%vertical axis of the beam. ideally gaussian curve. 

for index=1:length(distances)

filename=['stagePos2_exp_03_image_',num2str(distances(index)*10),'.png'];
A=imread(filename);

A=rgb2gray(A);
A=double(A);

A_d1=sum(A,1);
A_d2=sum(A,2);

[~,ind_d1]=max(A_d1);
[~,ind_d2]=max(A_d2);
fprintf('Col Ind: %d | Row Ind: %d .\n',ind_d1,ind_d2);

margin=50;
intensities = A(ind_d2-margin:ind_d2+margin, ind_d1);
figure(1);
plot(intensities,'o');
axis([0 200 0 260]);
pause(0.25)
end