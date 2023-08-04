function wvecout=vecadd3(wvec1,wvec2)

% function wvecout=vecadd3(wvec1,wvec2)

%  This function creates an output vector for graphing based on vector information
% of the two vectors. A final vector is created expanded to wvec1 and
% wvec2's total dim.
%
% The wvectors must be in increasing order, and both wvec1 and wvec2 must have the
% same spacing. 
%
%KAM 3/4/04
%-------------------------------------------------------------------------------

% There are 3 parts: first, x must be translated into index values  for each of
% the vectors vec1 and vec2.  This algorithm uses the "find" command with the "tol" variable.

m=length(wvec1);
p=length(wvec2);
dw=wvec1(2)-wvec1(1);
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


