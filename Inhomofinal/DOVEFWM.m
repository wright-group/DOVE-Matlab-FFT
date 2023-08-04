function output=DOVEFWM(Params)
% 
% function output=DOVEFWM(Params)
% 
% Manual parameter changing full FWM simulation program for DOVE
% using time-domain Mukamel equations.
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
% NOTE: subfunctions use hbar in units of J sec, not erg sec!!! Be careful.
%
% Units:
% time=picoseconds
% frequency=wavenumbers
% length/thickness=centimeters
% number density=molarity is OK
%
% See 'DOVEcmpt.m' for the Params cluster values.
% 
% Subroutines in this program use a ZERO-order half-transform routine.  Therefore, the subroutines are
% prone to large errors when examining w1,w2 frequencies far removed from resonance.  See "Numerical
% Recipes in Fortran" or other numerical methods texts for better-order results if needed.
% 
% KAM 3/4/04
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
%	vecadd2.m
%   vecadd3.m
%   DOVEd1.m
%	DOVEd2.m
%	DOVEdDR.m
%	CARSd.m
% 	CARSrefd.m
%	CARSaltd.m
%   SIVEw2d.m
%	BGd.m
%	p1wtransform.m
%	p2wtransform.m (p3=same as p1)
%	p1transform.dll
%   p2transform.dll
%   FWHM_to_Gaussvar.m
%   Nyq_and_res_to_t1t2t3.m
%   w3_param_to_t.m


% The cluster 'Params' is now broken up.  Unit conversion takes place.
wcg=Params.solute.freqs.wcg;
wbg=Params.solute.freqs.wbg;
wag=Params.solute.freqs.wag; 
Gcg=Params.solute.popgammas.Gcg*2*pi*3E10;
Gbg=Params.solute.popgammas.Gbg*2*pi*3E10;
Gag=Params.solute.popgammas.Gag*2*pi*3E10;
Gcb=Params.solute.popgammas.Gcb*2*pi*3E10;
A1=Params.solute.coeff.ADIR1;
A2=Params.solute.coeff.ADIR2;
A3=Params.solute.coeff.ADRam;
Acars=Params.solute.coeff.ACARS;
Asive=Params.solute.coeff.ASIVE;
lbg=Params.solute.biglambdas.lbg;
lag=Params.solute.biglambdas.lag; 
kbg=Params.solute.kappas.kbg;
kag=Params.solute.kappas.kag;
eta=Params.solute.correlations.eta;
anharm1=Params.solute.hotband.anharmw1;
anharm2=Params.solute.hotband.anharmw2;
Ratio=Params.solute.hotband.ratio;
Nsam=Params.solute.conc.Nsam;
wcb=wcg-wbg;

wagref=Params.solvent.freqs.wagref;
wagalt=Params.solvent.freqs.wagalt;
Gagref=Params.solvent.popgammas.Gagref*2*pi*3E10;
Gagalt=Params.solvent.popgammas.Gagalt*2*pi*3E10;
Acarsref=Params.solvent.coeff.ACARSref;
Acarsalt=Params.solvent.coeff.ACARSalt;
Nref=Params.solvent.conc.Nref;
Nalt=Params.solvent.conc.Nalt;

I1FWHM=Params.fields.I1FWHM*1E-12;
I2FWHM=Params.fields.I2FWHM*1E-12;
I3FWHM=Params.fields.I3FWHM*1E-12;
%Eflag(1)=Params.fields.E1flag0;
%Eflag(2)=Params.fields.E1flag1;
%Eflag(3)=Params.fields.E2flag0;
%Eflag(4)=Params.fields.E2flag1;
Eflag(1)=0;
Eflag(2)=0;
Eflag(3)=0;
Eflag(4)=0;



T2=Params.fields.T21*1E-12;
T1=Params.fields.T32*1E-12;




nyquist=Params.plot.nyquist;
resn=Params.plot.resolution; 
w2beg=Params.plot.w2beginning;
w2end=Params.plot.w2end;
w2sp=Params.plot.w2spacing;
w3=Params.plot.w3;

