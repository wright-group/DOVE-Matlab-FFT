function output=gaussHomogFWM(params,subparams,w1beg,w1end,w2axis,Fileparams)
% 
% gaussHomogFWM(params,subparams,w1beg,w1end,w2axis,fileparams)
% 
% Manual parameter changing full FWM simulation program for homogeneously
% 	broadened lines using time-domain Mukamel equations.
%
%---------------------------------------------
% This program will evaluate the output polarization vector of a final coherence after
% three Gaussian pulses are applied to it, as a function of time, at a particular setting
% of frequencies for three lasers.  The polarization vector contains contributions from 
% all major FWM processes interfering and creating signal.
%
% Three pulses (E1,E2,E3) are located at times t1, t2, and t3, with variance sigma.  These
% pulses are assumed to be transform limited. This routine associates pulse
% E1 with level 'c',  pulse E2 with level 'b', and pulse E3 with a non-resonant level. This program
% calculates the shape for all FWM pathways separately. 
%
% We assume t1=zero for this program. We also turn t2 & t3 into relative times as opposed
% to absolute.  T2 is the time between pulse 2&1 (T2=t2-t1), and T1 is the time between 3&2 (T1=t3-t2).
%
% Four-wave mixing Response functions are triple convolutions of three pulses and ringing
% terms of coherences.  The final output is the coherence value of the final coherence which
% radiates the signal that is detected.  For homodyne techniques, such as detection by a PMT,
% the coherence should be integrated over all time, hence, a quadruple integral.  Fortunately,
% for DOVE only two convolutions exist, and therefore only two FT's need be taken.
% 
% The convolutions are derived and turned into sums using an FFT method.
% Due to the causality principle, which prevents a coherence from being generated
% before the pulse actually arrives, a quasi-Heaviside function is applied to the time
% vector before FFT. This essentially takes the form of a time integral taken only from 
% zero to infinity.
%
% Each pathway has a different set of axes.  The pathways must be transformed into a common set
% of axes (w1,w2) using index manipulation functions not altogether different from the
% types of graphic manipulations in programs like Adobe Photoshop.
%
% Finally, a set of M factors are applied to the resulting 2D-spectrum, using index of
% refraction and absorbance information of the sample in the IR and visible.  The data
% can then be plotted with plotter3D.  
%
% Inhomogeneous broadening requires only marginal improvements to this algorithm, and is
% subject to a future update.
%
% NOTE: subfunctions use hbar in units of J sec, not erg sec!!! Be careful.
%
% Units:
% time=picoseconds
% frequency=wavenumbers
% length/thickness=centimeters
% number density=molarity is OK
%
% Variables:
%  
% -- the vector 'params' contains the following parameters, in this order:
%
% 	T2  	=	time between w3 and w2 (t3-t2) based on delay positions
% 	T1		=	time between w2 and w1 (t2-t1) based on delay positions
% 	sigma1		= temporal FWHM (in psec) of the laser pulse 1, using the form 
%				     E=-t^2/(2*sigma1)^2
%	sigma2 = " "		"	pulse 2
% 	sigma3 = " "    "  pulse 3
%  A1, A2, A3, Acars, Acarsref, Bg = scaling factors for each FWM process in the order:
%				DOVE-IR1, DOVE-IR2, DOVE-Raman, CARS, CARS of reference, background
%				
%  Gcg,Gcb,Gbg,Gag	= Homogeneous linewidths (HWHM) for the coherences set up by pulses 1,2,and 3,
%				
%  wcg,wbg,wag =  The ringing frequencies of the respective coherences set up by pulses 1,2, and 3.
% 		
%  Ttot = estimated time at which the output coherence will have approximately decayed to zero
%  del= 'dt' -- that is, the step size for the integral (smaller is better, but longer to compute)
%				(These two values ultimately determine Nyquist freq. and res. of fits)
%  wagref = frequency of CARS reference position in Raman space.
%  Gagref = homogeneous linewidth (HWHM) of CARS reference. 
%  theta21 = phasematching angle of w2 with respect to w1.
%  theta31 = phasematching angle of w3 with respect to w1.  Positive value means on the opposite
% 				side of w1 with respect to w2.
%  ls = thickness of sample 
%  lfw= thickness of front window 
%  wagalt = frequency of alternate CARS feature
%  Gagalt = homogeneous linewidth (HWHM) of alternate CARS feature 
%  Acarsalt= scaling factor of alternate CARS feature
%  Asive = SIVE scaling factor for sample's main absorbing feature
%  Afw = front window background 
%  Nsamp = number density of solute molecules (those involved in DOVE)
%  Nbg = number density of molecules involved in bground FWM (either sum of
%       solute + solvent or solvent, typically)
%  Nref = number density of molecules involved in reference CARS
%  Nalt = number density of molecules involved in alternate CARS feature 

