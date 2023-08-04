function output=expandcol(A,n)

% expands a column vector into a matrix by stacking down n times.
% The net matrix is therefor an m x n, where m is the number
% of elements in the vector.

output=A*ones(1,n);
