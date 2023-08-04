function DOVEcmpt

% part of DOVE.fig...converts values in GUI into parameters 
% to be plugged into an m file, 'DOVEFWM.m'.

% numerical values converted here
wcgst=findobj('Tag','wcg');
wcg=eval(get(wcgst,'String'));
wbgst=findobj('Tag','wbg');
wbg=eval(get(wbgst,'String'));
wagst=findobj('Tag','wag');
wag=eval(get(wagst,'String'));
wagrefst=findobj('Tag','wagref');
wagref=eval(get(wagrefst,'String'));
wagaltst=findobj('Tag','wagalt');
wagalt=eval(get(wagaltst,'String'));
Gcgst=findobj('Tag','Gcg');
Gcg=eval(get(Gcgst,'String'));
Gbgst=findobj('Tag','Gbg');
Gbg=eval(get(Gbgst,'String'));
Gagst=findobj('Tag','Gag');
Gag=eval(get(Gagst,'String'));
Gcbst=findobj('Tag','Gcb');
Gcb=eval(get(Gcbst,'String'));
Gcgst=findobj('Tag','Gcg');
Gcg=eval(get(Gcgst,'String'));
Gbgst=findobj('Tag','Gbg');
Gbg=eval(get(Gbgst,'String'));
Gagst=findobj('Tag','Gag');
Gag=eval(get(Gagst,'String'));
Gcbst=findobj('Tag','Gcb');
Gcb=eval(get(Gcbst,'String'));
ADIR1st=findobj('Tag','ADIR1');
ADIR1=eval(get(ADIR1st,'String'));
ADIR2st=findobj('Tag','ADIR2');
ADIR2=eval(get(ADIR2st,'String'));
ADRamst=findobj('Tag','ADRam');
ADRam=eval(get(ADRamst,'String'));
ASIVEst=findobj('Tag','ASIVE');
ASIVE=eval(get(ASIVEst,'String'));
ACARSst=findobj('Tag','ACARS');
ACARS=eval(get(ACARSst,'String'));
lambdabgst=findobj('Tag','lambdabg');
lbg=eval(get(lambdabgst,'String'));
lambdaagst=findobj('Tag','lambdaag');
lag=eval(get(lambdaagst,'String'));
kappabgst=findobj('Tag','kappabg');
kbg=eval(get(kappabgst,'String'));
kappaagst=findobj('Tag','kappaag');
kag=eval(get(kappaagst,'String'));
etaabst=findobj('Tag','etaab');
eta=eval(get(etaabst,'String'));

anharmw1st=findobj('Tag','anharmw1');
anharmw1=eval(get(anharmw1st,'String'));
anharmw2st=findobj('Tag','anharmw2');
anharmw2=eval(get(anharmw2st,'String'));
Ratiost=findobj('Tag','Ratio');
Ratio=eval(get(Ratiost,'String'));

Gagrefst=findobj('Tag','Gagref');
Gagref=eval(get(Gagrefst,'String'));
Gagaltst=findobj('Tag','Gagalt');
Gagalt=eval(get(Gagaltst,'String'));
Abgst=findobj('Tag','Abg');
Abg=eval(get(Abgst,'String'));
ACARSrefst=findobj('Tag','ACARSref');
ACARSref=eval(get(ACARSrefst,'String'));
ACARSaltst=findobj('Tag','ACARSalt');
ACARSalt=eval(get(ACARSaltst,'String'));

I1FWHMst=findobj('Tag','sigw1');
I1FWHM=eval(get(I1FWHMst,'String'));
I1flag0st=findobj('Tag','E1flag0');
I1flag0=get(I1flag0st,'Value');
I1flag1st=findobj('Tag','E1flag1');
I1flag1=get(I1flag1st,'Value');

I2FWHMst=findobj('Tag','sigw2');
I2flag0st=findobj('Tag','E2flag0');
I2flag0=get(I2flag0st,'Value');
I2flag1st=findobj('Tag','E2flag1');
I2flag1=get(I2flag1st,'Value');

I2FWHM=eval(get(I2FWHMst,'String'));
I3FWHMst=findobj('Tag','sigw3');
I3FWHM=eval(get(I3FWHMst,'String'));
T21st=findobj('Tag','T21');
T21=eval(get(T21st,'String'));
T32st=findobj('Tag','T32');
T32=eval(get(T32st,'String'));

