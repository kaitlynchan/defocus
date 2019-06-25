%Overlays beam profiles equidistant from a chosen focus distance
%focus point distance: 13mm

clear all; close all; clc
distances=7.5:0.5:17.5;
focus_idx = 12;
radius=zeros(1,length(distances));
pos=zeros(1,length(distances));


h=figure;
axis tight manual
filename_gif='testanimatedOverlay.gif';

for index=1:9
    
    figure(1);
    hold off
    
    for inner=1:2
        if inner == 1
            dist_idx = focus_idx-index;
            plotColor = 'blue';
        else
            dist_idx = focus_idx+index;
            plotColor = 'red';
        end
        
        filename=['stagePos2_exp_0092_image_',num2str(distances(dist_idx)*10),'.png'];
        A=imread(filename);
        A=double(A);
        A = A(:,:,1);
        [m,n]=find(A==max(max(A)));
        ind_d2 = m:m;
        ind_d1 = n:n;
        
        hm(1,inner) = max(max(A))/2;
        Filtered=find(A>hm(1,1));
        radius(dist_idx)=sqrt((length(Filtered))/pi);
        
        disp("Distance: " + (25-distances(dist_idx)));
        disp("HM: " + hm(1,1));

        margin=50;
        intensitiesX = A(ind_d2, ind_d1-margin:ind_d1+margin);
        intensitiesY = A(ind_d2-margin:ind_d2+margin, ind_d1);
        
        plot(intensitiesY,'o','Color', plotColor);
        title({"vertical cross section symmetric about: "+num2str(25-distances(focus_idx)), "Red: "+num2str(25-distances(focus_idx+index)), "Blue: "+num2str(25-distances(focus_idx-index))});
        xlabel('range of pixels');
        ylabel('pixel intensity');
        axis([0 110 0 300]);
        pause(0.5);
        
        hold on
        
        drawnow

        frame = getframe(h); 
        im = frame2im(frame); 
        [imind,cm] = rgb2ind(im,256); 

            if index==1 && inner ==1
                      imwrite(imind,cm,filename_gif,'gif', 'Loopcount',inf); 
            else
                      imwrite(imind,cm,filename_gif,'gif','DelayTime',0.75,'WriteMode','append'); 
            end

        end
%pause(1);

end


