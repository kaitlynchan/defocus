%plots the maximum intensity over a range of columns across the center
%horizontal axis of the beam. ideally gaussian curve. 

clear all; close all; clc
distances=7.5:0.5:17.5;
intensities=zeros(1,length(distances));
pos=zeros(1,length(distances));
thresholds=zeros(1,length(distances));


for index=1:length(distances)

filename=['stagePos2_exp_0092_image_',num2str(distances(index)*10),'.png'];
A=imread(filename);

%A=double(A);
red_values = A(:,:,1);
%binary_red = imbinarize(red_values);
%imshow(binary_red);

hm = max(max(red_values))/2;
thresholds(index)=hm;

Filtered=find(red_values>hm);
intensities(index)=sum(Filtered);

%[m,n]=find(red_values==max(max(red_values)));

%intensities(index) = sum(sum(binary_red));
%intensities(index) = max(max(red_values));
pos(index)=25-distances(index);
fprintf('Distance: %2.1f | Intensity: %d .\n',pos(index),intensities(index));
fprintf('Distance: %2.1f | Threshold: %2.1f .\n',pos(index),thresholds(index));

pause(0.15);
end

figure;
plot(pos, intensities,'o');
title('Total intensity value of beam');
xlabel('stage position (increasing mm distance from source)');
ylabel('pixel intensity');
hold on;
%plot(pos, thresholds,'s');

%axis([0 110 0 300]);
