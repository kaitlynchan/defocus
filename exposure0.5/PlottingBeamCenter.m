clear all; close all; clc
distances=7.5:1:17.5;

for index=1:length(distances)

filename=['run3_image',num2str(distances(index)),'.png'];
A=imread(filename);
A=rgb2gray(A);
A=double(A);
A_d1=sum(A,1);

A_d2=sum(A,2);


[~,ind_d1]=max(A_d1);
[~,ind_d2]=max(A_d2);

margin=25;
figure(1)
plot(A(ind_d2,ind_d1-margin:ind_d1+margin))
pause(0.75)
end