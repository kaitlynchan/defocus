clear all
close all
clc

h=figure;
axis tight manual
filename_gif='testanimated.gif';

distances=7.7:.2:17.5;
radius=zeros(1,length(distances));
threshold=15;
center_r=450;
center_c=770;

delta=100;
for index=1:length(distances)

filename=['stagePos2_exp03_image_',num2str(distances(index)*10),'.png'];
A=imread(filename);
A=A(center_r-delta:center_r+delta,center_c-delta:center_c+delta,:);

imshow(A,'border','tight','InitialMagnification',100);
drawnow
frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
if index==1
          imwrite(imind,cm,filename_gif,'gif', 'Loopcount',inf); 
else
          imwrite(imind,cm,filename_gif,'gif','DelayTime',0.05,'WriteMode','append'); 
end
end

