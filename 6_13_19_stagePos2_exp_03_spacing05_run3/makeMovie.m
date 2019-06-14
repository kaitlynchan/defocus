clear all
close all
clc

h=figure;
axis tight manual
filename_gif='testanimated.gif';

distances=7.5:0.5:17.5;
radius=zeros(1,length(distances));

for index=1:length(distances)

filename=['stagePos2_exp_03_image_',num2str(distances(index)*10),'.png'];
A=imread(filename);
A=rgb2gray(A);
A=double(A);
A_d1=sum(A,1);
A_d2=sum(A,2);

[~,ind_d1]=max(A_d1);
[~,ind_d2]=max(A_d2);

margin=25;
intensities = A(ind_d2, ind_d1-margin:ind_d1+margin);
range = (1:51);
plot(range, intensities,'o');
axis([0 60 0 260]);
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