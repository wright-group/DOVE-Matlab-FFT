function output=BGd(Params,Eflag,t)
%
% background subroutine 
% 
% ----------------------------------------------------------
% This routine performs a background, "three-laser cross-correlation"
% computation.


I1FWHM=Params.fields.I1FWHM*1E-12;
I2FWHM=Params.fields.I2FWHM*1E-12;
I3FWHM=Params.fields.I3FWHM*1E-12;
T12=Params.fields.T21*1E-12;
T23=Params.fields.T32*1E-12;

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

% Electric Field 1,2,3's envelopes are created as a function of t in all dimensions
E1arg=t+T12+T23;
E1=exp(-E1arg.^2./(sigma1.^2)); % normalization not needed
E2arg=t+T23;
E2=exp(-E2arg.^2./(sigma2.^2));
E3arg=t;
E3=exp(-E3arg.^2./(sigma3.^2));
pdgout=E1.*E2.*E3;

output=pdgout; 