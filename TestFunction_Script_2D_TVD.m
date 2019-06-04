% Author: 			Liaw Jin Cheng
% Email: 			jin.liaw@stud.uni-due.de
% Matriculation: 	3025341

clear
clc
close all
% Some lecture scripts to print out that can be helpful
% Lecture 2 (4, 6 - 14, 16 - 21, 23 - 26, 28 - 34)
%%%%%!!!!!---------------------------------------!!!!!%%%%%
%% Simulation Parameters
%%%%%!!!!!---------------------------------------!!!!!%%%%%
N = 50;            % Number of computational cells
Jet_Radius = 10;    

nG = 1;             % The number of ghost cells
Delta = 1;          % The length/width of the cells
D = 0.2;            % Diffusion coefficient
kinVis = 14.88e-6;  % Kinematic Viscosity of air

% Obtaining the center of N and specifying a given distance from the center (radius)
N_G = N + 2*(nG);
if mod(N_G,2) == 0
    N_cl = (N_G/2) - 1;
    N_cr = (N_G/2) + 1;
    J1 = N_cl - (Jet_Radius - 1);
    J2 = N_cr + (Jet_Radius - 1);
else
    N_c = (N_G/2) + 0.5;
    J1 = N_c - Jet_Radius;
    J2 = N_c + Jet_Radius;
end

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

%%%%%!!!!!---------------------------------------!!!!!%%%%%
%% Initialising Scalar Field
%%%%%!!!!!---------------------------------------!!!!!%%%%%
%% Test Case: A Jet (coming from bottom-up)
%% Initialising the values of rhou in each cell center
rhou = zeros(Jlap,Ilap); % Momentum in x direction in each cell

%% Initialising the values of rhov in each cell center
rhov = zeros(Jlap,Ilap); % Momentum in y direction in each cell
rhov(Jfim,J1:J2) = 50;

%% Create parameters DeltaT (timestep width) %%
CFL = 0.2; % Define i constant
DeltaT = CFL * Delta / 50;

%%%%%!!!!!---------------------------------------!!!!!%%%%%
%% Transport Equations
%%%%%!!!!!---------------------------------------!!!!!%%%%%
for n = 1:250
    % Obtaining the velocities on the cell surfaces: e (x-direction) & n (y-direction) from momentum
    [velu, velv] = mom2vel(rhou,rhov);

    % Calculating the convective fluxes for rhou
    [FluxConX_rhou, FluxConY_rhou] = calcFluxConTVD(velu, velv, rhou, Delta);
    % Calculating the convective fluxes for rhov
    [FluxConX_rhov, FluxConY_rhov] = calcFluxConTVD(velu, velv, rhov, Delta);

    % Calculating the diffusive fluxes for rhou
    [FluxDifX_rhou, FluxDifY_rhou] = calcFluxDif(rhou, Delta, D);
    % Calculating the diffusive fluxes for rhov
    [FluxDifX_rhov, FluxDifY_rhov] = calcFluxDif(rhov, Delta, D);

    % Transporting the momentum in the x direction
    rhou(Jfi:Jla,Ifi:Ila) = rhou(Jfi:Jla,Ifi:Ila) ... 
                            + DeltaT / (Delta^3) * ...
                            ((FluxConX_rhou(Jfi:Jla,Ifim:Ilam) - FluxConX_rhou(Jfi:Jla,Ifi:Ila)) + ... 
                             (FluxConY_rhou(Jfim:Jlam,Ifi:Ila) - FluxConY_rhou(Jfi:Jla,Ifi:Ila))) ... 
                            - DeltaT / (Delta^3) * ... 
                            ((FluxDifX_rhou(Jfi:Jla,Ifim:Ilam) - FluxDifX_rhou(Jfi:Jla,Ifi:Ila)) + ... 
                             (FluxDifY_rhou(Jfim:Jlam,Ifi:Ila) - FluxDifY_rhou(Jfi:Jla,Ifi:Ila)));
    % Boundary Conditions for momentum in x direction
    rhou(Jfim,:) = 0;
    rhou(Jlap,:) = rhou(Jla,:);
    rhou(:,Ifim) = 0;
    rhou(:,Ilap) = 0;

    % Transporting the momentum in the y direction
    rhov(Jfi:Jla,Ifi:Ila) = rhov(Jfi:Jla,Ifi:Ila) ... 
                            + DeltaT / (Delta^3) * ...
                            ((FluxConX_rhov(Jfi:Jla,Ifim:Ilam) - FluxConX_rhov(Jfi:Jla,Ifi:Ila)) + ... 
                             (FluxConY_rhov(Jfim:Jlam,Ifi:Ila) - FluxConY_rhov(Jfi:Jla,Ifi:Ila))) ... 
                            - DeltaT / (Delta^3) * ... 
                            ((FluxDifX_rhov(Jfi:Jla,Ifim:Ilam) - FluxDifX_rhov(Jfi:Jla,Ifi:Ila)) + ... 
                             (FluxDifY_rhov(Jfim:Jlam,Ifi:Ila) - FluxDifY_rhov(Jfi:Jla,Ifi:Ila)));
    % Boundary Conditions for momentum in y direction
    rhov(Jfim,:) = 0;
    rhov(Jfim,J1:J2) = 50;
    rhov(Jlap,:) = rhov(Jla,:);
    rhov(:,Ifim) = 0;
    rhov(:,Ilap) = 0;

    contourf(rhov, 'LineColor', 'none')
    drawnow
    if min(min(rhov)) < 0
        fprintf("%i --> Iteration at which things get weird\n", n)
        break
    end
end