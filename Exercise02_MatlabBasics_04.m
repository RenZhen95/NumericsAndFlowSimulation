%Exercise02_MatlabBasics_04
clear
clc
for i=1:10
    fprintf('Hello World!\n');
end

% Write a script that writes the numbers from 1 to 10 to an array x
% Then assigns the squares to an array y
% And finally plots the mathematical function

x=[1:1:10]
y=x.^2
plot(x,y)