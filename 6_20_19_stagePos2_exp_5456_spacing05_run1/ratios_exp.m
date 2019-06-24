%plots magnification ratio (in pixels) with respect to the first position versus u distance

clear all; close all; clc
distances=0:0.5:25;
u_vec=zeros(1,length(distances));
m_vec=zeros(1,length(distances));
first_img=imread('stagePos2_exp_5456_image_250.png');
first_img=rgb2gray(first_img);
first_img = imbinarize(first_img);
first_img_area=length(find(first_img<1));

for index=1:length(distances)

filename=['stagePos2_exp_5456_image_',num2str(distances(index)*10),'.png'];
A=imread(filename);
A=rgb2gray(A);
A = imbinarize(A);
Filtered=find(A<1);
Area=length(Filtered);
%u_vec(index) = 25-distances(index)+52;
u_vec(index) = 25-distances(index);

m_vec(index) = Area/first_img_area;
disp("Distance: " + num2str(25-distances(index)));
disp("Magnification: " + num2str(Area/first_img_area));

end

figure(1);
plot(u_vec, m_vec,'o');
title('Magnification of image vs distance to lens (experiment data)');
xlabel('delta u (u1 = 52 mm) - [change in object to lens distance]');
ylabel('Magnification (with respect to the first image)');
hold on
p = polyfit(u_vec, m_vec,3);
x1 = linspace(0,25);
y1 = polyval(p,x1);
plot(x1,y1);