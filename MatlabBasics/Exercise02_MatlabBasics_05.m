%Exercise02_MatlabBasics_05
clear
clc
% Write a program that computes the factorial n! by multiplying each
% integer from 1 to n with the previous product
% Use while loop

a = input('Input  value of factorial: ');
count = 1;
output = 1;

if a == 0
    fprintf('The factorial of %d is %d\n', a, output);
else
    while (count <= a)
        output = output * count;
        count = count + 1;
    end
    fprintf('The factorial of %d is %d\n', a, output);
end