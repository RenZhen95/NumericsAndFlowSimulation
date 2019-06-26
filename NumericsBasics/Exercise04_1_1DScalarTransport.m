clear
clc
close all
% Scalar Transport in 1D

% Number of ghost celss
nG = 1; 

%%%%%!!!!!----------Mesh Naming (x)----------!!!!!%%%%%
Ima = 100;      % Number of x computational cells!!!
Ifim = 1;       % Index of ghost cell left of x
Ifi = nG + 1;   % First computational cell in x-direction
Ila = Ima + nG; % Last computational cell in x-direction
Ilap = Ila + 1; % Index ghost cell right of x

% Initialise the scalar field with a periodic sine function (1 cycle)
phi_grid = linspace(0, 2*pi, Ima+2*nG);
phi_X = sin(phi_grid);

% Initialise the velocity field with a constant U
U = 1;
CFL = 0.1; % Define a constant
DeltaX = phi_grid(2) - phi_grid(1); % Cell Spacing
DeltaT = CFL * DeltaX / U; % Timestep Width
D = 0; % Diffusion Coefficient

%%%%!!!!!----------Solving phiNew----------!!!!!%%%%%
phiNew = zeros(1,Ilap); % Initialising phiNew array
phiPlot = phi_X;
subplot(2,1,1)
plot(phi_grid, phi_X, 'k') % Plotting the scalar quantity at timestep 0
xlim([0 2*pi])
ylim([-1.25 1.25])

for i = 0:1000
    %%%%%!!!!!----------Convection Terms----------!!!!!%%%%%
    %% East - West %%
    Fc_EW(Ifi:Ila) = (0.5 / DeltaX) * (phiPlot(Ifi+1:Ilap)*U - phiPlot(Ifim:Ila-1)*U);

    %%%%%!!!!!----------Diffusive Terms----------!!!!!%%%%%
    %% East - West %%
    Fd_EW(Ifi:Ila) = (D / DeltaX) * (phiPlot(Ifi+1:Ilap) - 2*(phi_X(Ifi:Ila)) + phiPlot(Ifim:Ila-1));

    %%%%%!!!!!----------Scalar Quantity at New Timestep----------!!!!!%%%%%
    phiNew(Ifi:Ila) = phiPlot(Ifi:Ila) + DeltaT * (-Fc_EW(Ifi:Ila) + Fd_EW(Ifi:Ila));
    phiNew(Ifim) = phiNew(Ila);
    phiNew(Ilap) = phiNew(Ifi);

    subplot(2,1,2)
    plot(phi_grid, phiPlot, 'b:')
    xlim([0 2*pi])
    ylim([-1.5 1.5])
    drawnow

    phiPlot = phiNew;
end