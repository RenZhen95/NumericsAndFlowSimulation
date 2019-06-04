%Exercise02_MatlabBasics_08
clear
clc
% Create array x of values from -10 to 10
% Spacing of 0.1
x = (-10:0.1:10);
y = sin(1 ./ x);
plot(x,y)

% Copy the right half of Matrix M, using the colon operator
M = [1 2 3 5 8.5 2; -1/3 -0.6666 -1 3 2 -5.1; 7 8 9 2.01 -1 3];
M_right = [M(:,4) M(:,5) M(:,6)]
