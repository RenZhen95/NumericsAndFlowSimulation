% Differentiation of y(x) using array operations for equidistant grids
clear
clc
close all
% Create array X from intervals of -10 to 10 with 100 support points
N = 100;
X = linspace(-10,10,N);
Y = sin(X) .* X .^3;

% Write a program to calculate the first derivative using the three different schemes
% For the boundary treatment, assume linear interpolation
%%%%%%%%%%%%%%%%%%%%%%%%%%------------------------------------------%%%%%%%%%%%%%%%%%%%%%%%%%%
% First Derivative
%%%%%%%%%%%%%%%%%%%%%%%%%%------------------------------------------%%%%%%%%%%%%%%%%%%%%%%%%%%
% Using LDS, point and left neighbour
dphi_dx_LDS(1:N-1) = (Y(2:N) - Y(1:N-1)) ./ (X(2:N) - X(1:N-1));
dphi_dx_LDS(N) = dphi_dx_LDS(N-1);

% Using CDS, two neighbours
dphi_dx_CDS(2:N-1) = (Y(3:N) - Y(1:N-2)) ./ (X(3:N) - X(1:N-2));
dphi_dx_CDS(1) = dphi_dx_CDS(2);
dphi_dx_CDS(N) = dphi_dx_CDS(N-1);

% Using RDS, point and left neighbour
dphi_dx_RDS(2:N) = (Y(2:N) - Y(1:N-1)) ./ (X(2:N) - X(1:N-1));
dphi_dx_RDS(1) = dphi_dx_RDS(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%------------------------------------------%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second Order Derivative
%%%%%%%%%%%%%%%%%%%%%%%%%%------------------------------------------%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculating the second order derivatives
% Higher order derivatives for LDS
d2phi_dx2_LDS(1:N-1) = (dphi_dx_LDS(2:N) - dphi_dx_LDS(1:N-1)) ./ (X(2:N) - X(1:N-1));
d2phi_dx2_LDS(N) = d2phi_dx2_LDS(N-1);

% Higher order derivatives for CDS
d2phi_dx2_CDS(2:N-1) = (dphi_dx_CDS(3:N) - dphi_dx_CDS(1:N-2)) ./ (X(3:N) - X(1:N-2));
d2phi_dx2_CDS(1) = d2phi_dx2_CDS(2);
d2phi_dx2_CDS(N) = d2phi_dx2_CDS(N-1);

% Higher order derivatives for RDS
d2phi_dx2_RDS(2:N) = (dphi_dx_RDS(2:N) - dphi_dx_RDS(1:N-1)) ./ (X(2:N) - X(1:N-1));
d2phi_dx2_RDS(1) = d2phi_dx2_RDS(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%------------------------------------------%%%%%%%%%%%%%%%%%%%%%%%%%%
% Third Order Derivative
%%%%%%%%%%%%%%%%%%%%%%%%%%------------------------------------------%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculating the third order derivatives
% Higher order derivatives for LDS
d3phi_dx3_LDS(1:N-1) = (d2phi_dx2_LDS(2:N) - d2phi_dx2_LDS(1:N-1)) ./ (X(2:N) - X(1:N-1));
d3phi_dx3_LDS(N) = d3phi_dx3_LDS(N-1);

% Higher order derivatives for CDS
d3phi_dx3_CDS(2:N-1) = (d2phi_dx2_CDS(3:N) - d2phi_dx2_CDS(1:N-2)) ./ (X(3:N) - X(1:N-2));
d3phi_dx3_CDS(1) = d3phi_dx3_CDS(2);
d3phi_dx3_CDS(N) = d3phi_dx3_CDS(N-1);

% Higher order derivatives for RDS
d3phi_dx3_RDS(2:N) = (d2phi_dx2_RDS(2:N) - d2phi_dx2_RDS(1:N-1)) ./ (X(2:N) - X(1:N-1));
d3phi_dx3_RDS(1) = d3phi_dx3_RDS(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%------------------------------------------%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fourth Order Derivative
%%%%%%%%%%%%%%%%%%%%%%%%%%------------------------------------------%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculating the fourth order derivatives
% Higher order derivatives for LDS
d4phi_dx4_LDS(1:N-1) = (d3phi_dx3_LDS(2:N) - d3phi_dx3_LDS(1:N-1)) ./ (X(2:N) - X(1:N-1));
d4phi_dx4_LDS(N) = d4phi_dx4_LDS(N-1);

% Higher order derivatives for CDS
d4phi_dx4_CDS(2:N-1) = (d3phi_dx3_CDS(3:N) - d3phi_dx3_CDS(1:N-2)) ./ (X(3:N) - X(1:N-2));
d4phi_dx4_CDS(1) = d4phi_dx4_CDS(2);
d4phi_dx4_CDS(N) = d4phi_dx4_CDS(N-1);

% Higher order derivatives for RDS
d4phi_dx4_RDS(2:N) = (d3phi_dx3_RDS(2:N) - d3phi_dx3_RDS(1:N-1)) ./ (X(2:N) - X(1:N-1));
d4phi_dx4_RDS(1) = d4phi_dx4_RDS(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%------------------------------------------%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plots for LDS, CDS and RDS
%%%%%%%%%%%%%%%%%%%%%%%%%%------------------------------------------%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plots for LDS
subplot(1,3,1)
title('LDS')
plot(X,Y,'k')
hold on
plot(X,dphi_dx_LDS,'c*-')
plot(X,d2phi_dx2_LDS,'r+-')
plot(X,d3phi_dx3_LDS,'gx-')
plot(X,d4phi_dx4_LDS,'b>-')

% Plots for CDS
subplot(1,3,2)
title('CDS')
plot(X,Y,'k')
hold on
plot(X,dphi_dx_CDS,'c*-')
plot(X,d2phi_dx2_CDS,'r+-')
plot(X,d3phi_dx3_CDS,'gx-')
plot(X,d4phi_dx4_CDS,'b>-')

% Plots for RDS
subplot(1,3,3)
title('RDS')
plot(X,Y,'k')
hold on
plot(X,dphi_dx_RDS,'c*-')
plot(X,d2phi_dx2_RDS,'r+-')
plot(X,d3phi_dx3_RDS,'gx-')
plot(X,d4phi_dx4_RDS,'b>-')

%%%%%%%%%%%%%%%%%%%%%%%%%%------------------------------------------%%%%%%%%%%%%%%%%%%%%%%%%%%
% Integrating from x = 3 to x = 9
%%%%%%%%%%%%%%%%%%%%%%%%%%------------------------------------------%%%%%%%%%%%%%%%%%%%%%%%%%%
% Looking for positiong of X < 3
for i = 1:N
    if X(i) >= 3
        a = i-1;
        break
    end
end
% Looking for positiong of X > 9
for j = 1:N
    if X(j) >= 9
        b = j;
        break
    end
end

% Integration
Dx = X(2) - X(1);
I = Dx * sum(Y(a:b));