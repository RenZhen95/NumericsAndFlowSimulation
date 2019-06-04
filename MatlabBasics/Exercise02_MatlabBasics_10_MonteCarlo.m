%Exercise02_MatlabBasics_10_MonteCarlo
clear
clc
% Using the MonteCarlo method to determine the value of pi
% A method based on random numbers

% Area of a circle of radius r is simply pi
% Create N random points, every N has a random x and y coordinate

% Only consider random points where coordinates are in range of [-1, 1]
% inside a square

N = input('Input number of N: ')
% Generate  values from the uniform distribution on the interval (a,b)

% N random points, x and y coordinates
r = -1 + (1-(-1)).*rand(N,2);

% To compute pi, multiply area of square with number of points inside the
% circle, divided by overall number of points
% Points are in the circle x^2 + y^2 < 1

x = r(:,1);
y = r(:,2);

% Number of points inside the circle
Ni = 0;

for i=1:N
    if x(i).^2 + y(i).^2 < 1
        Ni = Ni + 1;
        plot(x(i),y(i),'r*')
        hold on
    else
        plot(x(i),y(i),'b*')
    end
end

% Area of circle, 2 * 2 = 4
pi = Ni/N*4;
fprintf('The value of pi is %f\n',pi);

