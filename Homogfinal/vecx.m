function outputx=vecx(vec1r,vec2r, x,tol)

%  This function creates an output x vector for graphing based on vector information
% of the two vectors that will be added together using "vecadd", a separate program that adds
% two vectors together by fixing at a common point
%
% This program then truncates the resulting addition so that only the subset in common
% with both vectors is allowed as output.
%
% The vectors must be in increasing order.
%
% VARIABLES:
% 
% vec1r, vec2r -- row vector corresponding to elements along the row axis (or "x") of vec1 and vec2 used in the vecadd program
% x= element in vec1r,vec2r to be matched together
% tol = error in search for r & c (should be < step size of vec#r and vec#c)
%
%KAM 1/7/00
%-------------------------------------------------------------------------------
% OUTPUTS:
% outputx = xaxis data in vector form for graphing

% There are 3 parts: first, x must be translated into index values  for each of
% the vectors vec1 and vec2.  This algorithm uses the "find" command with the "tol" variable.

m=length(vec1r);
p=length(vec2r);
dvec1=vec1r(2)-vec1r(1);
dvec2=vec2r(2)-vec2r(1);
tol1=dvec1/2;
tol2=dvec2/2;

[x1]=find((vec1r+tol1) >= x & x > (vec1r-tol1));
[x2]=find((vec2r+tol2) >= x & x > (vec2r-tol2));

% Next, a new matrix with sides as big as necessary needs
% to be created, and the sums of the matrices are put into this matrix, pinned at x,y

a=min(x1,x2);
b=min(m-x1,p-x2);

s=a+b;



if (a==x1)
   if b==m-x1
      vecrout=vec1r;
   else
      vecrout=vec1r(1:s);
   end
else
   if b==m-x1
      vecrout=vec2r(1:s);
   else
      vecrout=vec2r;
   end
end

outputx=vecrout;
