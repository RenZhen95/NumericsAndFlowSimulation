function [FcX, FcY] = calcFluxConCDS(u, v, phi_XY, deltaX)
    % Author: 			Liaw Jin Cheng
    % Email: 			jin.liaw@stud.uni-due.de
    % Matriculation: 	3025341
    
    % Calculates the convective fluxes of a conserved quantity phi_XY 
    % in x and y direction over the e and n surfaces of each cell
    %%!! Important Note !!%%
        % This function calculates the convective flux over the cell surfaces (e and w)
        % Do not confuse this with the sum of convective term over the total cell!!
    % The velocity fields u and v are calculated earlier with the function mom2vel
    
    % Dimension/Length of the scalar field
    [Jma, Ima] = size(phi_XY);

    %% Initialising the Convection Term Matrices %%
    FcY = zeros(Jma, Ima);
    FcX = zeros(Jma, Ima);

    %%%%%!!!!!----------Calculating flux terms in x and y direction----------!!!!!%%%%%
    %% Using Central Differencing %%
    % Assume the scalar field phi_XY already contains the density rho

    %% Calculating the convective fluxes in the y direction %%
    FcY(1:Jma-1,:) = 0.5 * deltaX^2 * v(1:Jma-1,:) .* (phi_XY(1:Jma-1,:) + phi_XY(2:Jma,:));

    %% Calculating the convective fluxes in the x direction %%
    FcX(:,1:Ima-1) = 0.5 * deltaX^2 * u(:,1:Ima-1) .* (phi_XY(:,1:Ima-1) + phi_XY(:,2:Ima));
end