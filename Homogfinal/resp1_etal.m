function output=resp1_etal(params,t,begw,endw)
%
% DOVE-IR path 1 subroutine using Mukamel equations
% 
% ----------------------------------------------------------
% This routine performs a homogeneously broadened DOVE-IR path 1 2d-integral using
% time-domain equations.  They use equations 5.13 and 6.16b in first edition of his book.
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
% Gcg,Gcb,Gbg,Gag	= Homogeneous linewidths (HWHM) for the coherences set up by pulses 1,2,and 3,
%				(only Gcg, and Gcb are used in this subroutine)
%
%X wcg,wbg,wag =  The ringing frequencies of the respective coherences set up by pulses 1,2, and 3.
% 			
% Ttot = estimated time at which the output coherence will have approximately decayed to zero
% del= 'dt' -- that is, the step size for the integral (smaller is better, but longer to compute)
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
% begww=beginning index value corresponding to the minimum w1 value of interest
% endw=end index value corresponding to the maximum w1 value of interest
%  (the above two parameters speed up computation by limiting the size of the second FFT)
%
% These subroutines use a ZERO-order half-transform routine.  Therefore, the subroutines are
%	prone to large errors when examining w1,w2 frequencies far removed from resonance.  See "Numerical
%  Recipes in Fortran" or other Numerical methods texts for better-orders results if needed.
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
% KAM 6/11/02
% ------------------------------------------------
%
% The vector 'params' is now broken up.  Unit conversion takes place.

T2=params(1)*1E-12;
T1=params(2)*1E-12;
sigma1=params(3)*1E-12;  % The factor 0.601 takes the crosscorrelation FWHM into true intensity FWHM variance
sigma2=params(4)*1E-12;
sigma3=params(5)*1E-12;
%A1=params(6);
Gcg=params(12)*2*pi*3E10;
Gcb=params(13)*2*pi*3E10;
%wcg=params(16)*2*pi*3E10;  
%wbg=params(17)*2*pi*3E10;	
Ttot=params(19)*1E-12;
del=params(20)*1E-12;
%wcb=wcg-wbg;

hbar=1.0546E-34;

M=round(Ttot/del);
t1vec=(0:del:Ttot);
n=length(t1vec);
radix=ceil(log2(M));
N=2^(radix); 
Tfin=N*del;

t1=expandrow(t1vec,length(t1vec));
t2=t1';
E1arg=t-t1-t2+T1+T2;
E1=exp(-E1arg.^2./(2*sigma1.^2)); %normalization not needed
%E1=exp(abs(E1arg)./(sigma1));
%E1=1;
Gcgmat=1.*exp(-Gcg.*t1);
ht1=E1.*Gcgmat;
clear('Gcamat');
clear('E1arg');
clear('E1');

pcg1=ifft(ht1,N,2);
pcg1(:,(endw+1):(begw-1))=[];
[X,Y]=size(pcg1);

t2vec=t1vec';
t2=expandcol(t2vec,Y);
E2arg=t-t2+T2;
E2=exp(-E2arg.^2./(2*sigma2.^2));
%E2=exp(abs(E2arg)./(sigma2));
%E2=-abs(E2arg)./(sigma2);
%E2=1;
clear('E2arg');
Gcbmat=1.*exp(-Gcb.*t2);
clear('t2');
ht2=E2.*Gcbmat.*pcg1;
clear('Gcbmat');
clear('E2');
clear('pcg1');
pcb1=ifft(ht2,N,1);
clear('ht2');

E3arg=t;
E3=exp(-E3arg.^2./(2*sigma3.^2));
%E3=1;
pdb=E3.*pcb1;
clear('E3arg');
clear('E3');
clear('pcb1');
pdbtrans=fftshift(pdb)*(i*Tfin/hbar)*(i*Tfin/hbar); % see NOTE
output=pdbtrans; 
