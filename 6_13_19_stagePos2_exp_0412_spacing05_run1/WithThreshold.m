clear all
close all
clc

%focus ~14mm

distances=7.5:0.5:17.5;
radius=zeros(1,length(distances));
threshold=34.8;
for index=1:length(distances)

filename=['stagePos2_exp_0412_image_',num2str(distances(index)*10),'.png'];
A=imread(filename);
A=rgb2gray(A);
Filtered=find(A>threshold);
    radius(index)=sqrt((length(Filtered))/pi);
%figure(1)
%imshow(A)
end

figure(1)
plot(distances,radius,'o')
title('Defocusing Effect, Unsaturated Images');
xlabel('Distances (mm)');
ylabel('Radius');
