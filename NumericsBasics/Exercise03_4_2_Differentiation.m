% Differentiation of y(x) using a loop for non-equidistant grids
clear
clc

% Create an array X in intervals [-10,10] and deltaX(i+1) = 0.99*deltaX(i) where deltaX(1) = 0.1
deltaX = 0.1;
A = 0;
index_count = 1;
while A < 20
    X(index_count) = A;
    A = A + deltaX;
    deltaX = 0.99 * deltaX;
    index_count = index_count + 1;
end
