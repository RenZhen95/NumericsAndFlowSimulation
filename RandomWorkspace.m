% Author: 			Liaw Jin Cheng
% Email: 			jin.liaw@stud.uni-due.de
% Matriculation: 	3025341

clear
clc
close all
% Some lecture scripts to print out that can be helpful
% Lecture 2 (4, 6 - 14, 16 - 21, 23 - 26, 28 - 34)
% Lecture 4 (6 - 7, 11 - 12, 14 - 16)
% Lecture 6 (2 - 3, 5 - 6, 8, 10 - 12)
%%%%%!!!!!---------------------------------------!!!!!%%%%%
%% Simulation Parameters
%%%%%!!!!!---------------------------------------!!!!!%%%%%
N = 10;            % Number of computational cells
Jet_Radius = 2;    

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
CFL = 0.3; % Define i constant
DeltaT = CFL * Delta / 50;
for n = 1:500
    [velu, velv] = mom2vel(rhou,rhov);
    [FluxConX_rhov, FluxConY_rhov] = calcFluxConCDS(velu, velv, rhov, Delta);
    rhov(Jfi:Jla,Ifi:Ila) = rhov(Jfi:Jla,Ifi:Ila) + DeltaT .* (FluxConY_rhov(Jfim:Jlam,Ifi:Ila) - FluxConY_rhov(Jfi:Jla,Ifi:Ila));
end