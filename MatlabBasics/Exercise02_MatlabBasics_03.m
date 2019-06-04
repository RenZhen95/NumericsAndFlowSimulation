%Exercise02_MatlabBasics_03
clear
clc

firstArray(1)=11;
firstArray(2)=12;
firstArray(3)=13;
firstArray(4)=14;
firstArray(5)=15;
firstArray(6)=16;

for i=1:6
    firstArray_v2(i) = 11 + (i-1)*1;
end

disp(firstArray_v2)

secondArray=[21, 22, 23, 24, 25, 26];
disp(secondArray)
disp(secondArray(2))
disp(size(secondArray))

plot(firstArray,secondArray)
%disp(firstArray)