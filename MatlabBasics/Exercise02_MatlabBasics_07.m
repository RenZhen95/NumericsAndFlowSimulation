%Exercise02_MatlabBasics_07
clear
clc
% Given are the following matrices
A = [1 2 3;4 5 6;7 8 9];
B = [0.4667 -0.3333 0.1333;
     -0.0333 0.6667 0.3667;
     -0.3333 -0.3333 0.3333];
 
% Matrix multiplication
C = A * B;
fprintf('Matrix multiplication yields\n')
disp(C)

% Multiply the arrays elementwise
D = A .* B;
fprintf('Elementwise multiplication yields\n')
disp(D)

% Inverting Matrices
E = inv(A);
E_2 = inv(B);
fprintf('Inverse of Matrix A\n')
disp(E)
fprintf('Inverse of Matrix B\n')
disp(E_2)

% Calculate the determinantes
% The built-in determinant function of Matlab is subjected of unstability
% Determinant of A should be 0, but it Matlab is unable to do so
det1 = det(A);
det2 = det(B);
fprintf('Determinant of A\n')
disp(det1)
fprintf('Determinant of B\n')
disp(det2)

% Determinant of A using the basic mathematics
detOfA = A(1,1)*(A(2,2)*A(3,3)-A(3,2)*A(2,3)) - ...
         A(2,1)*(A(1,2)*A(3,3)-A(3,2)*A(1,3)) + ...
         A(3,1)*(A(1,2)*A(2,3)-A(2,2)*A(1,3));
fprintf('The determinant of A using basic mathematics\n')
disp(detOfA)

