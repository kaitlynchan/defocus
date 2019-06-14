
close all
clear all
clc

% Matlab code to control Newport Model CONEX-CC 
% Stepper motor stage and controller
% Written by Zain Zaidi 2018


stepperObject = serial('COM3');
set(stepperObject,'BaudRate',921600);
set(stepperObject,'DataBits',8)
set(stepperObject,'Parity','none')
set(stepperObject,'StopBits',1)
set(stepperObject,'timeout',10)
stepperObject.Terminator = 'CR/LF';

fopen(stepperObject)
Debug='Stepper Has been Initiated' 

%% command to home to stage 
fprintf(stepperObject,'1OR')
pause(3)

%% Command to move to an absolute position

fprintf(stepperObject,'1PA0')

%%
% Add NET assembly
% May need to change specific location of library
NET.addAssembly('C:\Program Files\Thorlabs\Scientific Imaging\DCx Camera Support\Develop\DotNet\uc480DotNet.dll');
% Create camera object handle
cam = uc480.Camera;
% Open the 1st available camera
cam.Init(0);
% Set display mode to bitmap (DiB)
cam.Display.Mode.Set(uc480.Defines.DisplayMode.DiB);
% Set color mode to 8-bit RGB
cam.PixelFormat.Set(uc480.Defines.ColorMode.RGBA8Packed);
% Set trigger mode to software (single image acquisition)
cam.Trigger.Set(uc480.Defines.TriggerMode.Software);
% Allocate image memory
[~, MemId] = cam.Memory.Allocate(true);

exposure_ms=0.5;%ms
cam.Timing.Exposure.Set(exposure_ms);

%%
numOfMove=11;
position=linspace(7.5,17.5,numOfMove);
for i=1:numOfMove
    currentPos=['1PA',num2str(position(i))];
    fprintf(stepperObject,currentPos)
    pause(1);
    % Obtain image information
    [~, Width, Height, Bits, ~] = cam.Memory.Inquire(MemId);
    % Acquire image
    cam.Acquisition.Freeze(uc480.Defines.DeviceParameter.Wait);
    % Copy image from memory
    [~, tmp] = cam.Memory.CopyToArray(MemId);
    % Reshape image
    Data = reshape(uint8(tmp), [Bits/8, Width, Height]);
    Data = Data(1:3, 1:Width, 1:Height);
    Data = permute(Data, [3,2,1]);
    filename=['exposure0.5/run3_image',num2str(position(i)),'.png'];
    imwrite(Data,filename);
    pause(1)
end
