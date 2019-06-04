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

% Initialise the momentum field with a periodic sine function (1 cycle)
phi_grid = linspace(0, 2*pi, Ima+2*nG);
rhou = sin(phi_grid);

% Parameters 
CFL = 0.1; % Define a constant
Delta = phi_grid(2) - phi_grid(1); % Cell Spacing
DeltaT = 0.006; % Timestep Width
D = 0; % Diffusion Coefficient

% Initialise the pressure field
P = zeros(1, N + 2*nG);

%%%%%!!!!!---------------------------------------!!!!!%%%%%
%% Solving the 1D Momentum Transfer
%%%%%!!!!!---------------------------------------!!!!!%%%%%
for n = 1:250
    % Calculating the divergence of the momentum prediction
    rhouP = rhou;
    divPred_x = divMom1D(rhouP, Delta);

    % Calculating the resulting pressure by solving the Poisson Equation
    P = poissonSolver1D(DeltaT, Delta, divPred_x, P);

    % Calculating the corrected momentum
    rhou = corrMom1D(DeltaT, Delta, P, rhouP);

    % Calculating the velocites at cell surface
    velu = mom2vel_1D(rhou);

    % Calculating the convective fluxes for rhou
    FluxConX_rhou = calcFluxConUSCDS_1D(velu, rhou, Delta, DeltaT);

    % Calculating the diffusive fluxes for rhou
    FluxDifX_rhou = calcFluxDif(rhou, Delta, D);

    % Transporting the momentum in the x direction
    rhou(Ifi:Ila) = rhou(Ifi:Ila) ... 
    + DeltaT / (Delta^3) * ...
    (FluxConX_rhou(Ifim:Ilam) - FluxConX_rhou(Ifi:Ila)) ... 
    - DeltaT / (Delta^3) * ... 
    (FluxDifX_rhou(Ifim:Ilam) - FluxDifX_rhou(Ifi:Ila));

    % Boundary Conditions (Periodic)
    rhou(Ifim) = rhou(Ila);
    rhou(Ilap) = rhou(Ila);
    rhou(Ifi) = rhou(Ifim);
    
    % Plotting
    subplot(1,2,1)
    plot(phi_grid, divPred_x, 'r-')

    subplot(1,2,2)
    plot(phi_grid, rhou)
    drawnow
end