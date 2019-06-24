clear all
close all
clc

h=figure;
axis tight manual
filename_gif='testanimatedOverlay.gif';

distances=7.5:0.5:17.5;
radius=zeros(1,length(distances));

for index=1:length(distances)

filename=['stagePos2_exp_0092_image_',num2str(distances(index)*10),'.png'];
A=imread(filename);

%A=rgb2gray(A);
A=double(A);
red_values = A(:,:,1);

[m,n]=find(red_values==max(max(red_values)));

ind_d2 = m:m;
ind_d1 = n:n;
fprintf('Col Ind: %d | Row Ind: %d .\n',ind_d1,ind_d2);

margin=50;
intensitiesX = red_values(ind_d2, ind_d1-margin:ind_d1+margin);
intensitiesY = red_values(ind_d2-margin:ind_d2+margin, ind_d1);

plot(intensitiesX,'o');
title({'horizontal cross section', "Distance: "+ num2str(distances(index))});
xlabel('range of pixels');
ylabel('pixel intensity');
axis([0 110 0 300]);

drawnow

    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
      
    if index==1
              imwrite(imind,cm,filename_gif,'gif', 'Loopcount',inf); 
    else
              imwrite(imind,cm,filename_gif,'gif','DelayTime',0.5,'WriteMode','append'); 
    end
end

%can change delay time for animation speed