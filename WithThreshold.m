clear all
close all
clc

distances=1:1:24;
radius=zeros(1,length(distances));
threshold=15;
for index=1:length(distances)

filename=['stagePos2_exp03_image_',num2str(distances(index)*10),'.png'];
A=imread(filename);
A=rgb2gray(A);
Filtered=find(A>threshold);
radius(index)=length(Filtered);
%figure(1)
%imshow(A)
end

figure(1)
plot(distances,radius,'o')
