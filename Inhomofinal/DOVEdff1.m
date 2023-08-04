function output=DOVEdff1(Params,Eflag,t1t2vec,t)
%
% DOVE-IR path 1 subroutine using Mukamel equations
%
% ----------------------------------------------------------
% This routine performs a full DOVE-IR path 1 2d-integral using
% time-domain equations.  This routine treates c and b as fundamentals
% instead of the typical combination band for c.  In this 'test' routine,
% lambdab in the code is really lambdac, and lambdaa in the code is really
% lambdab, as well for kappa, and eta correlates c and b.
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
%wcg=Params.solute.freqs.wcg;
%wbg=Params.solute.freqs.wbg;

Gcg=Params.solute.popgammas.Gcg*2*pi*3E10;
Gcb=Params.solute.popgammas.Gcb*2*pi*3E10;

lambdab=Params.solute.biglambdas.lbg*2*pi*3E10;
lambdaa=Params.solute.biglambdas.lag*2*pi*3E10; 
kappab=Params.solute.kappas.kbg;
kappaa=Params.solute.kappas.kag;
etaab=Params.solute.correlations.eta;

%wcb=wcg-wbg;

I1FWHM=Params.fields.I1FWHM*1E-12;
I2FWHM=Params.fields.I2FWHM*1E-12;
I3FWHM=Params.fields.I3FWHM*1E-12;
T2=Params.fields.T21*1E-12;
T1=Params.fields.T32*1E-12;

%-----------------
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

hbar=1.0546E-34; %erg sec form!!!
Tfin=t1t2vec(length(t1t2vec));
del=t1t2vec(2)-t1t2vec(1);

[t1,t2]=meshgrid(t1t2vec,t1t2vec);
E1arg=t-t1-t2+T1+T2;
E1=exp(-E1arg.^2./(sigma1.^2)); %normalization not needed
clear('E1arg');

E2arg=t-t2+T2;
E2=exp(-E2arg.^2./(sigma2.^2));
clear('E2arg');

E3arg=t;
E3=exp(-E3arg.^2./(sigma3.^2));
clear('E3arg');

E1E2E3=E1.*E2.*E3;

GD1t1t2=exp(-0.5*((2.*etaab.*1/kappaa.*1/kappab.*(exp(-lambdaa.*t1)+lambdaa.*t1-1)...
    +(2.*1/kappaa^2.*(exp(-lambdaa.*t2)+lambdaa.*t2-1)))...
    +(-2.*etaab.*1/kappaa.*1/kappab.*(exp(-lambdaa.*t2)+lambdaa.*t2-1))...
    +(-2.*etaab.*1/kappaa.*1/kappab.*(exp(-lambdaa.*(t1+t2))+lambdaa.*(t1+t2)-1))...
    +(2.*1/kappab^2.*(exp(-lambdab.*(t1+t2))+lambdab.*(t1+t2)-1))))...
    .*exp(-Gcg.*t1).*exp(-Gcb.*t2);

ht1t2=E1E2E3.*GD1t1t2;
clear('E1E2E3');
clear('GD1t1t2');
pcg1=ifft(ht1t2,[],2);
clear('ht1t2');
pcb1=ifft(pcg1,[],1);
clear('pcg1');

pcb1trans=fftshift(pcb1).*(i*Tfin/hbar).*(i*Tfin/hbar);
output=pcb1trans; 