%-- w1beg = beginning frequency of w1 required for plotting
%-- w1end = end frequency of w1 required for plotting
%-- w2axis = a vector of w2 frequencies for which each w1beg:w1end plot is performed for.  The plots
%			   are all accumulated into a 2D-spectrum

%--Subparams has the following values:
% 
% dtf = spacing in time of the final time integral.  1/10 to 1/20 of total
%       interval from -2sigw3 to 2sigw3 is reasonable.
% anharm1 = anharmonicity in w1 of any DOVE hotband present in w1 axis
% anharm2 = anharmonicity in w2 of any DOVE hotband present in w2 axis
% Ratio = ratio of hotband intensity to main intensity.  This is a product
%           of IR intensity ratios along both w1 and w2, times the Raman ratio, essentially.
% lbw = back window thickness
% Abw = back window A coefficient
%          (following value is for a sloped sample bg)
% xint = x-intercept of slope for background
%			
% off = non interfering signal added to FWM to "push up" the data
% corroff = index of refraction offset from Kramers-Kronig transform of IR data
%
%
%--Fileparams is a string vector having the following values (must be in Matlab path):
%
% nsvisfile= sample index of refraction file in visible
% nsirfile= sample index of refraction file in IR
% emsfile= sample absorption coeff. (cm-1) file in IR
% outfilex = string to which the X values of the resulting 2D spectrum will
%           be saved to.
% outfiley = string to which the Y values of the resulting 2D spectrum will
%           be saved to.
% outfilez = string to which the Z values of the resulting 2D spectrum will
%           be saved to.
% pmtQEfile= detector (or monochromator/det comb. if used) quantum efficiency file
% nfwvisfile= front window index of refraction file in visible
% nfwirfile= front window index of refraction file in IR
% emfwfile= front window absorption coeff. (cm-1) file in IR
% nbwvisfile= back window index of refraction file in visible
% nbwirfile= back window index of refraction file in IR
% embwfile= back window absorption coeff. (cm-1) file in IR
%				
%
% Subroutines in this program use a ZERO-order half-transform routine.  Therefore, the subroutines are
% prone to large errors when examining w1,w2 frequencies far removed from resonance.  See "Numerical
% Recipes in Fortran" or other numerical methods texts for better-order results if needed.
% 
% KAM 12/16/02
% ------------------------------------------------
%
% No local field factors or factors of (1/2)^n are added to
% these functions, since this program is used for small ranges of
% w1,w2,w3,w4 and involves ratioing to a reference.  See M factor section
% for additional notes.
%
%
% Additional files used:
%	expandrow.m
%	expandcol.m
%	vecx.m
%   resp1b.m
%	resp2b.m
%	resp3b.m
%	respCARS.m
% 	respCARSref.m
%	respCARSalt.m
%   respSIVEw2.m
%	respBG.m
%	p1wtransform.m
%	p2wtransform.m (p3=same as p1)
%	vecadd.m

% The vector 'params' is now broken up.  Unit conversion takes place.
T2=params(1)*1E-12;
T1=params(2)*1E-12;
sigma1=params(3)*1E-12;   
sigma2=params(4)*1E-12;
sigma3=params(5)*1E-12;
A1=params(6);
A2=params(7);
A3=params(8);
Acars=params(9);
Acarsref=params(10);
Bg=params(11);
Gcg=params(12)*2*pi*3E10;
Gcb=params(13)*2*pi*3E10;
Gbg=params(14)*2*pi*3E10;
Gag=params(15)*2*pi*3E10;
wcg=params(16);
wbg=params(17);
wag=params(18);
Ttot=params(19)*1E-12;
del=params(20)*1E-12;
wagref=params(21);
Gagref=params(22)*2*pi*3E10;
theta21=params(23)*pi/180;
theta31=params(24)*pi/180;
ls=params(25);
lfw=params(26);
wagalt=params(27);
Gagalt=params(28)*2*pi*3E10;
Acarsalt=params(29);
Asive=params(30);
Afw=params(31); 
Nsam=params(32);
Nbg=params(33);
Nref=params(34);
Nalt=params(35);
w3=params(36);
wcb=wcg-wbg;

% The vector 'subparams' is broken up.
dtf = subparams(1)*1E-12;
anharm1 = subparams(2);
anharm2 = subparams(3); 
Ratio = subparams(4);
lbw = subparams(5);
Abw = subparams(6);
xint = subparams(7);
off = subparams(8);
corroff = subparams(9);

% The stringvector 'fileparams' is broken up.
nsvisfile=Fileparams.samnvis;
nsirfile=Fileparams.samnir;
emsfile=Fileparams.samem;
outfilex=Fileparams.outx;
outfiley=Fileparams.outy;
outfilez=Fileparams.outz;
pmtqefile=Fileparams.PMT;
nfwvisfile=Fileparams.fwnvis;
nfwirfile=Fileparams.fwnir;
emfwfile=Fileparams.fwem;
nbwvisfile=Fileparams.bwnvis;
nbwirfile=Fileparams.bwnir;
embwfile=Fileparams.bwem;

