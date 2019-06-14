clear all
close all
clc

distances=1:1:24;
radius=zeros(1,length(distances));
cd('6_9_19_stagePos2_exp_03_run1')
for index=1:length(distances)

filename=['stagePos2_exp03_image_',num2str(distances(index)*10),'.png'];
A=imread(filename);
A=rgb2gray(A);
figure(1)
imshow(A)
[centers,radii] = imfindcircles(A,[10 80],'ObjectPolarity','bright','Sensitivity',0.95);
radius(index)=max(radii);
h = viscircles(centers,radii);
end
%%
figure(1)
plot(distances,radius,'o')
