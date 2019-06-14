clear all; close all; clc
%intensities=zeros(1,length(distances));
distances=7.5:0.5:17.5;

%plots the maximum intensity over a range of columns across the center
%horizontal axis of the beam. ideally gaussian curve. 

for index=1:length(distances)

filename=['stagePos2_exp_0412_image_',num2str(distances(index)*10),'.png'];
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

fprintf('Col Ind: %d | Row Ind: %d .\n',ind_d1,ind_d2);


margin=50;
intensities = A(ind_d2, ind_d1-margin:ind_d1+margin);
figure(1);
plot(intensities,'o');
title(num2str(distances(index)))
axis([0 200 0 260]);
pause(0.25);

figure(2);
surf(A);
title(num2str(distances(index)))
pause(0.25);
end
