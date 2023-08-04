function frontpanelload()

% loads saved -mat file and dumps parameters into GUI

loadparamsst=findobj('Tag','loadparams');
loadparamfile=get(loadparamsst,'String');
loadparamfilef=[loadparamfile,'.txt'];
Inputs=load(loadparamfilef,'-mat');

params=Inputs.Params;
subparams=Inputs.Subparams;
fileparams2=Inputs.Fileparams2;
wvec=Inputs.wvec;

wcg=params(16);
wbg=params(17);
wag=params(18);
wagref=params(21);
wagalt=params(27);
Gcg=params(12);
Gbg=params(14);
Gag=params(15);
Gcb=params(13);
Gagref=params(22);
Gagalt=params(28);
AdoveIR1=params(6);
AdoveIR2=params(7);
AdoveRaman=params(8);
Asivew2=params(30);
Acars=params(9);
Abackgd=params(11);
Acarsref=params(10);
Acarsalt=params(29);
sigmaw1=params(3);
sigmaw2=params(4);
sigmaw3=params(5);
delay21=params(2);
delay32=params(1);
w1begin=wvec(1);
w1end=wvec(2);
w2begin=wvec(3);
w2end=wvec(4);
w2spacing=wvec(5);
w3=params(36);
upperlimt=params(19);
dt=params(20);
dtfinalint=subparams(1);
sampleconc=params(32);
backgdconc=params(33);
refconc=params(34);
altconc=params(35);
thksamp=params(25);
Afrntwin=params(31);
thkfrntwin=params(26);
Abackwin=subparams(6);
thkbackwin=subparams(5);
nsamploffset=subparams(9);
nxintercept=subparams(7);
dataoffset=subparams(8);
theta21air=params(23);
theta31air=-params(24);
hotbandanharmw1=subparams(2);
hotbandanharmw2=subparams(3);
Aratiohotbandtomain=subparams(4);

nsampleIRfile=fileparams2.samnir;
emsampleIRfile=fileparams2.samem;
nsamplevisfile=fileparams2.samnvis;
nfrntwinvisfile=fileparams2.fwnvis;
nfrntwinIRfile=fileparams2.fwnir;
emfrntwinIRfile=fileparams2.fwem;
nbackwinvisfile=fileparams2.bwnvis;
nbackwinIRfile=fileparams2.bwnir;
embackwinIRfile=fileparams2.bwem;
detectortotalQEfile=fileparams2.PMT;
outfilepre=fileparams2.outfilepre;

wcgst=findobj('Tag','wcg');
set(wcgst,'String',num2str(wcg));
wbgst=findobj('Tag','wbg');
set(wbgst,'String',num2str(wbg));
wagst=findobj('Tag','wag');
set(wagst,'String',num2str(wag));
wagrefst=findobj('Tag','wagref');
set(wagrefst,'String',num2str(wagref));
wagaltst=findobj('Tag','wagalt');
set(wagaltst,'String',num2str(wagalt));

Gcgst=findobj('Tag','Gcg');
set(Gcgst,'String',num2str(Gcg));
Gbgst=findobj('Tag','Gbg');
set(Gbgst,'String',num2str(Gbg));
Gagst=findobj('Tag','Gag');
set(Gagst,'String',num2str(Gag));
Gcbst=findobj('Tag','Gcb');
set(Gcbst,'String',num2str(Gcb));
Gagrefst=findobj('Tag','Gagref');
set(Gagrefst,'String',num2str(Gagref));
Gagaltst=findobj('Tag','Gagalt');
set(Gagaltst,'String',num2str(Gagalt));

ADIR1st=findobj('Tag','ADIR1');
set(ADIR1st,'String',num2str(AdoveIR1));
ADIR2st=findobj('Tag','ADIR2');
set(ADIR2st,'String',num2str(AdoveIR2));
ADRamst=findobj('Tag','ADRam');
set(ADRamst,'String',num2str(AdoveRaman));
ASIVEst=findobj('Tag','ASIVE');
set(ASIVEst,'String',num2str(Asivew2));
ACARSst=findobj('Tag','ACARS');
set(ACARSst,'String',num2str(Acars));
Abgst=findobj('Tag','Abg');
set(Abgst,'String',num2str(Abackgd));
ACARSrefst=findobj('Tag','ACARSref');
set(ACARSrefst,'String',num2str(Acarsref));
ACARSaltst=findobj('Tag','ACARSalt');
set(ACARSaltst,'String',num2str(Acarsalt));

sigw1st=findobj('Tag','sigw1');
set(sigw1st,'String',num2str(sigmaw1));
sigw2st=findobj('Tag','sigw2');
set(sigw2st,'String',num2str(sigmaw2));
sigw3st=findobj('Tag','sigw3');
set(sigw3st,'String',num2str(sigmaw3));
T21st=findobj('Tag','T21');
set(T21st,'String',num2str(delay21));
T32st=findobj('Tag','T32');
set(T32st,'String',num2str(delay32));

