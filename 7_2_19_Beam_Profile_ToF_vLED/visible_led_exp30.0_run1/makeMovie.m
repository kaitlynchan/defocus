clear all
close all
clc

h=figure;
axis tight manual
filename_gif='testanimatedX.gif';

distances=0:1:25;
radius=zeros(1,length(distances));

for index=1:length(distances)

filename=['exposure30.0_run1_image',num2str(distances(index)),'.png'];
A=imread(filename);
A=rgb2gray(A);
A=double(A);

[m,n]=find(A==max(max(A)));

ind_d2 = m:m;
ind_d1 = n:n;

margin=60;
intensitiesX = A(ind_d2, ind_d1-margin:ind_d1+margin);
intensitiesY = A(ind_d2-margin:ind_d2+margin, ind_d1);
x_axis = linspace(0,6.8966,121);

plot(x_axis, intensitiesX,'o');
title({'horizontal cross section', "Projection to Source Distance: "+ num2str(140 +  distances(index)) + "mm"});
xlabel('mm range');
ylabel('pixel intensity');
%axis([0 110 0 300]);
ylim([0 300])

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