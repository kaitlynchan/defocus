clear all; close all; clc
distances=7.5:0.5:17.5;

for index=1:length(distances)

filename=['stagePos2_exp_0412_image_',num2str(distances(index)*10),'.png'];


A=imread(filename);
figure(1);

subplot(1,3,1);
imshow(A);
title(['RGB: ',num2str(distances(index))])


A_gray=rgb2gray(A);
subplot(1,3,2);
imshow(A_gray);
title(['Grey: ',num2str(distances(index))])


A_double=double(A_gray);
subplot(1,3,3);
imshow(A_double);
title(['Double(): ',num2str(distances(index))])

pause(0.5)

end