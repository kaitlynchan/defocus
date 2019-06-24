clear all; close all; clc
distances=7.5:0.5:17.5;
fwhm=zeros(1,length(distances));
radius=zeros(1,length(distances));

%plots the radius of the beam with half maximum threshold

for index=1:length(distances)
    
    filename=['stagePos2_exp_0092_image_',num2str(distances(index)*10),'.png'];
    A=imread(filename);
    A=double(A);
    A = A(:,:,1);

    hm = max(max(A))/2;
    
    Filtered=find(A>hm);
    radius(index)=sqrt((length(Filtered))/pi);
    fprintf('Distance: %2.1f | Threshold: %2.1f .\n',distances(index),hm);
end

figure;

plot(distances(1,3:10),radius(1,3:10),'o');
xlabel('Distances (mm)');
ylabel('Radius');
l1 = lsline
%forward slash (J\F) means solving J dx = F for dx (matrix v eq).
%solving long line of y = mx + b
B1 = [ones(size(l1.XData(:))), l1.XData(:)]\l1.YData(:);
Slope1 = B1(2)
Intercept1 = B1(1)
title({'Indv. Thresholds', "Slope: "+num2str(Slope1)});
axis([7 13 7 10]);


figure;
plot(distances(1,10:21),radius(1,10:21),'o');
xlabel('Distances (mm)');
ylabel('Radius');
l2 = lsline
B2 = [ones(size(l2.XData(:))), l2.XData(:)]\l2.YData(:);
Slope2 = B2(2)
Intercept2 = B2(1)
title({'Semi Indv. Thresholds', "Slope: "+num2str(Slope2)});
axis([12 18 7 10]);



