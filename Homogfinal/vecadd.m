function output=vecadd(vec1,vec1r, vec2, vec2r, x,tol)

%  This function adds two vectors of unequal lengths together
%  by creating a new vector with the largest of the two vectors' dimensions
%  and summing them together by pinning them down at the point x.  x must an arbitrary value
%  in common with both vectors.
%
% This program then truncates the resulting addition so that only the subset in common
% with both vectors is allowed as output.
%
% The vectors used to define the x coordinates of each vector must be in increasing order.
%
% VARIABLES:
% vec1,vec2 -- vectors to be added together
% vec1r, vec2r -- row vector corresponding to elements along the row axis (or "x") of mat1 and mat2
% x= element in vec1r,vec2r to be matched together
% tol = error in search for x(should be < step size of vec#r)
%
%-------------------------------------------------------------------------------
% OUTPUTS:
% output = vector of added data, truncated to the common indices of both vector.
% 
%
% 5/07/01
%
%
% There are 3 parts: first, x must be translated into index values for each of
% the vectors vec1 and vec2.  This algorithm uses the "find" command with the "tol" variable.

m=length(vec1r);
p=length(vec2r);
dvec1=vec1r(2)-vec1r(1);
dvec2=vec2r(2)-vec2r(1);
tol1=dvec1/2;
tol2=dvec2/2;

[x1]=find((vec1r+tol1) >= x & x > (vec1r-tol1));
[x2]=find((vec2r+tol2) >= x & x > (vec2r-tol2));

% Next, a new vector with sides as big as necessary needs
% to be created, and the sums of the matrices are put into this vector, pinned at x

a=min(x1,x2);
b=min(m-x1,p-x2);
s=a+b;

newvec=zeros(1,s);

% left side of vector
newvec(1:a)=vec1((x1-a+1):x1)+vec2((x2-a+1):x2);
newvec(a:s)=vec1(x1:(x1+b))+vec2(x2:(x2+b));

output=newvec;
