%plots size of image versus u distance

clear all; close all; clc
distances=0:0.5:25;
u_vec=zeros(1,length(distances));
size_vec=zeros(1,length(distances));
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
Area=length(Filtered)/(10^5);
%u_vec(index) = 25-distances(index)+52;
u_vec(index) = 25-distances(index);

size_vec(index) = Area;
disp("Distance: " + num2str(25-distances(index)));
disp("Size: " + num2str(Area));

end

figure(1);
plot(u_vec, size_vec,'o');
title('Size of image vs distance to lens');
xlabel('delta u (u0 = 52mm)');
ylabel('Image Size');
hold on
p = polyfit(u_vec, size_vec,2);
x1 = linspace(0,25);
y1 = polyval(p,x1);
plot(x1,y1);
%y2 = 0.0084*x1 - 0.2925;
%plot(x1, y2, 'Color', 'red');