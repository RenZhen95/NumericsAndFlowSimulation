function [FcX, FcY] = calcFluxConTVD_SMART(u, v, phi_XY, deltaX)
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
    %% Using TVD SMART Scheme %%
    % Assume the scalar field phi_XY already contains the density rho
    %% Calculating the convective fluxes in the y direction %%
    r_y = zeros(Jma-2,Ima);
    B_y = zeros(Jma-2,Ima);
    r_y(1:Jma-2,:) = (phi_XY(3:Jma,:) - phi_XY(2:Jma-1,:)) ./ (phi_XY(2:Jma-1,:) - phi_XY(1:Jma-2,:));

    min_y = min(2.*r_y(1:Jma-2,:), 0.75.*r_y(1:Jma-2,:)+0.25);
    B_y(1:Jma-2,:) = max(0, min(min_y, 4)); 
    % The convection flux term in the y direction
    FcY(2:Jma-1,:) = deltaX^2 .* v(2:Jma-1,:) .* ... 
                     (phi_XY(2:Jma-1,:) + 0.5.*B_y(1:Jma-2,:).*(phi_XY(2:Jma-1,:) - phi_XY(1:Jma-2,:)));
    FcY(1,:) = FcY(2,:);

    %% Calculating the convective fluxes in the x direction %%
    r_x = zeros(Jma,Ima-2);
    B_x = zeros(Jma,Ima-2);
    r_x(:,1:Ima-2) = (phi_XY(:,3:Ima) - phi_XY(:,2:Ima-1)) ./ (phi_XY(:,2:Ima-1) - phi_XY(:,1:Ima-2));

    min_x = min(2.*r_x(:,1:Ima-2), 0.75.*r_x(:,1:Ima-2)+0.25);
    B_x(:,1:Ima-2) = 0;%max(0, min(min_x, 4)); 
    % The convection flux term in the x direction
    FcX(:,2:Ima-1) = deltaX^2 .* u(:,2:Ima-1) .* ... 
                     (phi_XY(:,2:Ima-1) + 0.5.*B_x(:,1:Ima-2).*(phi_XY(:,2:Ima-1) - phi_XY(:,1:Ima-2)));
    FcX(:,1) = FcX(:,2);
end