function DOVEload()

% loads saved -mat file and dumps parameters into GUI
wcg=Params.solute.freqs.wcg;
wbg=Params.solute.freqs.wbg;
wag=Params.solute.freqs.wag; 
Gcg=Params.solute.popgammas.Gcg;
Gbg=Params.solute.popgammas.Gbg;
Gag=Params.solute.popgammas.Gag;
Gcb=Params.solute.popgammas.Gcb;
ADIR1=Params.solute.coeff.ADIR1;
ADIR2=Params.solute.coeff.ADIR2;
ADRam=Params.solute.coeff.ADRam;
ACARS=Params.solute.coeff.ACARS;
ASIVE=Params.solute.coeff.ASIVE;
lbg=Params.solute.biglambdas.lbg;
lag=Params.solute.biglambdas.lag; 
kbg=Params.solute.kappas.kbg=kbg;
kag=Params.solute.kappas.kag=kag;
eta=Params.solute.correlations.eta;
anharmw1=Params.solute.hotband.anharmw1;
anharmw2=Params.solute.hotband.anharmw2;
ratio=Params.solute.hotband.ratio;
Nsam=Params.solute.conc.Nsam;

wagref=Params.solvent.freqs.wagref;
wagalt=Params.solvent.freqs.wagalt;
Gagref=Params.solvent.popgammas.Gagref;
Gagalt=Params.solvent.popgammas.Gagalt;
ACARSref=Params.solvent.coeff.ACARSref;
ACARSalt=Params.solvent.coeff.ACARSalt;
Nref=Params.solvent.conc.Nref;
Nalt=Params.solvent.conc.Nalt;

I1FWHM=Params.fields.I1FWHM;
I2FWHM=Params.fields.I2FWHM;
I3FWHM=Params.fields.I3FWHM;
T21=Params.fields.T21;
T32=Params.fields.T32;

nyquist=Params.plot.nyquist;
resn=Params.plot.resolution; 
w2beg=Params.plot.w2beginning;
w2end=Params.plot.w2end;
w2sp=Params.plot.w2spacing;
w3=Params.plot.w3;

Afw=Params.cell.front.Afw;
lfw=Params.cell.front.lfw;
Abg=Params.cell.sample.Abg;  
ls=Params.cell.sample.ls;
Abw=Params.cell.back.Abw;
lbw=Params.cell.back.lbw;
theta21=Params.cell.angles.theta21;
theta31o=Params.cell.angles.theta31;

theta31=-theta31o;

squareson=Params.misc.squareson;

pathprefix=Params.loadfile.path=pathprefix;
fwnvisfile=Params.loadfile.fwnvisfile;
fwnirfile=Params.loadfile.fwnirfile;
fwemfile=Params.loadfile.fwemfile;
samnvisfile=Params.loadfile.sampnvisfile;
samnirfile=Params.loadfile.sampnirfile;
samemfile=Params.loadfile.sampemfile;
bwnvisfile=Params.loadfile.bwnvisfile;
bwnirfile=Params.loadfile.bwnirfile;
bwemfile=Params.loadfile.bwemfile;
pmtQEfile=Params.loadfile.QEfile;
datfile=Params.loadfile.datafile;
outfilepre=Params.loadfile.outfile;

wcgst=findobj('Tag','wcg');
set(wcgst,'String',num2str(wcg));
wbgst=findobj('Tag','wbg');
set(wbgst,'String',num2str(wbg));
wagst=findobj('Tag','wag');
set(wagst,'String',num2str(wag));
Gcgst=findobj('Tag','Gcg');
set(Gcgst,'String',num2str(Gcg));
Gbgst=findobj('Tag','Gbg');
set(Gbgst,'String',num2str(Gbg));
Gagst=findobj('Tag','Gag');
set(Gagst,'String',num2str(Gag));
Gcbst=findobj('Tag','Gcb');
set(Gcbst,'String',num2str(Gcb));
ADIR1st=findobj('Tag','ADIR1');
set(ADIR1st,'String',num2str(ADIR1));
ADIR2st=findobj('Tag','ADIR2');
set(ADIR2st,'String',num2str(ADIR2));
ADRamst=findobj('Tag','ADRam');
set(ADRamst,'String',num2str(ADRam));
ASIVEst=findobj('Tag','ASIVE');
set(ASIVEst,'String',num2str(ASIVE));
ACARSst=findobj('Tag','ACARS');
set(ACARSst,'String',num2str(ACARS));
lambdabgst=findobj('Tag','lambdabg');
set(lambdabgst,'String',num2str(lbg));
lambdaagst=findobj('Tag','lambdaag');
set(lambdaagst,'String',num2str(lag));
kappabgst=findobj('Tag','kappabg');
set(kappabgst,'String',num2str(kbg));
kappaagst=findobj('Tag','kappaag');
set(kappaagst,'String',num2str(kag));
etaabst=findobj('Tag','etaab');
set(kappaagst,'String',num2str(eta));
anharmw1st=findobj('Tag','anharmw1');
set(anharmw1st,'String',num2str(anharmw1));
anharmw2st=findobj('Tag','anharmw2');
set(anharmw2st,'String',num2str(anharmw2));
Ratiost=findobj('Tag','Ratio');
set(Ratiost,'String',num2str(ratio));
Nsamst=findobj('Tag','Nsam');
set(Nsamst,'String',num2str(sampleconc));

