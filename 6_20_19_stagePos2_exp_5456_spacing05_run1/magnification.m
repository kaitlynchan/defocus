%plots size of circle (in pixels) versus u distance

clear all; close all; clc
distances=0:0.5:25;
u_vec=zeros(1,length(distances));
area_vec=zeros(1,length(distances));

for index=1:length(distances)

filename=['stagePos2_exp_5456_image_',num2str(distances(index)*10),'.png'];
A=imread(filename);
A=rgb2gray(A);
A = imbinarize(A);
Filtered=find(A<1);
Area=length(Filtered);
u_vec(index) = 25-distances(index)+52;
area_vec(index) = Area;
disp("Distance: " + num2str(25-distances(index)));
disp("Area: " + num2str(Area));

end

figure(1);
plot(u_vec, area_vec,'o');
title('Size of image vs distance to lens');
xlabel('object to lens distance (mm)');
ylabel('image area (pixels)');
