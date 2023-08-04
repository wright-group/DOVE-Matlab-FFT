function output=Nyq_and_res_to_t1t2t3(Nyqw1w2,resw1w2)

% converts input Nyquist and resolution data into a time vector on bounds 0 to
% Tfinal, with total data points N.

c = 3e10;

deltat=1/(2*c*Nyqw1w2);
N=1/(deltat*c*resw1w2);
radix=ceil(log2(N));
Nneww1=2^(radix); % FFT round up

Ttotnew=(Nneww1-1)*deltat; %round up helps resolution, not Nyquist
resneww1=1/(deltat*c*Nneww1); % these lines determine actual resolution
                               % of final output spectrum;  remove
                               % semicolon to display these during
                               % calculation.
Nneww1;
output=(0:deltat:Ttotnew);

