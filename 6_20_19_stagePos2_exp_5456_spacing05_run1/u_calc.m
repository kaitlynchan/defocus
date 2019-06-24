%plots magnification ratio (in pixels) with respect to the center position versus u distance

clear all; close all; clc
distances=0:0.5:25;
u_vec=zeros(1,length(distances));
u_star=zeros(1,length(distances));

m_vec=zeros(1,length(distances));
center_img=imread('stagePos2_exp_5456_image_125.png');
center_img=rgb2gray(center_img);
center_img = imbinarize(center_img);
center_img_area=length(find(center_img<1));
v=50;

for index=1:length(distances)

filename=['stagePos2_exp_5456_image_',num2str(distances(index)*10),'.png'];
A=imread(filename);
A=rgb2gray(A);
A = imbinarize(A);
Filtered=find(A<1);
Area=length(Filtered);
u_vec(index) = 25-distances(index)+52;
m_vec(index) = Area/center_img_area;
disp("Distance: " + num2str(25-distances(index)));
disp("Magnification: " + num2str(Area/center_img_area));

end

for index=1:length(distances)
    u_star(index) = v / m_vec(index);
end

figure(1);
plot(u_vec,u_vec,'o','Color', 'blue');
hold on;
plot(u_vec,u_star,'s','Color', 'red');
title('measured u versus calculated u*');
xlabel('object to lens distance (mm)');
ylabel('u(blue) and u*(red)');
axis([30 80 30 80]);
