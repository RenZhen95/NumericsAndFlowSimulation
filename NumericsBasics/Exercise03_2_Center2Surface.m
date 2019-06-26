% Colocated variable arrangement
% Momentum and pressure are stored at cell centers
% Surface normal velocities must be known on the cell surfaces to calculate the fluxes

clear
clc

% Reminder: This program calculates the cell surface quantities!
% Create a 2D array Uc and Vc of 10x10 elements and initialise them with values of choice
N = 10;
Uc = zeros(N,N); % Uc holds both the x and y components. It is a 2D NxN Matrix!!
Uc(:) = 0 + 10*rand([N,N]); 
quiver(Uc(1:N,1:N),Uc(1:N,1:N))

% Visualise the velocity field
% Calculate the fields Ue (east) and Vn (north) from a linear interpolation

% Calculate phi_N from phi_NW and phi_NE
% Calculate phi_S from phi_SW and phi_SE
% Calculate phi_P from phi_N and phi_S
phi(1:N-1,1:N-1) = (Uc(1:N-1,1:N-1) + Uc(2:N,2:N))/2;