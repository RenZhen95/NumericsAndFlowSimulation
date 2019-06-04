clear
clc
close all
% Scalar Transport in 2D

% Number of ghost celss
nG = 1; 

%%%%%!!!!!----------Mesh Naming (x)----------!!!!!%%%%%
Ima = 100; % Number of x computational cells!!!
Ifim = 1; % Index of ghost cell left of x
Ifi = nG + 1; % First computational cell in x-direction

Ila = Ima + nG; % Last computational cell in x-direction
Ilap = Ila + 1; % Index ghost cell right of x

%%%%%!!!!!----------Mesh Naming (y)----------!!!!!%%%%%
Jma = 100; % Number of y computational cells!!!
Jfim = 1; % Index of ghost cell below y
Jfi = nG + 1; % First computational cell in y-direction

Jla = Jma + nG; % Last computational cell in y-direction
Jlap = Jla + 1; % Index of ghost cell above y

% Note: When initialising velocity, scalar quantity, etc arrays: Dimensions (0 - Ilap)
% Create 1D velocity array u and scalar array phi of same size
% (Won't do that here, simply assume constant velocity field at this point)

% Initialise the velocity field with i constant U
U = 50;
u = 0;
v = U;

% Create parameters DeltaT (timestep width)
% Create parameters DeltaX (cell spacing)
CFL = 0.3; % Define i constant
DeltaX = 1; % Equidistant cell spacing
DeltaY = 1; % Equidistant cell spacing
DeltaT = CFL * DeltaX / U;

% Diffusion Coefficient 
D = 0;

% Initialise the 2D scalar field
phi_XY = zeros(Jlap,Ilap);
phi_XY(Jfim,30:70) = 50;
phiPlot = phi_XY;

%% Calculating phiNew %%
for n = 1:500
    %%%%%!!!!!----------Convection Terms----------!!!!!%%%%%
    for i = Ifi:Ila       % x-Direction
        for j = Jfi:Jla   % y-Direction
            Fc_XY(j,i) = (0.5/DeltaY)*(phiPlot(j+1,i)*v - phiPlot(j-1,i)*v) + ...
                         (0.5/DeltaX)*(phiPlot(j,i+1)*u - phiPlot(j,i-1)*u); 
        end
    end

    %%%%%!!!!!----------Diffusive Terms----------!!!!!%%%%%
    for i = Ifi:Ila        % x-Direction
        for j = Jfi:Jla    % y-Direction
            Fd_XY(j,i) = (D/(DeltaY^2)) * (phiPlot(j+1,i) - 2*phiPlot(j,i) + phiPlot(j-1,i)) + ... 
                         (D/(DeltaX^2)) * (phiPlot(j,i+1) - 2*phiPlot(j,i) + phiPlot(j,i-1));
        end
    end

    %%%%%!!!!!----------Solving phiNew----------!!!!!%%%%%
    phiPlot(Jfi:Jla,Ifi:Ila) = phiPlot(Jfi:Jla,Ifi:Ila) + DeltaT * ...
                              (-Fc_XY(Jfi:Jla,Ifi:Ila) + Fd_XY(Jfi:Jla,Ifi:Ila));
    % Initializing the ghost cells 
    phiPlot(Jfim,30:70) = 50;
    phiPlot(:,Ifim) = 0;
    phiPlot(:,Ilap) = 0;
    phiPlot(Jlap,Ifi:Ila) = phiPlot(Jla,Ifi:Ila);
    
    contourf(phiPlot, 'LineColor', 'none')
    drawnow
end