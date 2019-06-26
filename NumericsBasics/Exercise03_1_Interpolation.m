% Common Convention
% Center cell is has notation i or j
% Boundaries of outlet also has notation i and j
% Boundaries of inlet have notations i-1 and j-1

% Dirichlet Condition
% Value on the boundary is given

% von Neumann Condition
% The surface normal gradient is set to zero 
% Implies that the velocity at the outlet equals to that of the cell before it

% Tutorial 1
% Create an array X = 0:10 and an array Y with y(x) = 3x^3 + 2x^2 + x
X = linspace(0,10,10);
Y = 3 .* X.^3 + 2 .* X.^2 + X;
N = length(X);

% Create arrays Xmid and Ymid 
% To calculate the linearly interpolated values at the points right in the center of the original points
Xmid(1:N-1) = 0.5 .* X(1:N-1) + 0.5 .* X(2:N);
Ymid(1:N-1) = 0.5 .* Y(1:N-1) + 0.5 .* Y(2:N);
plot(X,Y, 'k')
hold on
plot(Xmid,Ymid, 'b:')

% Create an array Xf (fine) with Xf = 0:0.1:10 and use linear interpolation to obtain the respective Yf values
Xf = linspace(0,10);
Yf = 3 .* Xf.^3 + 2 .* Xf.^2 + Xf;
M = length(Xf);
Xfmid(1:N-1) = 0.5 .* X(1:N-1) + 0.5 .* X(2:N);
Yfmid(1:N-1) = 0.5 .* Y(1:N-1) + 0.5 .* Y(2:N);
plot(Xfmid, Yfmid, 'r*')