%The number of elements required for t1,t2,t is evaluated here.
M=round(Ttot/del);
t1vec=(0:del:Ttot);
radix=ceil(log2(M));
N=2^(radix); % FFT round up

% the final integrated t vector is created here.
tvec=(-2*(sigma3):dtf:2*(sigma3));
p=length(tvec);

% resolution of w1 axis is computed here.
Numw2=length(w2axis);
Nvec1=(0:1:N/2-1); 
Nvec2=-(N/2:-1:1);
Nvec3=[Nvec2,Nvec1]; 
thetavec=2*pi.*Nvec3./(N);
dwvec=thetavec./(del*2*pi*3E10); % in wavenumbers
step=(1/(Ttot*3E10));
tol=step/2.0001; % verify this tolerance will not cause future problems
dw=dwvec(2)-dwvec(1);
w1resolution=dw
Nyquist=-dwvec(1)

%the following vectors define the frequency axes of the FT of each pathway
w1vec=wcg+dwvec;
w1w2vec=wcb+dwvec;
w2vec=wbg+dwvec;
w1w2p3vec=wag+dwvec; %'p3' = DOVE-Raman
w1w2refvec=wagref+dwvec;
w1w2altvec=wagalt+dwvec;
n=length(dwvec);

Nvec4=[Nvec1,Nvec2];
thetavec2=2*pi.*Nvec4./N;
dwvec2=thetavec2./(del*2*pi*3E10);
w1vec2=wcg+dwvec2;
w2vec2=wbg+dwvec2;
output=0;
flag=0;

% truncated w vectors, useful for speeding up the fft code, are now
% computed here.  Truncating the first transformed axis after the FFT
% greatly speeds up computation of second FFT.
maxw1=w1end+anharm1+5;
minw1=w1beg-anharm1-5;
maxdw1=max([abs(wcg-minw1) abs(maxw1-wcg)]);

maxw2=max(w2axis)+anharm2+5;
minw2=min(w2axis)-anharm2-5;
maxdw2=max([abs(wbg-minw2) abs(maxw2-wbg)]);

if ((maxw1 > w1vec(n)) | (minw1 < w1vec(1)))
    disp('error: w1 beginning or end value exceeds listed Nyquist frequency')
    output=1;
end

if ((maxw2 > w2vec(n)) | (minw2 < w2vec(1)))
    disp('error: w2 beginning or end value exceeds listed Nyquist frequency')
    output=1;
end

if (output == 0)
    w1vectbeg=find((w1vec+dw/2) >= wcg-maxdw1 & wcg-maxdw1 > (w1vec-dw/2));
    w1vectend=find((w1vec+dw/2) >= wcg+maxdw1 & wcg+maxdw1 > (w1vec-dw/2));
    ind1beg=find((w1vec2+dw/2) >= wcg-maxdw1 & wcg-maxdw1 > (w1vec2-dw/2));
    ind1end=find((w1vec2+dw/2) >= wcg+maxdw1 & wcg+maxdw1 > (w1vec2-dw/2));
    w1vect=w1vec(w1vectbeg:w1vectend);
    k=length(w1vect);
   
    w2vectbeg=find((w2vec+dw/2) >= wbg-maxdw2 & wbg-maxdw2 > (w2vec-dw/2));
    w2vectend=find((w2vec+dw/2) >= wbg+maxdw2 & wbg+maxdw2 > (w2vec-dw/2));
    ind2beg=find((w2vec2+dw/2) >= wbg-maxdw2 & wbg-maxdw2 > (w2vec2-dw/2));
    ind2end=find((w2vec2+dw/2) >= wbg+maxdw2 & wbg+maxdw2 > (w2vec2-dw/2));
    w2vect=w2vec(w2vectbeg:w2vectend);
    l=length(w2vect);

    anharm=abs(wcb-wag);
    maxw1w2=maxw1-minw2+anharm;
    minw1w2=minw1-maxw2-anharm;

    w1w2vectbeg=find((w1w2vec+dw/2) >= minw1w2 & minw1w2 > (w1w2vec-dw/2));
    w1w2vectend=find((w1w2vec+dw/2) >= maxw1w2 & maxw1w2 > (w1w2vec-dw/2));
    w1w2p3vectbeg=find((w1w2p3vec+dw/2) >= minw1w2 & minw1w2 > (w1w2p3vec-dw/2));
    w1w2p3vectend=find((w1w2p3vec+dw/2) >= maxw1w2 & maxw1w2 > (w1w2p3vec-dw/2));
    w1w2vect=w1w2vec(w1w2vectbeg:w1w2vectend);
    w1w2p3vect=w1w2p3vec(w1w2p3vectbeg:w1w2p3vectend); 
    f=length(w1w2vect);
    g=length(w1w2p3vect);

