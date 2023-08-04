function output=SIVEw2d(Params,Eflag,t1t2vec,t)
%
%
% SIVE(w2) subroutine using Mukamel equations
% ----------------------------------------------------------
% This routine performs a full SIVE w2 1d-integral using
% time-domain equations.  
%
% See 'DOVEcmpt.m' for a description of the input Params cluster.
%
%
% NOTE:  iffts are used for positive resonances (wcg,wcb,wag), and must be multiplied by
%			N*dt, where N is the total	number of points in the final ifft.  Negative resonances 
%  		(wgb) use fft for this code, and are only multiplied by dt, due to Matlab's
%			syntax of the fft/ifft functions.
%
%			Also, note that each fft is multiplied by i/hbar.  
%        
% 
% KAM 3/5/04
% ------------------------------------------------
%

%wbg=Params.solute.freqs.wbg;

Gbg=Params.solute.popgammas.Gbg*2*pi*3E10;

lambdab=Params.solute.biglambdas.lbg*2*pi*3E10; 

kappab=Params.solute.kappas.kbg;

I1FWHM=Params.fields.I1FWHM*1E-12;
I2FWHM=Params.fields.I2FWHM*1E-12;
I3FWHM=Params.fields.I3FWHM*1E-12;
T12=Params.fields.T21*1E-12;
T23=Params.fields.T32*1E-12;
if Eflag(1)==0
    sigma1=FWHM_to_Gaussvar(I1FWHM);   
else
    sigma1=I1FWHM;
end
if Eflag(3)==0
    sigma2=FWHM_to_Gaussvar(I2FWHM);
else
    sigma2=I2FWHM;
end
sigma3=FWHM_to_Gaussvar(I3FWHM);

hbar=1.0546E-34;
Tfin=t1t2vec(length(t1t2vec));
del=t1t2vec(2)-t1t2vec(1);

t1=t1t2vec; 
E1arg=t+T12+T23;
E1=exp(-E1arg.^2./(sigma2.^2)); % normalization not needed
E2arg=t-t1+T23;
E2=exp(-E2arg.^2./(sigma1.^2));
E3arg=t;
E3=exp(-E3arg.^2./(sigma3.^2));

E1E2E3=E1.*E2.*E3;
GdSIVEw2=1.*exp(-Gbg.*t1).*(exp(-0.5.*(2.*1/kappab^2.*exp(-lambdab.*(t1))+lambdab.*(t1)-1)));
ht1=E1E2E3.*GdSIVEw2;
pbg1=fft(ht1);
pbg1trans=fftshift(pbg1)*(i*del/hbar); % see NOTE
output=pbg1trans;

