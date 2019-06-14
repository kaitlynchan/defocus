clear all; close all; clc
distances=7.5:0.5:17.5;
fwhm=zeros(1,length(distances));
radius=zeros(1,length(distances));

%plots the radius of the beam with half maximum threshold

for index=1:length(distances)
    
    filename=['stagePos2_exp_03_image_',num2str(distances(index)*10),'.png'];
    A=imread(filename);
    A=rgb2gray(A);
    A=double(A);
    A_d1=sum(A,1);

    A_d2=sum(A,2);

    [~,ind_d1]=max(A_d1);
    [~,ind_d2]=max(A_d2);

    [m,hm_idx] = max(A(ind_d2,:));
    hm = m/2;
    
    Filtered=find(A>hm);
    radius(index)=length(Filtered);
    fprintf('Distance: %2.1f | Threshold: %2.1f .\n',distances(index),hm);
end

figure;
plot(distances,radius,'o');

