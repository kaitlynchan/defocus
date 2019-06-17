clear all; close all; clc
distances=7.5:0.5:17.5;
fwhm=zeros(1,length(distances));

%plots the fwhm of the beam at different distances 

for index=1:length(distances)
    
    filename=['stagePos2_exp_0275_image_',num2str(distances(index)*10),'.png'];
    A=imread(filename);
    A=rgb2gray(A);
    A=double(A);
    A_d1=sum(A,1);

    A_d2=sum(A,2);

    %[~,ind_d1]=max(A_d1);
    %[~,ind_d2]=max(A_d2);

    [m,n]=find(A==max(max(A)));
    ind_d2 = m:m;
    ind_d1 = n:n;
    
    hm = max(max(A))/2;
    fprintf('Distance: %2.1f | Threshold: %2.1f .\n',distances(index),hm);

    margin=50;
    intensitiesX = A(ind_d2, :);
    intensitiesY = A(:, ind_d1);
    
    width = find(intensitiesX >= hm);
    
    fwhm(index) = length(width);
end

figure;
plot(distances, fwhm, 'o-');
title('full-width half-maximum: horizontal axis');
xlabel("distance (mm)");
ylabel('fwhm (pixels)');

