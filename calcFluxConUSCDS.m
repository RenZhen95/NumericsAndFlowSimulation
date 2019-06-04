function [FcX, FcY] = calcFluxConUSCDS(u, v, phi_XY, deltaX, deltaT)
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
    FcY = zeros(Jma-1, Ima);
    FcX = zeros(Jma, Ima-1);

    %%%%%!!!!!----------Calculating flux terms in x and y direction----------!!!!!%%%%%
    %% Using Upwind-Shifted CDS %%
    % Assume the scalar field phi_XY already contains the density rho

    %% Calculating the convective fluxes in the y direction %%
    % The upwind shifted CDS phi in the y direction
    phi_ys(1:Jma-1,:) = (1 + (v(1:Jma-1,:) * deltaT / deltaX)) .* (phi_XY(1:Jma-1,:)) / 2 + ...
                        (1 - (v(1:Jma-1,:) * deltaT / deltaX)) .* (phi_XY(2:Jma,:)) / 2; 
    % The convection flux term in the y direction
    FcY(1:Jma-1,:) = deltaX^2 * v(1:Jma-1,:) .* phi_ys(1:Jma-1,:);

    %% Calculating the convective fluxes in the x direction %%
    % The upwind shifted CDS phi in the x direction
    phi_xs(:,1:Ima-1) = (1 + (u(:,1:Ima-1) * deltaT / deltaX)) .* (phi_XY(:,1:Ima-1)) / 2 + ...
                        (1 - (u(:,1:Ima-1) * deltaT / deltaX)) .* (phi_XY(:,2:Ima)) / 2; 
    % The convection flux term in the x direction
    FcX(:,1:Ima-1) = deltaX^2 * u(:,1:Ima-1) .* phi_xs(:,1:Ima-1);
end