%plots magnification ratio (in pixels) with respect to the first position versus u distance

clear all; close all; clc
distances=0:0.5:25;
u_vec=zeros(1,length(distances));
m_vec=zeros(1,length(distances));
u1 = 20;

for index=1:length(distances)

%u_vec(index) = 25-distances(index)+52;
u_vec(index) = 25-distances(index);
delta = 25-distances(index);
m_vec(index) = u1/(u1 + delta);
disp("Distance: " + num2str(25-distances(index)));
disp("Ideal Magnification: " + num2str(u1/(u1 + delta)));

end

figure(1);
plot(u_vec, m_vec,'o');
title('Ideal magnification vs delta u');
xlabel('delta (u1 = 20 mm) - [change in object to lens distance]');
ylabel('Ideal magnification');

hold on
p = polyfit(u_vec, m_vec,3);
x1 = linspace(0,25);
y1 = polyval(p,x1);
plot(x1,y1);