%The axes of the *transformed*, truncated response spectra are computed here.
%They are also computed later.
    p1trowmax=w1vect(k)-w1w2vect(1);
    p1trowmin=w1vect(1)-w1w2vect(f);
    p1trowvec=(p1trowmin:dw:p1trowmax);
    p1txvec=w1vect;
    p1tyvec=p1trowvec;
    p1txvechot=p1txvec-anharm1;
    p1tyvechot=p1tyvec-anharm2;

    p2tcolmax=w2vect(l)+w1w2vect(f);
    p2tcolmin=w2vect(1)+w1w2vect(1);
    p2tcolvec=(p2tcolmin:dw:p2tcolmax);
    p2txvec=p2tcolvec;
    p2tyvec=w2vect;
    p2txvechot=p2txvec-anharm1;
    p2tyvechot=p2tyvec-anharm2;

    p3trowmax=w1vect(k)-w1w2p3vect(1);
    p3trowmin=w1vect(1)-w1w2p3vect(g);
    p3trowvec=(p3trowmin:dw:p3trowmax);
    p3txvec=w1vect;
    p3tyvec=p3trowvec;
    p3txvechot=p3txvec-anharm1;
    p3tyvechot=p3tyvec-anharm2;

    pcarsvec=w1w2p3vec+w2axis(1);
    pcarsrefvec=w1w2refvec+w2axis(1);
    pcarsaltvec=w1w2altvec+w2axis(1);

    ytolp1=(p1tyvec(2)-p1tyvec(1))/2;
    ytolp2=(p2tyvec(2)-p2tyvec(1))/2;
    ytolp3=(p3tyvec(2)-p3tyvec(1))/2;

% this code determines the final output vector of w1 by stringing together all
% transformed w1 vectors of each process, including the hot bands.
    vec12=vecx(p1txvec,p2txvec,wcg,tol);
    vec123=vecx(vec12,p3txvec,wcg,tol);
    vec123c1=vecx(vec123,pcarsvec,wcg,tol);
    vec123c1c2=vecx(vec123c1,pcarsrefvec,wcg,tol);
    vec123c1c2c3=vecx(vec123c1c2,pcarsaltvec,wcg,tol);
    vec123a1=vecx(vec123c1c2c3,p1txvechot,wcg,tol);
    vec123a1a2=vecx(vec123a1,p2txvechot,wcg,tol);
    vec123a1a2a3=vecx(vec123a1a2,p3txvechot,wcg,tol);

    fulloutvec=vec123a1a2a3;
    xtol=(fulloutvec(2)-fulloutvec(1))/2;
    [x1beg]=find((fulloutvec+xtol) >= w1beg & w1beg > (fulloutvec-xtol));
    [x1end]=find((fulloutvec+xtol) >= w1end & w1end > (fulloutvec-xtol));
    finalvec=fulloutvec(x1beg:x1end);

%output arrays are initialized here.
    Nfinal=length(finalvec);
    psum=zeros(1,Nfinal);
    psummat=repmat(0,[Nfinal Numw2]);
    xvecmat=repmat(0,[Nfinal Numw2]);
    yvecmat=repmat(0,[Nfinal Numw2]);


