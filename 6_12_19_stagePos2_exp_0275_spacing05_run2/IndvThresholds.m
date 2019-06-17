clear all; close all; clc
distances=7.5:0.5:17.5;
fwhm=zeros(1,length(distances));
radius=zeros(1,length(distances));

%plots the radius of the beam with half maximum threshold

for index=1:length(distances)
    
    filename=['stagePos2_exp_0275_image_',num2str(distances(index)*10),'.png'];
    A=imread(filename);
    A=rgb2gray(A);
    A=double(A);

    hm = max(max(A))/2;
    
    Filtered=find(A>hm);
    radius(index)=sqrt((length(Filtered))/pi);
    fprintf('Distance: %2.1f | Threshold: %2.1f .\n',distances(index),hm);
end

figure;
plot(distances,radius,'o');
title('Max/2 Thresholds, saturated');
xlabel('Distances (mm)');
ylabel('Radius');