Afw=Params.cell.front.Afw;
lfw=Params.cell.front.lfw;
nfwvisfile=Params.cell.front.fwnvisfile;
nfwirfile=Params.cell.front.fwnirfile;
emfwfile=Params.cell.front.fwemfile;
Bg=Params.cell.sample.Abg;  %sample's background located here
Nbg=Params.cell.sample.Nbg;  %sample's background solvent conc here
ls=Params.cell.sample.ls;
nsvisfile=Params.cell.sample.sampnvisfile;
nsirfile=Params.cell.sample.sampnirfile;
emsfile=Params.cell.sample.sampemfile;
Abw=Params.cell.back.Abw;
lbw=Params.cell.back.lbw;
nbwvisfile=Params.cell.back.bwnvisfile;
nbwirfile=Params.cell.back.bwnirfile;
embwfile=Params.cell.back.bwemfile;
theta21=Params.cell.angles.theta21*pi/180;
theta31=Params.cell.angles.theta31*pi/180;

pmtqefile=Params.misc.QEfile;
dataxfile=Params.misc.dataxfile;
datayfile=Params.misc.datayfile;
datazfile=Params.misc.datazfile;
squareson=Params.misc.squareson;

outfilex=Params.output.outfilex;
outfiley=Params.output.outfiley;
outfilez=Params.output.outfilez;
saveparamfile=Params.output.outparamfile;

%-----------------
if (Eflag(1)==0)
    sigma1=FWHM_to_Gaussvar(I1FWHM);   
else
    sigma1=I1FWHM;
end
if (Eflag(3)==0)
    sigma2=FWHM_to_Gaussvar(I2FWHM);
else
    sigma2=I2FWHM;
end
sigma3=FWHM_to_Gaussvar(I3FWHM);


%The number of elements required for t1,t2,t is evaluated here.
t1t2vec=Nyq_and_res_to_t1t2t3(nyquist,resn);
N=length(t1t2vec);
Ttot=t1t2vec(length(t1t2vec));
del=t1t2vec(2)-t1t2vec(1);

% the final integrated t vector is created here.
tvec=w3_param_to_t(sigma3);
lent=length(tvec);
dtf=tvec(2)-tvec(1);

% axis of computed w2's tabulated here.
w2axis=(w2beg:w2sp:w2end);
Numw2=length(w2axis);

% resolution of w1 axis is computed here. It was determined in the
% subroutine, but will be recalculated here.
Nvec1=(0:1:N/2-1); 
Nvec2=-(N/2:-1:1);
Nvec3=[Nvec2,Nvec1]; 
thetavec=2*pi.*Nvec3./(N);
dwvec=thetavec./(del*2*pi*3E10); % in wavenumbers
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

output=0;
flag=0;

%The axes of the *transformed* response spectra are computed here.

    p1trowmax=w1vec(length(w1vec))-w1w2vec(1);
    p1trowmin=w1vec(1)-w1w2vec(length(w1w2vec));
    p1trowvec=(p1trowmin:dw:p1trowmax);
    p1txvec=w1vec;
    p1tyvec=p1trowvec;
    p1txvechot=p1txvec-anharm1;
    p1tyvechot=p1tyvec-anharm2;

    p2tcolmax=w2vec(length(w2vec))+w1w2vec(length(w1w2vec));
    p2tcolmin=w2vec(1)+w1w2vec(1);
    p2tcolvec=(p2tcolmin:dw:p2tcolmax);
    p2txvec=p2tcolvec;
    p2tyvec=w2vec;
    p2txvechot=p2txvec-anharm1;
    p2tyvechot=p2tyvec-anharm2;

    p3trowmax=w1vec(length(w1vec))-w1w2p3vec(1);
    p3trowmin=w1vec(1)-w1w2p3vec(length(w1w2p3vec));
    p3trowvec=(p3trowmin:dw:p3trowmax);
    p3txvec=w1vec;
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
% transformed w1 vectors of each process, including the hot bands.  This vector,
% being of the first frequency for w2, is used for all later w2 values.
    vec12=vecadd3(p1txvec,p2txvec);
    vec123=vecadd3(vec12,p3txvec);
    vec123c1=vecadd3(vec123,pcarsvec);
    vec123c1c2=vecadd3(vec123c1,pcarsrefvec);
    vec123c1c2c3=vecadd3(vec123c1c2,pcarsaltvec);
    vec123a1=vecadd3(vec123c1c2c3,p1txvechot);
    vec123a1a2=vecadd3(vec123a1,p2txvechot);
    vec123a1a2a3=vecadd3(vec123a1a2,p3txvechot);

    finalvec=vec123a1a2a3;
        
    %output arrays are initialized here.
    Nfinal=length(finalvec);
    psum=zeros(1,Nfinal);
    psummat=repmat(0,[Nfinal Numw2]);
    xvecmat=repmat(0,[Nfinal Numw2]);
    yvecmat=repmat(0,[Nfinal Numw2]);


