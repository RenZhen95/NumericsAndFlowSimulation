function [divPred] = divMom1D(rhouP, Dx)
    %%%%%!!!!!---------------------------------------!!!!!%%%%%
    %% Projection Method
    %%%%%!!!!!---------------------------------------!!!!!%%%%%
    % -> Calculates the resulting divergence field for a given momentum prediction field (CDS)
    % -> The Idea:
    %	 -> Momentum is first estimated and pressure term is simply ignored here
    %	 -> The resulting momentum is not divergence free
    %	 -> This functions serves to calculate the divergence field 
    
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

    % Initialising divPred
    divPred = zeros(1, Ilap);
    
    % Calculating the divergence field of the momentum prediction
    divPred(Ifi:Ila) = (rhouP(Ifip:Ilap) - rhouP(Ifim:Ilam)) ./ (2 * Dx);
end