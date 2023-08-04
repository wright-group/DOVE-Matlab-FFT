function output=p2wtransform(matrix)

% A transforming program that transforms a matrix with rows=wcb and cols=wba in the
% following manner:

% wcb=wca-wba

% wcb rows are converted into wba, and wba columns are converted to wca.

[m,n,z]=size(matrix);
% m=rows
% n=cols
newmat=zeros(n,m+n-1,z);
for p=1:m
   for q=1:n
      newmat(q,p+q-1,:)=matrix(p,q,:);
   end
end
output=newmat;
