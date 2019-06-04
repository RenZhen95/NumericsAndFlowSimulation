%Exercise02_MatlabBasics_02
clear
clc
subplot(1,2,1)
ezplot('exp(x)-exp(-x)')

subplot(1,2,2)
ezsurf('sin(3*x) + cos(3*y)')

% Initialize the values of first and second
first = 1.23;
second = 1.24;

% Assign first to x
x = first;

% Assign value of second to first
first = second;

%Assig value of x to first
second = x;

fprintf('Value of first is now = %f \n', first);
fprintf('Value of second is now = %f \n', second);
