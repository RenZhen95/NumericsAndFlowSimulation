%Exercise02_MatlabBasics_03_Dice
clear
clc
% Creates random number from 1 to 6
dice_1 = rand(1)*6;
dice_2 = rand(1)*6;

% Rounds the number up
Value1 = ceil(dice_1);
Value2 = ceil(dice_2);

% If dice show the same score, total score is doubled
if (Value1 == Value2)
    Value_Tot = (Value1 + Value2)*2;
else
    Value_Tot = Value1 + Value2;
end

fprintf('You rolled %d and %d\n', Value1, Value2);
fprintf('The total score is %d\n', Value_Tot);
