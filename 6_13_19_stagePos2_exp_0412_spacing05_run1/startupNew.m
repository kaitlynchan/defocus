format compact;
format short g;
more off;

FontSize = 20;    %12
LineWidth = 1.5;  %1

set(0, 'DefaultTextFontSize', FontSize);
set(0, 'DefaultAxesFontSize', FontSize);
set(0, 'DefaultAxesFontName', 'Avenir');
set(0, 'DefaultAxesLineWidth', LineWidth);
set(0, 'DefaultAxesTickLength', [0.014 0.014]);
set(0, 'DefaultAxesBox', 'on');
set(0, 'DefaultLineLineWidth', LineWidth);
set(0, 'DefaultLineMarkerSize', 5);
set(0, 'DefaultPatchLineWidth', LineWidth);
set(0, 'DefaultFigureColor', [1 1 1]);
% set(0, 'DefaultAxesColor', 'none');
set(0, 'DefaultFigurePaperPosition',[2.65 4.3 3.2 2.4]);
%set(0, 'DefaultFigurePosition', [800 500 360 270])
% 360x260 pixels on screen keeps same aspect ratio as 3.2x2.4 printed
set(0, 'DefaultFigurePosition', [800 500 426 320])
set(0, 'DefaultFigureDockControls', 'off')

% try to remember last working directory
