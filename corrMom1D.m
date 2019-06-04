function [rhou] = corrMom1D(deltaT, Delta, P, rhouP)
    %%%%%!!!!!---------------------------------------!!!!!%%%%%
    %% Momentum Correction
    %%%%%!!!!!---------------------------------------!!!!!%%%%%
    % Using CDS for the pressure gradient
    % Number of cells from the input momentum including the ghost cells
    Ilap = length(rhouP); % Also index of the end ghost cell

    % Number of ghost layers
    nG = 1;

    %%%%%!!!!!---------------------------------------!!!!!%%%%%
    %% Mesh Naming (x)
    %%%%%!!!!!---------------------------------------!!!!!%%%%%
    Ima = Ilap - 2*nG;        % Number of x computational cells!!!
    Ifim = 1;       % Index of ghost cell left of x
    Ifi = nG + 1;   % First computational cell in x-direction
    Ifip = Ifi + 1; % Second computational cell
    Ila = Ima + nG; % Last computational cell in x-direction
    Ilam = Ila - 1; % Computational cell behind the last one

    % Initialsing the corrected momentum field
    rhou = zeros(1, Ilap);

    % Correcting the momentum field with the pressure gradient
    rhou(Ifi:Ila) = rhouP(Ifi:Ila) - (deltaT/(2*Delta)) .* (P(Ifip:Ilap) - P(Ifim:Ilam));
    % Note to self: DeltaX is 2*Delta because the distance between P_east and P_west are 2 grids apart
end