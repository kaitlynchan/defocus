clear all
close all
clc

%focus ~14mm

distances=7.5:0.5:17.5;
radius=zeros(1,length(distances));
threshold=20;
for index=1:length(distances)

filename=['stagePos2_exp_03_image_',num2str(distances(index)*10),'.png'];
A=imread(filename);
A=rgb2gray(A);
Filtered=find(A>threshold);
radius(index)=length(Filtered);
%figure(1)
%imshow(A)
end

figure(1)
plot(distances,radius,'o')
