%plots the maximum intensity over a range of columns across the center
%horizontal axis of the beam. ideally gaussian curve. 

clear all; close all; clc
distances=0:1:25;

for index=1:length(distances)

filename=['exposure30.0_run1_image',num2str(distances(index)),'.png'];
A=imread(filename);
A=rgb2gray(A);
A=double(A);

[m,n]=find(A==max(max(A)));

ind_d2 = m:m;
ind_d1 = n:n;
fprintf('Col Ind: %d | Row Ind: %d .\n',ind_d1,ind_d2);

margin=60;
intensitiesX = A(ind_d2, ind_d1-margin:ind_d1+margin);
intensitiesY = A(ind_d2-margin:ind_d2+margin, ind_d1);

%intensitiesX = A(ind_d2, :);
%intensitiesY = A(:, ind_d1);

figure(1);
plot(intensitiesX,'o');
title({'horizontal cross section', "Projection to Source Distance: "+ num2str(140 +  distances(index)) + "mm"});
xlabel('range of pixels');
ylabel('pixel intensity');
axis([0 120 0 300]);


figure(2);
plot(intensitiesY,'o');
title({'vertical cross section', "Projection to Source Distance: "+ num2str(140 + distances(index)) + "mm"});
xlabel('range of pixels');
ylabel('pixel intensity');
axis([0 120 0 300]);

pause(0.5);
end
