function output=expandrow(A,n)

% expands a row vector into a matrix by stacking down n times.
% The net matrix is therefor an n x m, where m is the number
% of elements in the vector.

output=ones(n,1)*A;