%This section calculates M factors for the sample using Dk and Dalpha data from a 
% separate program. Currently, it assumes the back window is fully absorbing and isn't 
% contributing to background.  M factors do not include exp(-0.5 alpha4*thickness)
% term.
%---------------------------------------------------------------------
    conjflag=0;
                
    xvecmattemp=expandcol(finalvec',Numw2); %final x and y values may vary from scan to scan, but only by ~1 cm-1 or so.
    yvecmattemp=expandrow(w2axis,Nfinal);
    
    if conjflag
        w4mat=-xvecmattemp+yvecmattemp+w3;
    else
        w4mat=xvecmattemp-yvecmattemp+w3;
    end
    
    corroffvis=0;
    corrflag=1;
    if corrflag
        corroffvis=corroff;
    end
    nsvis=load(nsvisfile)+corroffvis; %sample/solvent visible refractive index data
    nsir=load(nsirfile)+corroff; % sample/solvent ir refractive index data.  Adds offset if necessary.
    alphas=load(emsfile); % sample/solvent ir extinct. coeff. data
    respPMT=load(pmtqefile); % response of detector.  Current file is inaccurate, coming
										% from a Thorn EMI book.  Does not
										% reflect monochromator.

                        
    if (lfw ~= 0)
        nfwvis=load(nfwvisfile); % window visible refractive index data
        nfwir=load(nfwirfile); % window ir refractive index data
        alphafw=load(emfwfile); % window ir extinct. coeff. data

        nfw1=interp1(nfwir(:,1),nfwir(:,2),finalvec','linear');
        nfw1mat=expandcol(nfw1,Numw2);                                                            
        nfw2=interp1(nfwir(:,1),nfwir(:,2),w2axis,'linear');
        nfw2mat=expandrow(nfw2,Nfinal);
        nfw3=interp1(nfwvis(:,1),nfwvis(:,2),w3,'linear');
        alpha1fw=interp1(alphafw(:,1),alphafw(:,2),finalvec','linear');
        alpha1fwmat=expandcol(alpha1fw,Numw2);
        alpha2fw=interp1(alphafw(:,1),alphafw(:,2),w2axis,'linear');
        alpha2fwmat=expandrow(alpha2fw,Nfinal);
        alpha3fw=0;
        alpha4fw=0;

        nfw4mat=repmat(0,[Nfinal Numw2]);
        for f=1:Numw2
            q=length(w4mat(:,f));
	        nfw4mat(:,f)=interp1(nfwvis(:,1),nfwvis(:,2),w4mat(:,f),'linear');	 
        end

        th21fwmat=asin(sin(theta21)./nfw2mat);
        th31fw=asin(sin(theta31)./nfw3);
        kfw1mat=2*pi.*xvecmattemp.*nfw1mat;
        kfw2mat=2*pi.*yvecmattemp.*nfw2mat;
        kfw3=2*pi*w3*nfw3;
        kfw4mat=2*pi.*w4mat.*nfw4mat;
        kfw1ymat=kfw1mat;
        kfw1x=0;
        kfw2ymat=kfw2mat.*cos(th21fwmat);
        kfw2xmat=kfw2mat.*sin(th21fwmat);
        kfw3y=kfw3*cos(th31fw);
        kfw3x=kfw3*sin(th31fw);
        
        if conjflag
            dkfwmat=sqrt((-kfw1x+kfw2xmat+kfw3x).^2 + (-kfw1ymat+kfw2ymat+kfw3y).^2)-kfw4mat;
            dalphafwmat=(alpha1fwmat+alpha2fwmat+alpha3fw-alpha4fw)/2;
        else 
            dkfwmat=sqrt((kfw1x-kfw2xmat+kfw3x).^2 + (kfw1ymat-kfw2ymat+kfw3y).^2)-kfw4mat;
            dalphafwmat=(alpha1fwmat+alpha2fwmat+alpha3fw-alpha4fw)/2;
        end    
        Mfw=(exp((i.*dkfwmat-dalphafwmat).*lfw)-1)./(lfw.*(i.*dkfwmat-dalphafwmat));
    
    else
        dkfwmat=0;
        dalphafwmat=0;
        Mfw=0;
    end                                        
                                     
    nsirn=nsir(:,2);
    nsirw=nsir(:,1);
    ns1=interp1(nsirw,nsirn,finalvec','linear');
    ns1mat=expandcol(ns1,Numw2);
    ns2=interp1(nsirw,nsirn,w2axis,'linear');
    ns2mat=expandrow(ns2,Nfinal);
    ns3=interp1(nsvis(:,1),nsvis(:,2),w3,'linear');
    alpha1s=interp1(alphas(:,1),alphas(:,2),finalvec','linear');
    alpha1smat=expandcol(alpha1s,Numw2);
    alpha2s=interp1(alphas(:,1),alphas(:,2),w2axis,'linear');
    alpha2smat=expandrow(alpha2s,Nfinal);
    alpha3s=0;  %change if necessary
    alpha4s=0;

    ns4mat=repmat(0,[Nfinal Numw2]);
    respw4mat=repmat(0,[Nfinal Numw2]);

    for f=1:Numw2
        q=length(w4mat(:,f));
	    ns4mat(:,f)=interp1(nsvis(:,1),nsvis(:,2),w4mat(:,f),'linear');
	    respw4mat(:,f)=interp1(respPMT(:,1),respPMT(:,2),w4mat(:,f),'linear'); 
    end

    th21smat=asin(sin(theta21)./ns2mat);
    th31s=asin(sin(theta31)./ns3);
    ks1mat=2*pi.*xvecmattemp.*ns1mat;
    ks2mat=2*pi.*yvecmattemp.*ns2mat;
    ks3=2*pi*w3*ns3;
    ks4mat=2*pi.*w4mat.*ns4mat;
    ks1ymat=ks1mat;
    ks1x=0;
    ks2ymat=ks2mat.*cos(th21smat);
    ks2xmat=ks2mat.*sin(th21smat);
    ks3y=ks3*cos(th31s);
    ks3x=-ks3*sin(th31s);
    
    conjflag=0;
    if conjflag
        
        dksmat=sqrt((-ks1x+ks2xmat+ks3x).^2 + (-ks1ymat+ks2ymat+ks3y).^2)-ks4mat;
        dalphasmat=(alpha1smat+alpha2smat+alpha3s-alpha4s)/2;
    else
        dksmat=sqrt((ks1x-ks2xmat+ks3x).^2 + (ks1ymat-ks2ymat+ks3y).^2)-ks4mat;
        dalphasmat=(alpha1smat+alpha2smat+alpha3s-alpha4s)/2;
    end
    
    Ms=exp(i.*dkfwmat.*lfw).*exp(-dalphafwmat.*lfw).*(exp((i.*dksmat-dalphasmat).*ls)-1)./(ls.*(i.*dksmat-dalphasmat)); % check sign of 2nd term


    if (lbw ~= 0)
        nbwvis=load(nbwvisfile); % window visible refractive index data
        nbwir=load(nbwirfile); % window ir refractive index data
        alphabw=load(embwfile); % window ir extinct. coeff. data

        nbw1=interp1(nbwir(:,1),nbwir(:,2),finalvec','linear');
        nbw1mat=expandcol(nbw1,Numw2);                                                            
        nbw2=interp1(nbwir(:,1),nbwir(:,2),w2axis,'linear');
        nbw2mat=expandrow(nbw2,Nfinal);
        nbw3=interp1(nbwvis(:,1),nbwvis(:,2),w3,'linear');
        alpha1bw=interp1(alphabw(:,1),alphabw(:,2),finalvec','linear');
        alpha1bwmat=expandcol(alpha1bw,Numw2);
        alpha2bw=interp1(alphabw(:,1),alphabw(:,2),w2axis,'linear');
        alpha2bwmat=expandrow(alpha2bw,Nfinal);
        alpha3bw=0;
        alpha4bw=0;

        nbw4mat=repmat(0,[Nfinal Numw2]);
        for f=1:Numw2
            q=length(w4mat(:,f));
	        nbw4mat(:,f)=interp1(nbwvis(:,1),nbwvis(:,2),w4mat(:,f),'linear');	 
        end

        th21bwmat=asin(sin(theta21)./nbw2mat);
        th31bw=asin(sin(theta31)./nbw3);
        kbw1mat=2*pi.*xvecmattemp.*nbw1mat;
        kbw2mat=2*pi.*yvecmattemp.*nbw2mat;
        kbw3=2*pi*w3*nbw3;
        kbw4mat=2*pi.*w4mat.*nbw4mat;
        kbw1ymat=kbw1mat;
        kbw1x=0;
        kbw2ymat=kbw2mat.*cos(th21bwmat);
        kbw2xmat=kbw2mat.*sin(th21bwmat);
        kbw3y=kbw3*cos(th31bw);
        kbw3x=kbw3*sin(th31bw);
        
        if conjflag
            dkbwmat=sqrt((-kbw1x+kbw2xmat+kbw3x).^2 + (-kbw1ymat+kbw2ymat+kbw3y).^2)-kbw4mat;
            dalphabwmat=(alpha1bwmat+alpha2bwmat+alpha3bw-alpha4bw)/2;
        else
            dkbwmat=sqrt((kbw1x-kbw2xmat+kbw3x).^2 + (kbw1ymat-kbw2ymat+kbw3y).^2)-kbw4mat;
            dalphabwmat=(alpha1bwmat+alpha2bwmat+alpha3bw-alpha4bw)/2;
        end
        Mbw=exp(i.*dkfwmat.*lfw).*exp(-dalphafwmat.*lfw).*exp(i.*dksmat.*ls).*exp(-dalphasmat.*ls).*(exp((i.*dkbwmat-dalphabwmat).*lbw)-1)./((i.*dkbwmat-dalphabwmat).*lbw);
        
    else
        dkbwmat=0;
        dalphabwmat=0;
        Mbw=0;
    end

%--------------------------------------------------------------

% A for loop is set up for each final time t of the output coherence, as defined in Mukamel's 
% response function literature.  For each t, the coherence is calculated, and the two pathways
% are added together.  These are then mod squared and summed with the coherence values of the 
% previous times t.


    p1out=0;
    p2out=0;
    %p=1; %set to 1 for debugging

    for b=1:p
        if (output == 0)
	        [b,p]   
	        t=tvec(b);
	        %t=0;  %set to 0 for debugging

% the following ifft subroutines are the main, slow steps of the code.

%A transformation matrix converts p1,p2,p3 into the proper axes to (w1,w2).  Unfortunately,
%this resizes the arrays, so the new (xmin,ymin)->(xmax,ymax) axes need to be
%computed.  This was done with 'vecx' above.  These transformations are also slow,
%since it appears that Matlab has no built-in functions that skew matrices 
%(visually, from a "square" to a "parallelogram"). A C subroutine is used
%for transformations, since for loops in Matlab are slow.

            Lflag=1;

            if (A1 ~= 0)
    	        if (Lflag == 0)
                    p1=A1*Nsam*resp1b(params,t,ind1beg,ind1end)*dtf;
                else
                    p1=A1*Nsam*resp1_etal(params,t,ind1beg,ind1end)*dtf;
                end
                p1=p1(w1w2vectbeg:w1w2vectend,:);
                p1trans=p1transform(p1);
	            clear('p1');
            else
                p1trans=repmat(0,[length(p1tyvec)+1 length(p1txvec)]);
            end
    
            if (A2 ~= 0)
                p2=A2*Nsam*resp2b(params,t,ind2beg,ind2end)*dtf;
	            p2=p2(w1w2vectbeg:w1w2vectend,:);
                p2trans=p2transform(p2);
	            clear('p2');
            else
                p2trans=repmat(0,[length(p2tyvec) length(p2txvec)+1]);
            end

            if (A3 ~= 0)
                p3=A3*Nsam*resp3b(params,t,ind1beg,ind1end)*dtf;
	            p3=p3(w1w2p3vectbeg:w1w2p3vectend,:);
                p3trans=p1transform(p3);
	            clear('p3');
            else
                p3trans=repmat(0,[length(p3tyvec)+1 length(p3txvec)]);
            end

            if (Acars ~= 0)
                pcars=Acars*Nsam*respCARS(params,t)*dtf;
            else
                pcars=zeros(1,length(pcarsvec));
            end

	        pcarsref=Acarsref*Nref*respCARSref(params,t)*dtf;

            if (Acarsalt ~= 0)
                pcarsalt=Acarsalt*Nalt*respCARSalt(params,t)*dtf;
            else
                pcarsalt=zeros(1,length(pcarsaltvec));
            end

	        pbgt=respBG(params,t)*dtf; 
            pbg=Bg*Nbg*pbgt;
	        pbgfw=Afw*pbgt;
            pbgbw=Abw*pbgt;
            psive=Asive*Nsam*respSIVEw2(params,t)*dtf;
      
    
% Here, slices in the w2 axis are taken and added together, then put into a final 
% output matrix with final w1 range specified by the user.

	        for c=1:Numw2
   
		        w2slice=w2axis(c);
		        pcarsvec=w1w2p3vec+w2slice;
		        pcarsrefvec=w1w2refvec+w2slice;
		        pcarsaltvec=w1w2altvec+w2slice;

		        ytolp1=(p1tyvec(2)-p1tyvec(1))/2;
		        ytolp2=(p2tyvec(2)-p2tyvec(1))/2;
		        ytolp3=(p3tyvec(2)-p3tyvec(1))/2;

		        [y1p1]=find((p1tyvec+ytolp1) >= w2slice & w2slice > (p1tyvec-ytolp1));
		        [y1p2]=find((p2tyvec+ytolp2) >= w2slice & w2slice > (p2tyvec-ytolp2));
		        [y1p3]=find((p3tyvec+ytolp3) >= w2slice & w2slice > (p3tyvec-ytolp3));
		        [y1p1hot]=find((p1tyvechot+ytolp1) >= w2slice & w2slice > (p1tyvechot-ytolp1));
		        [y1p2hot]=find((p2tyvechot+ytolp2) >= w2slice & w2slice > (p2tyvechot-ytolp2));
		        [y1p3hot]=find((p3tyvechot+ytolp3) >= w2slice & w2slice > (p3tyvechot-ytolp3));
		        [y1sive]=find((w2vec+dw/2) >= w2slice & w2slice > (w2vec-dw/2));

		        p1transvec=p1trans(y1p1,:);
		        p2transvec=p2trans(y1p2,:);
		        p3transvec=p3trans(y1p3,:);
		        p1transvechot=Ratio*p1trans(y1p1hot,:);
		        p2transvechot=Ratio*p2trans(y1p2hot,:);
		        p3transvechot=Ratio*p3trans(y1p3hot,:);
		        psiveelem=psive(y1sive);

% for each w2 a new final vector is computed, due to changes in location of the
% CARS peaks.
		        vec12=vecx(p1txvec,p2txvec,wcg,tol);
		        vec123=vecx(vec12,p3txvec,wcg,tol);
		        vec123c1=vecx(vec123,pcarsvec,wcg,tol);
		        vec123c1c2=vecx(vec123c1,pcarsrefvec,wcg,tol);
		        vec123c1c2c3=vecx(vec123c1c2,pcarsaltvec,wcg,tol);
		        vec123a1=vecx(vec123c1c2c3,p1txvechot,wcg,tol);
		        vec123a1a2=vecx(vec123a1,p2txvechot,wcg,tol);
		        vec123a1a2a3=vecx(vec123a1a2,p3txvechot,wcg,tol);

		        fulloutvec=vec123a1a2a3;
		        xtola=(fulloutvec(2)-fulloutvec(1))/2;
		        [x1beg]=find((fulloutvec+xtola) >= w1beg & w1beg > (fulloutvec-xtola));
		        [x1end]=find((fulloutvec+xtola) >= w1end & w1end > (fulloutvec-xtola));
		        finalvec=fulloutvec(x1beg:(x1beg+Nfinal-1));

% coherences added here at amplitude level for a given w1
		        ptot12=vecadd(p1transvec,p1txvec,p2transvec,p2txvec,wcg,tol);
		        ptot123=vecadd(ptot12,vec12,p3transvec,p3txvec,wcg,tol);
		        ptot123c1=vecadd(ptot123,vec123,pcars,pcarsvec,wcg,tol);
		        ptot123c1c2=vecadd(ptot123c1,vec123c1,pcarsref,pcarsrefvec,wcg,tol);
		        ptot123c1c2c3=vecadd(ptot123c1c2,vec123c1c2,pcarsalt,pcarsaltvec,wcg,tol);
		        ptot123a1=vecadd(ptot123c1c2c3,vec123c1c2c3,p1transvechot,p1txvechot,wcg,tol);
		        ptot123a1a2=vecadd(ptot123a1,vec123a1,p2transvechot,p2txvechot,wcg,tol);
		        ptot123a1a2a3=vecadd(ptot123a1a2,vec123a1a2,p3transvechot,p3txvechot,wcg,tol);

		        ptot=ptot123a1a2a3;

% artificial slope to background is applied here. '0' for xint means no slope applied.  w1 slope only.

                if (xint ~= 0)
                    slope=pbg^2/(w1end-xint);
                    pbgfin=sqrt(slope.*(vec123a1a2a3-xint));
                else
                    pbgfin=pbg;
                end
        
		        ptotal=ptot+psiveelem+pbgfin;  
                Msv=Ms(:,c)';
        
                if (lfw ~= 0)
                    Mfwv=Mfw(:,c)';
                else
                    Mfwv=0;
                end
        
                if (lbw ~= 0)
                    Mbwv=Mbw(:,c)';
                else
                    Mbwv=0;
                end
        
                PMTresp=respw4mat(:,c)';

%Now that all of the coherences are added, we can square the modulus and integrate
% over all time. "Integration" means that the mod square is added for all t's.
		        ptotfin=ptotal(x1beg:(x1beg+Nfinal-1));
        
                if (length(ptotfin) ~= length(Msv))
                    if (flag==0)
                        disp('error:  w1 and/or w2 axes are near but not less than Nyquist frequency after transform.')
                        disp('Please make sure Nyquist frequency is at least 2* diff between DOVE center frequency and')
                        disp('furthest w1beg or w1end value')
                        output=1;
                        flag=1;
                    end
                else
                    ptotconjfin=PMTresp.*(abs(Msv.*ptotfin.*ls + Mfwv.*pbgfw.*lfw + Mbwv.*pbgbw.*lbw)).^2;
		            clear('ptot');
		            clear('ptotfin');
		            psummat(:,c)=psummat(:,c)+ptotconjfin';
		            xvecmat(:,c)=finalvec';
		            yvec=repmat(w2slice,[Nfinal 1]);
		            yvecmat(:,c)=yvec;
		            clear('ptotconjfin');
	            end
            end
    
	        clear('p1trans');
	        clear('p2trans');
	        clear('p3trans');
	        clear('ptot1');
	        clear('p1transvec');
	        clear('p2transvec');
	        clear('ptot12');
	        clear('ptot123');
	        clear('ptot123c1');
	        clear('p1transhot');
	        clear('p2transhot');
	        clear('p3transhot');        
        end
    end
    Intmat=psummat;
    clear('psummat');
    %Intfinmat=repmat(0,[Nfinal Numw2]);
end

% this loop scales each of the w2 slices to the reference at wagref.

scaleflag=1;
flag=0;
if (output==0)
    for d=1:Numw2
        searchrange=6;  % increase if CARS feature is heavily distorted or decrease 
                    % if CARS feature is well resolved from, but close to other
                    % peaks
        xv=xvecmat(:,d);
        w2s=w2axis(d);
        wsearch=wagref+w2s;
        Dtol=xv(2)-xv(1);
        nn=length(xv);
        if scaleflag
            
            wsearchmin=wsearch-(searchrange+1)*Dtol;
            wsearchmax=wsearch+(searchrange+1)*Dtol;
        
            if ((xv(1) > wsearchmin) | (xv(nn) < wsearchmax))
                if (flag==0)
                    disp('error: reference peak falls out of range for at least one w2 value.')
                    output=1;
                    flag=1;
                end           
            else
        windex=find( (xv-Dtol/2) <= wsearch & wsearch < (xv+Dtol/2));
	    multp=max(Intmat((windex-searchrange):(windex+searchrange),d));
	    Intmat(:,d)=Intmat(:,d)/multp + off; % adds 'off'
            end
        end
    end
end


transposeflag=0;

figure(8)
    if transposeflag
        contourf(yvecmat',xvecmat',Intmat',30);
    else
        contourf(xvecmat,yvecmat,Intmat,30);
    colorbar;
    end
    
if (output == 0)
    save(outfilex,'xvecmat','-ascii','-double','-tabs');
    save(outfiley,'yvecmat','-ascii','-double','-tabs');
    save(outfilez,'Intmat','-ascii','-double','-tabs');
else
    disp('Data not saved.');
end

    
    
