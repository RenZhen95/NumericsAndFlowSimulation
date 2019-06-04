%Exercise02_MatlabBasics_09
clear
clc
% Filtering
% High frequencies can be removed from arbitrary signals by applying a
% low-pass filter

% Array x (integers from 0 to 300)
x = (0:300);

% Array y (random numbers between 0 and 1)
y = rand([1,301]);

[x_row x_col] = size(x);
[y_row y_col] = size(y);

% Apply a symmetric low-pass filter to create a filtered signal z
% Every value z(i) is computed from the mean value of itself and its
% neighbours
% z = 0.25 .* y(i-1) + 0.5 .* y(i) + 0.25 .* y(i+1)

% Making y_sub which has extra bounding cells at the beginning and end
y_sub = zeros(1,y_col+2);
% First and last cell of y_sub has first and last values of y
y_sub(1) = y(1);
y_sub(y_col+2) = y(y_col);

% Add remaining of y into middle of y_sub
for k=2:y_col+1
    y_sub(k) = y(k-1);
end

for i=2:y_col
    z(i) = 0.25*y_sub(i-1) + 0.5*y_sub(i) + 0.25*y_sub(i+1);
end
