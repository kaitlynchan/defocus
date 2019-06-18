clear all; close all; clc
distances=7.5:0.5:17.5;
fwhm=zeros(1,length(distances));

%plots the fwhm of the beam at different distances 

for index=1:length(distances)
    
    filename=['stagePos2_exp_0092_image_',num2str(distances(index)*10),'.png'];
    A=imread(filename);
    A=double(A);
    A = A(:,:,1);

    [m,n]=find(A==max(max(A)));
    ind_d2 = m:m;
    ind_d1 = n:n;
    
    hm = max(max(A))/2;

    margin=50;
    intensitiesX = A(ind_d2, :);
    intensitiesY = A(:, ind_d1);
    
    width = find(intensitiesX >= hm);
    
    fwhm(index) = length(width);
end

figure;
plot(distances, fwhm, 'o');
title('full-width half-maximum: horizontal axis');
xlabel("distance (mm)");
ylabel('fwhm (pixels)');

