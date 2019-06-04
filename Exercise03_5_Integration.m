% Calculate numerically the area of an equal sided (isosceles) triangle ABC
% Given base AB has length 1 pointing in x-direction
% Given height of 1 in y-direction
clear
clc
% Compute the integral for finite areas
% Number of grids
N = 100;
Y = linspace(0,1,N);

% Equidistant meshing
Dy = Y(2) - Y(1);
W = abs(0.5 .* Y - 0.5);

% Multiplied by 2 as Dy * sum(W) solves one half
I_Area = Dy * sum(W) * 2
I_actual = 0.5*1*1

% Calculate numerically the center of gravity of the triangle 
% First moment of area divided by the area
I_Moment = Dy * sum(Y .* W) * 2;
y_CG = I_Moment / I_Area