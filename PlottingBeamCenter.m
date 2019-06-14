%plots the maximum intensity over a range of columns across the center
%horizontal axis of the beam. ideally gaussian curve. 

clear all; close all; clc
distances=7.5:0.5:17.5;

for index=1:length(distances)

filename=['stagePos2_exp_03_image_',num2str(distances(index)*10),'.png'];
A=imread(filename);

A=rgb2gray(A);
A=double(A);

A_d1=sum(A,1);
A_d2=sum(A,2);

%[~,ind_d1]=max(A_d1);
%[~,ind_d2]=max(A_d2);

[m,n]=find(A==max(max(A)));

ind_d2 = m:m;
ind_d1 = n:n;
fprintf('Col Ind: %d | Row Ind: %d .\n',ind_d1,ind_d2);

margin=50;
intensitiesX = A(ind_d2, ind_d1-margin:ind_d1+margin);
intensitiesY = A(ind_d2-margin:ind_d2+margin, ind_d1);

figure(1);
plot(intensitiesX,'o');
title({'horizontal cross section', "Distance: "+ num2str(distances(index))});
xlabel('range of pixels');
ylabel('pixel intensity');
axis([0 110 0 300]);


figure(2);
surf(A);
title({'3D Plot', "Distance: "+ num2str(distances(index))});
xlabel('x pixels');
ylabel('y pixels');
zlabel('pixel intensity');
pause(0.1);

figure(3);
plot(intensitiesY,'o');
title({'vertical cross section', "Distance: "+ num2str(distances(index))});
xlabel('range of pixels');
ylabel('pixel intensity');
axis([0 110 0 300]);
end