Nyqst=findobj('Tag','Nyq');
nyq=eval(get(Nyqst,'String'));
resst=findobj('Tag','res');
resn=eval(get(resst,'String'));
w2begst=findobj('Tag','w2beg');
w2beg=eval(get(w2begst,'String'));
w2endst=findobj('Tag','w2end');
w2end=eval(get(w2endst,'String'));
w2spst=findobj('Tag','w2sp');
w2sp=eval(get(w2spst,'String'));
w3st=findobj('Tag','w3');
w3=eval(get(w3st,'String'));

Nsamst=findobj('Tag','Nsam');
Nsam=eval(get(Nsamst,'String'));
Nbgst=findobj('Tag','Nbg');
Nbg=eval(get(Nbgst,'String'));
Nrefst=findobj('Tag','Nref');
Nref=eval(get(Nrefst,'String'));
Naltst=findobj('Tag','Nalt');
Nalt=eval(get(Naltst,'String'));
lsst=findobj('Tag','ls');
ls=eval(get(lsst,'String'));
lfwst=findobj('Tag','lfw');
lfw=eval(get(lfwst,'String'));
lbwst=findobj('Tag','lbw');
lbw=eval(get(lbwst,'String'));
Afwst=findobj('Tag','Afw');
Afw=eval(get(Afwst,'String'));
Abwst=findobj('Tag','Abw');
Abw=eval(get(Abwst,'String'));
theta21st=findobj('Tag','theta21');
theta21=eval(get(theta21st,'String'));
theta31st=findobj('Tag','theta31');
theta31=eval(get(theta31st,'String'));

%minor conversions to input params take place here.
theta31o=-theta31;

% filename strings concatenated here.
pathst=findobj('Tag','path');
pathprefix=get(pathst,'String');

samnvisfilest=findobj('Tag','samnvisfile');
samnvisfile=get(samnvisfilest,'String');
samnvisfilef=[pathprefix,samnvisfile,'.txt'];
samnirfilest=findobj('Tag','samnirfile');
samnirfile=get(samnirfilest,'String');
samnirfilef=[pathprefix,samnirfile,'.txt'];
samemfilest=findobj('Tag','samemfile');
samemfile=get(samemfilest,'String');
samemfilef=[pathprefix,samemfile,'.txt'];

fwnvisfilest=findobj('Tag','fwnvisfile');
fwnvisfile=get(fwnvisfilest,'String');
fwnvisfilef=[pathprefix,fwnvisfile,'.txt'];
fwnirfilest=findobj('Tag','fwnirfile');
fwnirfile=get(fwnirfilest,'String');
fwnirfilef=[pathprefix,fwnirfile,'.txt'];
fwemfilest=findobj('Tag','fwemfile');
fwemfile=get(fwemfilest,'String');
fwemfilef=[pathprefix,fwemfile,'.txt'];

bwnvisfilest=findobj('Tag','bwnvisfile');
bwnvisfile=get(bwnvisfilest,'String');
bwnvisfilef=[pathprefix,bwnvisfile,'.txt'];
bwnirfilest=findobj('Tag','bwnirfile');
bwnirfile=get(bwnirfilest,'String');
bwnirfilef=[pathprefix,bwnirfile,'.txt'];
bwemfilest=findobj('Tag','bwemfile');
bwemfile=get(bwemfilest,'String');
bwemfilef=[pathprefix,bwemfile,'.txt'];

pmtQEfilest=findobj('Tag','PMTqefile');
pmtQEfile=get(pmtQEfilest,'String');
pmtQEfilef=[pathprefix,pmtQEfile,'.txt'];

outfilest=findobj('Tag','outfilepre');
outfilepre=get(outfilest,'String');
outfilex=[outfilepre,'x.txt'];
outfiley=[outfilepre,'y.txt'];
outfilez=[outfilepre,'z.txt'];
saveparamfile=[outfilepre,'p.txt'];

leastsquaresonst=findobj('Tag','leastsquareson');
squareson=get(leastsquaresonst,'Value');
datafilest=findobj('Tag','datafile');
datfile=get(datafilest,'String');
dataxfilef=[datfile,'x.txt'];
datayfilef=[datfile,'y.txt'];
datazfilef=[datfile,'z.txt'];

% the following are test files and do not contain M factors.
outfilere=[outfilepre,'re.txt'];
outfileim=[outfilepre,'im.txt'];


