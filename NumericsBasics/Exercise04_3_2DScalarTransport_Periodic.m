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

% Initialise the velocity field with a constant U
U = 50;
u = U;
v = U;
scaValueY = 1;
scaValueX = 50*cos(linspace(0,pi,Ilap));

% Create parameters DeltaT (timestep width)
% Create parameters DeltaX (cell spacing)
CFL = 0.2; % Define a constant
DeltaX = 1; % Equidistant cell spacing
DeltaY = 1; % Equidistant cell spacing
DeltaT = CFL * DeltaX / U;

% Diffusion Coefficient 
D = 0.02;

% Initialise the 2D scalar field with a periodic sine function (1 cycle)
phi_XY = zeros(Jlap,Ilap);
for j = 1:Jlap
    for i = 1:Ilap
        phi_XY(j,i) = scaValueY + scaValueX(i);
    end
    scaValueY = scaValueY + 1;
end
phiPlot = phi_XY;
subplot(2,1,1)
contour(phi_XY)

%% Calculating phiNew %%
for i = 1:175
    %%%%%!!!!!----------Convection Terms----------!!!!!%%%%%
    for a = Jfi:Jla       % x-Direction
        for b = Ifi:Ila   % y-Direction
            Fc_XY(a,b) = (0.5/DeltaY)*(phiPlot(a,b+1)*v - phiPlot(a,b-1)*v) + (0.5/DeltaX)*(phiPlot(a+1,b)*u - phiPlot(a-1,b)*u); 
        end
    end

    %%%%%!!!!!----------Diffusive Terms----------!!!!!%%%%%
    for c = Jfi:Jla        % x-Direction
        for d = Ifi:Ila    % y-Direction
            Fd_XY(c,d) = (D/(DeltaY^2))*(phiPlot(c,d+1) - 2*phiPlot(c,d) + phiPlot(c,d-1)) + ... 
            (D/(DeltaX^2))*(phiPlot(c+1,d) - 2*phiPlot(c,d) + phiPlot(c-1,d));
        end
    end

    %%%%%!!!!!----------Solving phiNew----------!!!!!%%%%%
    phiNew = zeros(Jlap,Ilap); % Initialising phiNew array
    
    phiNew(Jfi:Jla,Ifi:Ila) = phiPlot(Jfi:Jla,Ifi:Ila) + DeltaT * ...
        (-Fc_XY(Jfi:Jla,Ifi:Ila) + Fd_XY(Jfi:Jla,Ifi:Ila));
    % Initializing the ghost cells 
    phiNew(:,Ifim) = phiNew(:,Ila);
    phiNew(:,Ilap) = phiNew(:,Ifi);
    phiNew(Jfim,:) = phiNew(Jla,:);
    phiNew(Jlap,:) = phiNew(Jfi,:);
    
    subplot(2,1,2)
    contour(phiNew)
    drawnow

    phiPlot = phiNew;
end