Gagrefst=findobj('Tag','Gagref');
set(Gagrefst,'String',num2str(Gagref));
Gagaltst=findobj('Tag','Gagalt');
set(Gagaltst,'String',num2str(Gagalt));
ACARSrefst=findobj('Tag','ACARSref');
set(ACARSrefst,'String',num2str(ACARSref));
ACARSaltst=findobj('Tag','ACARSalt');
set(ACARSaltst,'String',num2str(ACARSalt));
Nrefst=findobj('Tag','Nref');
set(Nrefst,'String',num2str(Nref));
Naltst=findobj('Tag','Nalt');
set(Naltst,'String',num2str(Nalt));

sigw1st=findobj('Tag','sigw1');
set(sigw1st,'String',num2str(I1FWHM));
sigw2st=findobj('Tag','sigw2');
set(sigw2st,'String',num2str(I2FWHM));
sigw3st=findobj('Tag','sigw3');
set(sigw3st,'String',num2str(I3FWHM));
T21st=findobj('Tag','T21');
set(T21st,'String',num2str(T12));
T32st=findobj('Tag','T32');
set(T32st,'String',num2str(T23));

nyqst=findobj('Tag','Nyq');
set(Ttotst,'String',num2str(nyquist));
resst=findobj('Tag','res');
set(resst,'String',num2str(resn));
w2begst=findobj('Tag','w2beg');
set(w2begst,'String',num2str(w2beg));
w2endst=findobj('Tag','w2end');
set(w2endst,'String',num2str(w2end));
w2spst=findobj('Tag','w2sp');
set(w2spst,'String',num2str(w2sp));
w3st=findobj('Tag','w3');
set(w3st,'String',num2str(w3));

Abgst=findobj('Tag','Abg');
set(Abgst,'String',num2str(Abg));
samnvisfilest=findobj('Tag','samnvisfile');
set(samnvisfilest,'String',samnvisfile);
samnirfilest=findobj('Tag','samnirfile');
set(samnirfilest,'String',samnirfile);
samemfilest=findobj('Tag','samemfile');
set(samemfilest,'String',samemfile);
lsst=findobj('Tag','ls');
set(lsst,'String',num2str(ls));
Nbgst=findobj('Tag','Nbg');
set(Nbgst,'String',num2str(Nbg));

Afwst=findobj('Tag','Afw');
set(Afwst,'String',num2str(Afw));
lfwst=findobj('Tag','lfw');
set(lfwst,'String',num2str(lfw));
fwnvisfilest=findobj('Tag','fwnvisfile');
set(fwnvisfilest,'String',fwnvisfile);
fwnirfilest=findobj('Tag','fwnirfile');
set(fwnirfilest,'String',fwnirfile);
fwemfilest=findobj('Tag','fwemfile');
set(fwemfilest,'String',fwemfile);

Abwst=findobj('Tag','Abw');
set(Abwst,'String',num2str(Abw));
lbwst=findobj('Tag','lbw');
set(lbwst,'String',num2str(lbw));
bwnvisfilest=findobj('Tag','bwnvisfile');
set(bwnvisfilest,'String',bwnvisfile);
bwnirfilest=findobj('Tag','bwnirfile');
set(bwnirfilest,'String',bwnirfile);
bwemfilest=findobj('Tag','bwemfile');
set(bwemfilest,'String',bwemfile);

pmtQEfilest=findobj('Tag','PMTqefile');
set(pmtQEfilest,'String',pmtQEfile);

theta21st=findobj('Tag','theta21');
set(theta21st,'String',num2str(theta21));
theta31st=findobj('Tag','theta31');
set(theta31st,'String',num2str(theta31));

outfilest=findobj('Tag','outfilepre');
set(outfilest,'String',outfilepre);
pathst=findobj('Tag','path');
set(pathst,'String',pathprefix);
datafilest=findobj('Tag','datafile');
set(datafilest,'String',datfile);
leastonst=findobj('Tag','leastsquareson');
set(leastonst,'Value',squareson);

return
