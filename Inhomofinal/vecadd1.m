function [vecout,wvecout]=vecadd1(vec1,vec2,wvec1,wvec2)

% function [vecout,wvecout]=vecadd1(vec1,vec2,wvec1,wvec2)

%  This function creates an output vector for graphing based on vector information
% of the two vectors. A final vector is created such that, based on the
% frequencies in wvec1, and wvec2, is the sum of vec1 and vec2.
%
% The wvectors must be in increasing order, and both wvec1 and wvec2 must have the
% same spacing. Also the length of vec1 must be that of wvec1, and vec2 be
% the length of wvec2.
%
%KAM 3/4/04
%-------------------------------------------------------------------------------

% There are 3 parts: first, x must be translated into index values  for each of
% the vectors vec1 and vec2.  This algorithm uses the "find" command with the "tol" variable.

m=length(vec1);
p=length(vec2);
dw=dwvec1(2)-dwvec1(1);
tol=dw/2;

% First, a new wvec (wvecout) must be created that clumps both vec1 and
% vec2 together.
wvec1beg=wvec1(1);
wvec1end=wvec1(m);
wvec2beg=wvec2(1);
wvec2end=wvec2(p);

if (wvec1beg < wvec2beg)
    if (wvec1end > wvec2end)
        wvecout=(wvec1beg:dw:wvec1end);
    else
        wvecout=(wvec1beg:dw:wvec2end);
    end
else
    if (wvec2end > wvec1end)
        wvecout=(wvec2beg:dw:wvec2end);
    else
        wvecout=(wvec2beg:dw:wvec1end);
    end
end

q=length(wvecout);
vec3=zeros(1,q);
vec4=zeros(1,q);

[x1beg]=find((wvecout+tol) >= wvec1beg & wvec1beg > (wvecout-tol));
[x2beg]=find((wvecout+tol) >= wvec2beg & wvec2beg > (wvecout-tol));
[x1end]=find((wvecout+tol) >= wvec1end & wvec1end > (wvecout-tol));
[x2end]=find((wvecout+tol) >= wvec2end & wvec2end > (wvecout-tol));

vec3(x1beg:x1end)=vec1;
vec4(x2beg:x2end)=vec2;

vecout=vec3+vec4;
