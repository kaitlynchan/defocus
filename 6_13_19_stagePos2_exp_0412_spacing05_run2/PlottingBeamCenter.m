%plots the maximum intensity over a range of columns across the center
%horizontal axis of the beam. ideally gaussian curve. 

clear all; close all; clc
distances=7.5:0.5:17.5;

for index=1:length(distances)

filename=['stagePos2_exp_0412_image_',num2str(distances(index)*10),'.png'];
A=imread(filename);
A=rgb2gray(A);
A=double(A);

[m,n]=find(A==max(max(A)));

ind_d2 = m:m;
ind_d1 = n:n;
fprintf('Col Ind: %d | Row Ind: %d .\n',ind_d1,ind_d2);

margin=50;
%intensitiesX = A(ind_d2, ind_d1-margin:ind_d1+margin);
intensitiesY = A(ind_d2-margin:ind_d2+margin, ind_d1);



figure();
plot(intensitiesY,'o');
title({'vertical cross section', "Distance: "+ num2str(distances(index))});
xlabel('range of pixels');
ylabel('pixel intensity');
axis([0 110 0 300]);

pause(0.5);
end
