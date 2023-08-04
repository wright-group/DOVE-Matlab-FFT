function output=p1wtransform(matrix)

% A transforming program that transforms a matrix with rows=wcb and cols=wca in the
% following manner:

% wcb=wca-wba

% wcb rows are converted into wba, and wca columns are kept wca.

[m,n,z]=size(matrix);
% m=rows
% n=cols
newmat=zeros(m+n-1,n,z);
for p=1:m
   for q=1:n
      newmat(q-p+m,q,:)=matrix(p,q,:);
   end
end
output=newmat;
