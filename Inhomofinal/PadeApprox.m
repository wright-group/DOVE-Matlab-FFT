function [deltaout,lambdaout,pureout]=PadeApprox(kappa,fwhm)

% function [deltaout,lambdaout,pureout]=PadeApprox(kappa,fwhm)
% Mukamel's Pade Approximant which calculates three values for two inputs.
% units=wavenumbers

deltaout=(1+0.85*kappa+0.88*kappa^2)/(2.355+1.76*kappa)*fwhm;
lambdaout=deltaout*kappa;
pureout=deltaout^2/(lambdaout);


