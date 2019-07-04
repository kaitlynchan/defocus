%pos25: 1mm = 6.2 pixels (redo)
%pos12: 1mm = 12.333

clear all; close all; clc
%pixel to mm conversion
p_per_mm = 12.333;
%LED source to projection screen distnace (mm)
dist=62;

filename=['pos_12_exp_30_run2.png'];
A=imread(filename);
A=rgb2gray(A);
figure();
imshow(A);
A=double(A);

[m,n]=find(A==max(max(A)));

ind_d2 = m:m;
ind_d1 = n:n;
fprintf('Col Ind: %d | Row Ind: %d .\n',ind_d1,ind_d2);

%get pixel values of horizontal profile
intensitiesX = A(ind_d2, :);
%converting every 6.2 pixels to 1mm
x_axis = linspace(0,1280/p_per_mm,1280);

%find maximum pixel in profile
[peak_val, peak_index] = max(intensitiesX);


%find the edge value (peak*e^-2)
edge_val = exp(-2)*peak_val;
%find the number of pixels above the edge value
beam_diam = length(find(intensitiesX >= edge_val));
beam_rad = beam_diam/2;

%convert the pixel distance to mm
beam_rad_mm = beam_rad/p_per_mm;

%print some numbers
fprintf('Peak Intensity Value: %.2f | Edge Intensity Value: %.2f .\n',peak_val,edge_val);
fprintf('Beam Radius (mm): %.2f.\n',beam_rad_mm);
theta = atand(beam_rad_mm/dist);
disp("FoV: " + 2*theta);


figure();
plot(x_axis,intensitiesX,'o');
%draw horizontal line at cutoff value
yline(edge_val,'-r','max/e^2 = 25.31','LabelHorizontalAlignment','center');
title({'horizontal cross section', "Projection to Source Distance: 62mm"});
xlabel('mm range');
ylabel('pixel intensity');
ylim([0 300])

