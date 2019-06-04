clear
clc
close all
% Author: 			Liaw Jin Cheng
% Email: 			jin.liaw@stud.uni-due.de
% Matriculation: 	3025341

% Number of computational cells
N = 50;

% Number of ghost cells
nG = 1;

%%%%%!!!!!---------------------------------------!!!!!%%%%%
%% Mesh Naming (x)
%%%%%!!!!!---------------------------------------!!!!!%%%%%
Ima = N;        % Number of x computational cells!!!
Ifim = 1;       % Index of ghost cell left of x
Ifi = nG + 1;   % First computational cell in x-direction

Ila = Ima + nG; % Last computational cell in x-direction
Ilam = Ila - 1; % Computational cell behind the last one
Ilap = Ila + 1; % Index ghost cell right of x

%%%%%!!!!!---------------------------------------!!!!!%%%%%
%% Mesh Naming (y)
%%%%%!!!!!---------------------------------------!!!!!%%%%%
Jma = N; % Number of y computational cells!!!
Jfim = 1; % Index of ghost cell below y
Jfi = nG + 1; % First computational cell in y-direction

Jla = Jma + nG; % Last computational cell in y-direction
Jlam = Jla - 1; % Computational cell behind the last one
Jlap = Jla + 1; % Index of ghost cell above y

% Initialising the predicted momentum field
x = linspace(0, 2*pi, N);
rhouP = cos(x);
Delta = x(2) - x(1);
DeltaT = 0.005;

% Calculating the divergence of the momentum prediction
divPred_x = divMom1D(rhouP, Delta);

% Calculating the resulting pressure by solving the Poisson Equation
P = zeros(1, N);
[P counter] = poissonSolver1D(DeltaT, Delta, divPred_x, P);

% Calculating the corrected momentum
rhou = corrMom1D(DeltaT, Delta, P, rhouP);

% Plot
plot1 = subplot(2,1,1);
plot1 = plot(x, rhouP, 'r-');
hold on
plot1 = p
lot(x, divPred_x, 'b-');

subplot(2,1,2)
plot2 = plot(x, P, 'k-');
xlim([0 2*pi])

subplot(2,1,1)
plot1 = plot(x, rhou, 'g-');
xlim([0 2*pi])
ylim([-2 2])
plot1 = legend("Predicted Momentum", "Divergence", "Corrected Momentum");

fprintf("Number of Jacobi Iterations for the Poisson Solver: %i\n", counter)