% params here
Params.solute.freqs.wcg=wcg;
Params.solute.freqs.wbg=wbg;
Params.solute.freqs.wag=wag; 
Params.solute.popgammas.Gcg=Gcg;
Params.solute.popgammas.Gbg=Gbg;
Params.solute.popgammas.Gag=Gag;
Params.solute.popgammas.Gcb=Gcb;
Params.solute.coeff.ADIR1=ADIR1;
Params.solute.coeff.ADIR2=ADIR2;
Params.solute.coeff.ADRam=ADRam;
Params.solute.coeff.ACARS=ACARS;
Params.solute.coeff.ASIVE=ASIVE;
Params.solute.biglambdas.lbg=lbg;
Params.solute.biglambdas.lag=lag; 
Params.solute.kappas.kbg=kbg;
Params.solute.kappas.kag=kag;
Params.solute.correlations.eta=eta;
Params.solute.hotband.anharmw1=anharmw1;
Params.solute.hotband.anharmw2=anharmw2;
Params.solute.hotband.ratio=Ratio;
Params.solute.conc.Nsam=Nsam;

Params.solvent.freqs.wagref=wagref;
Params.solvent.freqs.wagalt=wagalt;
Params.solvent.popgammas.Gagref=Gagref;
Params.solvent.popgammas.Gagalt=Gagalt;
Params.solvent.coeff.ACARSref=ACARSref;
Params.solvent.coeff.ACARSalt=ACARSalt;
Params.solvent.conc.Nref=Nref;
Params.solvent.conc.Nalt=Nalt;

Params.fields.I1FWHM=I1FWHM;
Params.fields.I2FWHM=I2FWHM;
Params.fields.I3FWHM=I3FWHM;
Params.fields.E1flag0=I1flag0;
Params.fields.E1flag1=I1flag1;
Params.fields.E2flag0=I2flag0;
Params.fields.E2flag1=I2flag1;
Params.fields.T21=T21;
Params.fields.T32=T32;

Params.plot.nyquist=nyq;
Params.plot.resolution=resn; 
Params.plot.w2beginning=w2beg;
Params.plot.w2end=w2end;
Params.plot.w2spacing=w2sp;
Params.plot.w3=w3;

Params.cell.front.Afw=Afw;
Params.cell.front.lfw=lfw;
Params.cell.front.fwnvisfile=fwnvisfilef;
Params.cell.front.fwnirfile=fwnirfilef;
Params.cell.front.fwemfile=fwemfilef;
Params.cell.sample.Abg=Abg;  %sample's background located here
Params.cell.sample.Nbg=Nbg;  %sample's background solvent conc here
Params.cell.sample.ls=ls;
Params.cell.sample.sampnvisfile=samnvisfilef;
Params.cell.sample.sampnirfile=samnirfilef;
Params.cell.sample.sampemfile=samemfilef;
Params.cell.back.Abw=Abw;
Params.cell.back.lbw=lbw;
Params.cell.back.bwnvisfile=bwnvisfilef;
Params.cell.back.bwnirfile=bwnirfilef;
Params.cell.back.bwemfile=bwemfilef;
Params.cell.angles.theta21=theta21;
Params.cell.angles.theta31=theta31o;

Params.misc.QEfile=pmtQEfilef;
Params.misc.dataxfile=dataxfilef;
Params.misc.datayfile=datayfilef;
Params.misc.datazfile=datazfilef;

Params.misc.squareson=squareson;

Params.output.outfilex=outfilex;
Params.output.outfiley=outfiley;
Params.output.outfilez=outfilez;
Params.output.outfilere=outfilere;
Params.output.outfileim=outfileim;
Params.output.outparamfile=saveparamfile;

Params.loadfile.path=pathprefix;
Params.loadfile.fwnvisfile=fwnvisfile;
Params.loadfile.fwnirfile=fwnirfile;
Params.loadfile.fwemfile=fwemfile;
Params.loadfile.sampnvisfile=samnvisfile;
Params.loadfile.sampnirfile=samnirfile;
Params.loadfile.sampemfile=samemfile;
Params.loadfile.bwnvisfile=bwnvisfile;
Params.loadfile.bwnirfile=bwnirfile;
Params.loadfile.bwemfile=bwemfile;
Params.loadfile.QEfile=pmtQEfile;
Params.loadfile.datafile=datfile;
Params.loadfile.outfile=outfilepre;



% actual function call here
errorflag=DOVEFWM(Params); %change function from 'DOVEFWM' to
                        %'DOVEFWMtestmain' if testing DOVE shapes


saveparamsst=findobj('Tag','saveparams');
saveparams=get(saveparamsst,'Value');

if (saveparams==1)
    if (errorflag==0)
    save(saveparamfile,'Params')
    displayparams(Params,saveparamfile)
    else
    disp('Warning: parameters not saved.')
    end
end

