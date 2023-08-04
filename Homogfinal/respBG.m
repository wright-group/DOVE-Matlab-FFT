function output=respBG(params,t)
%
% background subroutine 
% 
% ----------------------------------------------------------
% This routine performs a background, "three-laser cross-correlation"
% computation.
%
% Units:
% time=picoseconds
% frequency=wavenumbers
%
% Variables:
%  
% the vector 'params' contains the following parameters, in this order:
%
% (parameters with an 'X' in front are unused in this subroutine)
%
% 	T2  	=	time between w3 and w2 (t3-t2) based on delay positions
% 	T1		=	time between w2 and w1 (t2-t1) based on delay positions
% 	sigma1		= temporal FWHM (in psec) of the laser pulse 1, using the form 
%				     E=-t^2/(2*sigma1)^2
%	sigma2 = " "		"	pulse 2
% 	sigma3 = " "    "  pulse 3
%X A1, A2, A3, Acars, Acarsref, Bg = scaling factors for each FWM process in the order:
%				DOVE-IR1, DOVE-IR2, DOVE-Raman, CARS, CARS of reference, background
%				
%X  Gcg,Gcb,Gbg,Gag	= Homogeneous linewidths (HWHM) for the coherences set up by pulses 1,2,and 3,
%			
%X wcg,wbg,wag =  The ringing frequencies of the respective coherences set up by pulses 1,2, and 3.
% 			
%X Ttot = estimated time at which the output coherence will have approximately decayed to zero
%X del= 'dt' -- that is, the step size for the integral (smaller is better, but longer to compute)
%
%X wagref = frequency of CARS reference position in Raman space.
%X Gagref = homogeneous linewidth (HWHM) of CARS reference. 
%X theta21 = phasematching angle of w2 with respect to w1.
%X theta31 = phasematching angle of w3 with respect to w1.  Positive value means on the opposite
% 				side of w1 with respect to w2.
%X ls = thickness of sample (cm)
%X lfw= thickness of front window (cm)
%X	wagalt = frequency of alternate CARS feature
%X Gagalt = homogeneous linewidth (HWHM) of alternate CARS feature 
%X Acarsalt= scaling factor of alternate CARS feature
%X Asive = SIVE scaling factor for sample's main absorbing feature
%X Imbg = imaginary background additional term (should be zero)
%
% t = see Mukamel equations
%
%
% KAM 6/11/02
% ------------------------------------------------
%
% The vector 'params' is now broken up.  Unit conversion takes place.

T2=params(1)*1E-12;
T1=params(2)*1E-12;
sigma1=params(3)*1E-12;  % The factor 0.601 takes the crosscorrelation FWHM into true intensity FWHM variance
sigma2=params(4)*1E-12;
sigma3=params(5)*1E-12;
%Bg=params(11);

% Electric Field 1,2,3's envelopes are created as a function of t in all dimensions
E1arg=t+T1+T2;
E1=exp(-E1arg.^2./(2*sigma1.^2)); % normalization not needed
E2arg=t+T2;
E2=exp(-E2arg.^2./(2*sigma2.^2));
E3arg=t;
E3=exp(-E3arg.^2./(2*sigma3.^2));
pdgout=E1*E2*E3;

output=pdgout; 