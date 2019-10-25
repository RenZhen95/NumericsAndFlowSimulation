function phi = bilinearInterpolation(phiNW, phiNE, phiSW, phiSE, x, y, Dx, Dy)
    % Bi-linear interpolation to any point x,y within a rectangle of width Dx and height Dy
    % The corner values phiNW, phiNE, phiSE, phiSW are passed as an argument
    % The coordinates x and y are passed as an argument
    % The dimensions Dx and Dy are passed as an argument
    
    % Bilinear interpolation based on two subsequent linear interpolations
    % Assumption, everything takes place in first quadrant

    % Interpolating point N and S 
    dxe = Dx - x;
    dxw = x;
    phiN = (dxe / Dx) * phiNW + (dxw / Dx) * phiNE;
    phiS = (dxe / Dx) * phiSW + (dxw / Dx) * phiSE;

    % Interpolation P
    dyn = Dy - y;
    dys = y;
    phi = (dyn / Dy) * phiS + (dys / Dy) * phiN;
end