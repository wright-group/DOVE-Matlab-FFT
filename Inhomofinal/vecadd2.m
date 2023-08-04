function vecout=vecadd2(vec1,wvec1,vec2,wvec2)

% function vecout=vecadd2(vec1,vec2,wvec1,wvec2)

%  This function creates an output vector for graphing based on vector information
% of the two vectors.  Unlike vecadd1, this addition program does NOT expand vecout
% to cover the whole length of wvec1 and wvec2.  Instead, it only adds together elements
% that fit on vec1's length.  As a result, the output vecout is always the length of
% vec1 and is always for the same frequencies as wvec1.
%
% The wvectors must be in increasing order, and both wvec1 and wvec2 must have the
% same spacing. Also the length of vec1 must be that of wvec1, and vec2 be
% the length of wvec2.
%
%KAM 3/4/04
%-------------------------------------------------------------------------------

% There are 3 parts: first, x must be translated into index values  for each of
% the vectors vec1 and vec2.  This algorithm uses the "find" command with the "tol" variable.

m=length(wvec1);
p=length(wvec2);
dw=wvec1(2)-wvec1(1);
tol=dw/2;

wvec1beg=wvec1(1);
wvec1end=wvec1(m);
wvec2beg=wvec2(1);
wvec2end=wvec2(p);

q=length(vec1);
r=length(vec2);
vec3=zeros(1,q);

if (wvec2beg >= wvec1beg)
    if (wvec2end <= wvec1end)
        vec3begind=find((wvec1+tol) >= wvec2beg & wvec2beg > (wvec1-tol));
        vec3endind=find((wvec1+tol) >= wvec2end & wvec2end > (wvec1-tol));
        dummy=vec3(vec3begind:vec3endind);
        lendummy=length(dummy);
        if (r<lendummy)
            vec2(r+1:lendummy)=0;
        end
        if (r>lendummy)
            vec2(lendummy:r)=[];
        end
        vec3(vec3begind:vec3endind)=vec2;
        vecout=vec3+vec1;
    else
        vec3begind=find((wvec1+tol) >= wvec2beg & wvec2beg > (wvec1-tol));
        vec3endind=find((wvec2+tol) >= wvec1end & wvec1end > (wvec2-tol));
        vec3(vec3begind:length(vec3))=vec2(1:vec3endind);
        vecout=vec3+vec1;
    end
else
    if (wvec2end >= wvec1end)
        vec3begind=find((wvec2+tol) >= wvec1beg & wvec1beg > (wvec2-tol));
        vec3endind=find((wvec2+tol) >= wvec1end & wvec1end > (wvec2-tol));
        vec3=vec2(vec3begind:vec3endind);
        vecout=vec3+vec1;
    else
        vec3begind=find((wvec2+tol) >= wvec1beg & wvec1beg > (wvec2-tol));
        vec3endind=find((wvec1+tol) >= wvec2end & wvec2end > (wvec2-tol));
        vec3(1:vec3endind)=vec2(vec3begind:length(vec2));
        vecout=vec3+vec1;
    end
end

        
