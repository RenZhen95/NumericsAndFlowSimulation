%Exercise02_MatlabBasics_06
clear
clc
% Write a function that accpets the radius of a sphere and returns the
% volume
r = input('Input the radium of a sphere in [m]: ');
V = 4/3*pi*r^3;
fprintf('The volume of the sphere is %f\n', V);
