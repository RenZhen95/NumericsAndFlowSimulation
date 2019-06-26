clear
clc
N = 10;
A = 10*rand(10,10);
B = zeros(N-1,N-1);
for i = 1:N-1
    for j = 1:N-1
        B(i,j) = bilinearInterpolation(A(i,j+1), A(i,j), A(i+1,j), A(i+1,j+1), 0.5, 0.5, 1, 1);
    end
end
X = linspace(0,10,10);
Y = linspace(0,10,10);

x = linspace(0,10,9);
y = linspace(0,10,9);

subplot(1,2,1), surf(X,Y,A)
subplot(1,2,2), surf(x,y,B)