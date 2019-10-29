function P = poissonSolver1D(deltaT, Delta, divPred, P)
    %%%%%!!!!!---------------------------------------!!!!!%%%%%
    %% Poisson Solver
    %%%%%!!!!!---------------------------------------!!!!!%%%%%
    % -> https://en.wikipedia.org/wiki/Poisson%27s_equation
    % -> The Poisson Eq is basically the "second derivative divergence" of a quantity
    % -> The Laplace operator (second derivative divergence, in my own terms) is discretized with CDS

    % The RHS of the Poisson Equation (the divergence field divided by deltaT)
    RHS = divPred ./ deltaT;

    % Number of cells from the input momentum including the ghost cells
    Ilap = length(RHS); % Also index of the end ghost cell

    % Number of ghost layers
    nG = 1;
    
    %%%%%!!!!!---------------------------------------!!!!!%%%%%
    %% Mesh Naming (x)
    %%%%%!!!!!---------------------------------------!!!!!%%%%%
    Ima = Ilap - 2*nG;      % Number of x computational cells!!!
    Ifim = 1;               % Index of ghost cell left of x
    Ifi = nG + 1;           % First computational cell in x-direction
    Ifip = Ifi + 1;         % Second computational cell
    Ila = Ima + nG;         % Last computational cell in x-direction
    Ilam = Ila - 1;         % Computational cell behind the last one

    %%%%%!!!!!---------------------------------------!!!!!%%%%%
    %% Solving the Poisson Equation (P Correction) iteratively via the Jacobi Method 
    %%%%%!!!!!---------------------------------------!!!!!%%%%%
    % Counter
    nIt = 0;
    % Error
    e = 5;

    while(nIt < 75600) && (e > 0.0001)
        P_old = P;

        % Computing the pressure in the center cell
        P(Ifi:Ila) = 0.5 .* (P_old(Ifim:Ilam) + P_old(Ifip:Ilap) - RHS(Ifi:Ila) .* Delta^2);

        % Boundary Conditions
        % Zero gradient BC at the inlet. Hence pressure at ghost cell equals that of first computational cell
        P(Ifim) = P(Ifi);

        % Fix pressure to 0 at the outlet
        P(Ilap) = -P(Ila);
        
        % Error 
        e = max(abs(P(Ifi:Ila) - P_old(Ifi:Ila)));

        % Iterator/Counter
        nIt = nIt + 1;
    end
end