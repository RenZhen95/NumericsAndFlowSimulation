function [FdX] = calcFluxDif(phi_XY, deltaX, D)
    % Calculates the diffusive fluxes of a conserved quantity phi_XY 
    % in x and y direction over the e and n surfaces of each cell (Over the cell surfaces!!!)
        %%!! Important Note !!%%
        % This function calculates the diffusive flux over the cell surfaces (e and w)
        % Do not confuse this with the sum of diffusive term over the total cell!!

    % Dimension/Length of the scalar field
    Ima = Length(phi_XY);

    %% Initialising the Convection Term Matrices %%
    FdX = zeros(1, Ima-1);
    
    %%%%%!!!!!----------Calculating flux terms in x and y direction----------!!!!!%%%%%
    %% Using Central Differencing %%
    % Assume the scalar field phi_XY already contains the density rho

    %% Calculating the diffusive fluxes in the x direction %%
    FdX(1:Ima-1) = D * deltaX .* (phi_XY(2:Ima) - phi_XY(1:Ima-1));
end