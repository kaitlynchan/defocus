clear all
close all
clc

h=figure;
axis tight manual
filename_gif='testanimated.gif';
distances=0:0.5:25;

for index=1:length(distances)

filename=['stagePos2_exp_5456_image_',num2str(distances(index)*10),'.png'];
A=imread(filename);
%A=rgb2gray(A);
%A = imbinarize(A);
%A_r = (A * (75+(index*2))) + 2*index;
%A_g = A * (172+ (index));
%A_b = A * (172+ (index)) + 2*index;
%red = uint8(A_r);
%green = uint8(A_g);
%blue = uint8(A_b);
%A_full = cat(3,red,green,blue);
imshow(A);

drawnow

    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
      
    if index==1
              imwrite(imind,cm,filename_gif,'gif', 'Loopcount',inf); 
    else
              imwrite(imind,cm,filename_gif,'gif','DelayTime',0.1,'WriteMode','append'); 
    end

%pause(0.01);
end

%can change delay time for animation speed