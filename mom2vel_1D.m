function [velu] = mom2vel_1D(rhou)
    % Write a Matlab function mom2vel that calculates the velocity fields (in 2D) u and v on the cell surfaces
    % from the momentum fields rhou and rhov that are stored on the cell centre and from a constant density rho
    
    % Number of ghost cells
    nG = 1;
    
    % Dimension/Length of the momentum field in x-direction
    Ima = length(rhou);

    % Initialising the velu and velv velocity fields
    velu = zeros(1, Ima-1);
    
    %% Constants %%
    rho = 1.225; % Constant density of air

    %%%%%!!!!!----------Calculating velocity fields on cell surfaces in x and y direction----------!!!!!%%%%%
    % Using linear interpolation to obtain the velocities on the cell surfaces
    % Note: Divide momentum by density to obtain veloctiy!!!
    % Also assuming the grids are equidistant and symmetrical, width of cells wouldn't quite matter

    % u-Velocity Field (Boundary conditions, taking value of neighbouring cell)
    velu(:) = (0.5 / rho) .* (rhou(1:Ima-1) + rhou(2:Ima));
end