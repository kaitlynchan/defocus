%plots the maximum intensity over a range of columns across the center
%horizontal axis of the beam. ideally gaussian curve. 

clear all; close all; clc
distances=0:1:25;

for index=1:length(distances)

filename=['stagePos2_exp_041_image_',num2str(distances(index)*10),'.png'];
A=imread(filename);
A=rgb2gray(A);
A=double(A);
%red_values = A(:,:,1);

[m,n]=find(A==max(max(A)));

ind_d2 = m:m;
ind_d1 = n:n;
fprintf('Col Ind: %d | Row Ind: %d .\n',ind_d1,ind_d2);

margin=80;
intensitiesX = A(ind_d2, ind_d1-margin:ind_d1+margin);
intensitiesY = A(ind_d2-margin:ind_d2+margin, ind_d1);

%intensitiesX = A(ind_d2, :);
%intensitiesY = A(:, ind_d1);

figure(1);
plot(intensitiesX,'o');
title({'horizontal cross section', "Projection to Image Sensor Distance: "+ num2str(25 - distances(index))});
xlabel('range of pixels');
ylabel('pixel intensity');
%axis([0 1350 0 300]);


figure(2);
plot(intensitiesY,'o');
title({'vertical cross section', "Projection to Image Sensor Distance: "+ num2str(25 - distances(index))});
xlabel('range of pixels');
ylabel('pixel intensity');
%axis([0 1100 0 300]);

pause(0.75);
end