w1begst=findobj('Tag','w1beg');
set(w1begst,'String',num2str(w1begin));
w1endst=findobj('Tag','w1end');
set(w1endst,'String',num2str(w1end));
w2begst=findobj('Tag','w2beg');
set(w2begst,'String',num2str(w2begin));
w2endst=findobj('Tag','w2end');
set(w2endst,'String',num2str(w2end));
w2spst=findobj('Tag','w2sp');
set(w2spst,'String',num2str(w2spacing));
w3st=findobj('Tag','w3');
set(w3st,'String',num2str(w3));

Nsamst=findobj('Tag','Nsam');
set(Nsamst,'String',num2str(sampleconc));
Nbgst=findobj('Tag','Nbg');
set(Nbgst,'String',num2str(backgdconc));
Nrefst=findobj('Tag','Nref');
set(Nrefst,'String',num2str(refconc));
Naltst=findobj('Tag','Nalt');
set(Naltst,'String',num2str(altconc));

Ttotst=findobj('Tag','Ttot');
set(Ttotst,'String',num2str(upperlimt));
dtst=findobj('Tag','dt');
set(dtst,'String',num2str(dt));
dtfst=findobj('Tag','dtf');
set(dtfst,'String',num2str(dtfinalint));

lsst=findobj('Tag','ls');
set(lsst,'String',num2str(thksamp));
lfwst=findobj('Tag','lfw');
set(lfwst,'String',num2str(thkfrntwin));
lbwst=findobj('Tag','lbw');
set(lbwst,'String',num2str(thkbackwin));
Afwst=findobj('Tag','Afw');
set(Afwst,'String',num2str(Afrntwin));
Abwst=findobj('Tag','Abw');
set(Abwst,'String',num2str(Abackwin));

anharmw1st=findobj('Tag','anharmw1');
set(anharmw1st,'String',num2str(hotbandanharmw1));
anharmw2st=findobj('Tag','anharmw2');
set(anharmw2st,'String',num2str(hotbandanharmw2));
Ratiost=findobj('Tag','Ratio');
set(Ratiost,'String',num2str(Aratiohotbandtomain));
theta21st=findobj('Tag','theta21');
set(theta21st,'String',num2str(theta21air));
theta31st=findobj('Tag','theta31');
set(theta31st,'String',num2str(theta31air));

nsamoffst=findobj('Tag','nsamoff');
set(nsamoffst,'String',num2str(nsamploffset));
xintbgst=findobj('Tag','xintbg');
set(xintbgst,'String',num2str(nxintercept));
offsetst=findobj('Tag','offset');
set(offsetst,'String',num2str(dataoffset));

nsampleIRfile=fileparams2.samnir;
emsampleIRfile=fileparams2.samem;
nsamplevisfile=fileparams2.samnvis;
nfrntwinvisfile=fileparams2.fwnvis;
nfrntwinIRfile=fileparams2.fwnir;
emfrntwinIRfile=fileparams2.fwem;
nbackwinvisfile=fileparams2.bwnvis;
nbackwinIRfile=fileparams2.bwnir;
embackwinIRfile=fileparams2.bwem;
detectortotalQEfile=fileparams2.PMT;
outfilepre=fileparams2.outfilepre;

samnvisfilest=findobj('Tag','samnvisfile');
set(samnvisfilest,'String',nsamplevisfile);
samnirfilest=findobj('Tag','samnirfile');
set(samnirfilest,'String',nsampleIRfile);
samemfilest=findobj('Tag','samemfile');
set(samemfilest,'String',emsampleIRfile);

outfilest=findobj('Tag','outfilepre');
set(outfilest,'String',outfilepre);

pmtQEfilest=findobj('Tag','PMTqefile');
set(pmtQEfilest,'String',detectortotalQEfile);

fwnvisfilest=findobj('Tag','fwnvisfile');
set(fwnvisfilest,'String',nfrntwinvisfile);
fwnirfilest=findobj('Tag','fwnirfile');
set(fwnirfilest,'String',nfrntwinIRfile);
fwemfilest=findobj('Tag','fwemfile');
set(fwemfilest,'String',emfrntwinIRfile);

bwnvisfilest=findobj('Tag','bwnvisfile');
set(bwnvisfilest,'String',nbackwinvisfile);
bwnirfilest=findobj('Tag','bwnirfile');
set(bwnirfilest,'String',nbackwinIRfile);
bwemfilest=findobj('Tag','bwemfile');
set(bwemfilest,'String',embackwinIRfile);
return
