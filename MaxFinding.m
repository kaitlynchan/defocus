close all
clear all
clc

filename=['stagePos2_exp_0412_image_125.png'];
A=imread(filename);

% A=A(:,:,1);
% figure(1)%show image1
% colormap(gray(255));
% image(A)
% axis off

A=rgb2gray(A);
figure(1)
imshow(A)

figure(2), surf(A), shading flat

[m,n]=find(A==max(max(A)));
figure(3)
plot(A(:,n:n));
figure(4)
plot(A(m:m,:));