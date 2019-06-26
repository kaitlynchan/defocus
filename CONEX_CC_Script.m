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
fprintf(stepperObject,'1OR?')
pause(3)
%% Command for ??
fprintf(stepperObject,'1OR')
out=fscanf(stepperObject)

%% Command to prob
clc
fprintf(stepperObject,'1PA?')
out=fscanf(stepperObject)

out=str2num(out(4:end))

%%
fprintf(stepperObject,'RS')
%%
fprintf(stepperObject,'1MM_Set1')

%%
fprintf(stepperObject,'1OR')
%% Command to move to an absolute position

fprintf(stepperObject,'1PA12.5')
%% Command to move to a relative position 
fprintf(stepperObject,'1PR0.1');
