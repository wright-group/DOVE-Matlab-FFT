function output=FWHM_to_Gaussvar(intfwhm);

% function output=FWHM_to_Gaussvar(intfwhm);
% converts Gaussian electric fields' intensity fwhm in time into a
% variance.

output=1/1.177*intfwhm;