% This section calculates M factors for the sample using Dk and Dalpha data from an 
% output file of a separate program.  M factors do not include exp(-0.5 alpha4*thickness)
% term.
%---------------------------------------------------------------------

    xvecmattemp=expandcol(finalvec',Numw2); 
    yvecmattemp=expandrow(w2axis,Nfinal);
    w4mat=xvecmattemp-yvecmattemp+w3;

    nsvis=load(nsvisfile); %sample/solvent visible refractive index data
    nsir=load(nsirfile); % sample/solvent ir refractive index data.  Adds offset if necessary.
    alphas=load(emsfile); % sample/solvent ir extinct. coeff. data
    respPMT=load(pmtqefile); % response of detector.  Current file is inaccurate, coming
										% from a Thorn EMI book.  Does not
										% include monochromator throughput changes.

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
        dkfwmat=sqrt((kfw1x-kfw2xmat+kfw3x).^2 + (kfw1ymat-kfw2ymat+kfw3y).^2)-kfw4mat;
        dalphafwmat=(alpha1fwmat+alpha2fwmat+alpha3fw-alpha4fw)/2;
    
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
    dksmat=sqrt((ks1x-ks2xmat+ks3x).^2 + (ks1ymat-ks2ymat+ks3y).^2)-ks4mat;
    dalphasmat=(alpha1smat+alpha2smat+alpha3s-alpha4s)/2;

    Ms=exp(i.*dkfwmat.*lfw).*exp(-dalphafwmat.*lfw).*(exp((i.*dksmat-dalphasmat).*ls)-1)./(ls.*(i.*dksmat-dalphasmat)); % check sign of 2nd term
    %Ms=ones(size(dksmat)); %turn on for testing w/o M factor

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
        dkbwmat=sqrt((kbw1x-kbw2xmat+kbw3x).^2 + (kbw1ymat-kbw2ymat+kbw3y).^2)-kbw4mat;
        dalphabwmat=(alpha1bwmat+alpha2bwmat+alpha3bw-alpha4bw)/2;
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
    %lent=1; %set to 1 for debugging

    for b=1:lent
        if (output == 0)
	        [b,lent]   
	        t=tvec(b);
	        %t=0;  %set to 0 for debugging

% the following ifft subroutines are the main, slow steps of the code.

%A transformation matrix converts p1,p2,p3 into the proper axes to (w1,w2).  
%These transformations are also slow,
%since it appears that Matlab has no built-in functions that skew matrices 
%(visually, from a "square" to a "parallelogram"). A C subroutine is used
%for transformations, since for loops in Matlab are slow.  In the future,
%a pattern may be found for the index manipulations necessary for the 
%transform, so that a matlab routine may eventually be used.
	   

            if (A1 ~= 0)
    	        p1=A1.*Nsam.*DOVEd1(Params,Eflag,t1t2vec,t).*dtf;
	            p1trans=p1transform(p1);
	            clear('p1');
            else
                p1trans=repmat(0,[length(p1tyvec)+1 length(p1txvec)]);
            end
    
            if (A2 ~= 0)
                p2=A2.*Nsam.*DOVEd2(Params,Eflag,t1t2vec,t).*dtf;
	            p2trans=p2transform(p2);
	            clear('p2');
            else
                p2trans=repmat(0,[length(p2tyvec) length(p2txvec)+1]);
            end

            if (A3 ~= 0)
                p3=A3*Nsam*DOVEdDR(Params,Eflag,t1t2vec,t)*dtf;
	            p3trans=p1transform(p3);
	            clear('p3');
            else
                p3trans=repmat(0,[length(p3tyvec)+1 length(p3txvec)]);
            end

            if (Acars ~= 0)
                pcars=Acars*Nsam*CARSd(Params,Eflag,t1t2vec,t)*dtf;
            else
                pcars=zeros(1,length(pcarsvec));
            end

	        pcarsref=Acarsref*Nref*CARSrefd(Params,Eflag,t1t2vec,t)*dtf;

            if (Acarsalt ~= 0)
                pcarsalt=Acarsalt*Nalt*CARSaltd(Params,Eflag,t1t2vec,t)*dtf;
            else
                pcarsalt=zeros(1,length(pcarsaltvec));
            end

	        pbgt=BGd(Params,Eflag,t)*dtf; 
            pbg=Bg*Nbg*pbgt;
	        pbgfw=Afw*pbgt;
            pbgbw=Abw*pbgt;
            psive=Asive*Nsam*SIVEw2d(Params,Eflag,t1t2vec,t)*dtf;
      
    
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

                pinit=zeros(1,length(finalvec));
% coherences added here at amplitude level for a given w1
                ptot1=vecadd2(pinit,finalvec,p1transvec,p1txvec);
		        ptot12=vecadd2(ptot1,finalvec,p2transvec,p2txvec);
		        ptot123=vecadd2(ptot12,finalvec,p3transvec,p3txvec);
		        ptot123c1=vecadd2(ptot123,finalvec,pcars,pcarsvec);
		        ptot123c1c2=vecadd2(ptot123c1,finalvec,pcarsref,pcarsrefvec);
		        ptot123c1c2c3=vecadd2(ptot123c1c2,finalvec,pcarsalt,pcarsaltvec);
		        ptot123a1=vecadd2(ptot123c1c2c3,finalvec,p1transvechot,p1txvechot);
		        ptot123a1a2=vecadd2(ptot123a1,finalvec,p2transvechot,p2txvechot);
		        ptot123a1a2a3=vecadd2(ptot123a1a2,finalvec,p3transvechot,p3txvechot);

		        ptot=ptot123a1a2a3;
                pbgfin=pbg;
                
		        ptotal=ptot+psiveelem+pbgfin;  
                
                Msv=Ms(:,c).';
        
                if (lfw ~= 0)
                    Mfwv=Mfw(:,c).';
                else
                    Mfwv=0;
                end
        
                if (lbw ~= 0)
                    Mbwv=Mbw(:,c).';
                else
                    Mbwv=0;
                end
        
                PMTresp=respw4mat(:,c).';

%Now that all of the coherences are added, we can square the modulus and integrate
% over all time. "Integration" means that the mod square is added for all t's.
		        ptotfin=ptotal;
        
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
		            psummat(:,c)=psummat(:,c)+ptotconjfin.';
		            xvecmat(:,c)=finalvec.';
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
    Intfinmat=repmat(0,[Nfinal Numw2]);
%end

% this loop scales each of the w2 slices to the reference at wagref.
output=1;
flag=0;
if (output==0)
    for d=1:Numw2;
        searchrange=12;  % increase if CARS feature is heavily distorted or decrease 
                    % if CARS feature is well resolved from, but close to other
                    % peaks
        xv=xvecmat(:,d);
        w2s=w2axis(d);
        wsearch=wagref+w2s;
        Dtol=xv(2)-xv(1);
        nn=length(xv);
   
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
	    Intfinmat(:,d)=Intmat(:,d)/multp ; 
        end
    end
end

if (output==1)
    Intfinmat=Intmat;
end

% This section performs chi2 estimates and shows slices of data compared to
% simulation at key values, specified in the program.
if (squareson == 1)
    datax=load(dataxfile);
    datay=load(datayfile);
    dataz=load(datazfile);
    datainterped=(interp2(datax.',datay.',dataz.',xvecmat.',yvecmat.','linear')).';
    
    xind1=find( (xvecmat(:,1)-Dtol/2) <= datax(1,1) & datax(1,1) < (xvecmat(:,1)+Dtol/2));
    xind2=find( (xvecmat(:,1)-Dtol/2) <= datax(length(datax(:,1)),1) & datax(length(datax(:,1)),1) < (xvecmat(:,1)+Dtol/2));
    if (datax(length(datax(:,1)),1) > datax(1,1))
        if (isempty(xind1))
            xind1=1;
        end
        if (isempty(xind2))
            xind2=length(xvecmat(:,1));
        end
    else
        if (isempty(xind1))
            xind1=length(xvecmat(:,1));
        end
        if (isempty(xind2))
            xind2=1;
        end 
    end
    minx=min([xind1 xind2]);
    maxx=max([xind1 xind2]);
       
    yind1=find( (yvecmat(1,:)-Dtol/2) <= datay(1,1) & datay(1,1) < (yvecmat(1,:)+Dtol/2));
    yind2=find( (yvecmat(1,:)-Dtol/2) <= datay(1,length(datay(1,:))) & datay(1,length(datay(1,:))) < (yvecmat(1,:)+Dtol/2));
    if (datay(1,length(datay(1,:))) > datay(1,1))
        if (isempty(yind1))
            yind1=1;
        end
        if (isempty(yind2))
            yind2=length(yvecmat(1,:));
        end
    else
        if (isempty(yind1))
            yind1=length(yvecmat(1,:));
        end
        if (isempty(yind2))
            yind2=1;
        end 
    end
    miny=min([yind1 yind2]);
    maxy=max([yind1 yind2]);
        
    Intfinleast=Intfinmat((minx+1):(maxx-1),(miny+1):(maxy-1));
    dataintleast=datainterped((minx+1):(maxx-1),(miny+1):(maxy-1));
    subtraction=(Intfinleast-dataintleast);
    leastsquares=(subtraction).^2;
    sum_of_least_squares=sum(sum(leastsquares))
    
    figure(3)
    contourf(datax,datay,dataz,20);
    h1=get(gca,'Title');
    set(h1,'String','original data');
    figure(4)
    contourf(xvecmat,yvecmat,datainterped,20);
    h2=get(gca,'Title');
    set(h2,'String','data interpolated to sim');
    
    
    %add more slices below by cut and paste
    w2_plotslice1=1540;  % can be a numeric
    Dtol2=yvecmat(1,2)-yvecmat(1,1);
    Dtol3=abs(datay(1,2)-datay(1,1));
    
    slice1index1=find( (yvecmat(1,:)-Dtol2/2) <= w2_plotslice1 & w2_plotslice1 < (yvecmat(1,:)+Dtol2/2));
    simslice1=Intfinmat(:,slice1index1);
    
    slice2index1=find( (datay(1,:)-Dtol3/2) <= w2_plotslice1 & w2_plotslice1 < (datay(1,:)+Dtol3/2));
    xdataslice1=datax(:,slice2index1);
    zdataslice1=dataz(:,slice2index1);
    
    figure(6)
    plot(xvecmat(:,1),simslice1,'-b');
    hold on
    plot(xdataslice1,zdataslice1,'or');
    hold off
    
    %w2_plotslice2=1500;
    %slice1index2=...
    %etc.
end

figure(5)

    contourf(xvecmat,yvecmat,Intfinmat,20);
    h2=get(gca,'Title');
    set(h2,'String','Simulation');
    axis([2000 2300 1400 1600])
if (output == 0)
    save(outfilex,'xvecmat','-ascii','-double','-tabs');
    save(outfiley,'yvecmat','-ascii','-double','-tabs');
    save(outfilez,'Intfinmat','-ascii','-double','-tabs');
else
    disp('Data not saved.');
end

    
    
