function frontpanelcmpt

% part of frontpanel.fig...converts values in GUI into parameters 
% to be plugged into an m file, 'GaussHomogFWM.m'.

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
Gagrefst=findobj('Tag','Gagref');
Gagref=eval(get(Gagrefst,'String'));
Gagaltst=findobj('Tag','Gagalt');
Gagalt=eval(get(Gagaltst,'String'));

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
Abgst=findobj('Tag','Abg');
Abg=eval(get(Abgst,'String'));
ACARSrefst=findobj('Tag','ACARSref');
ACARSref=eval(get(ACARSrefst,'String'));
ACARSaltst=findobj('Tag','ACARSalt');
ACARSalt=eval(get(ACARSaltst,'String'));

sigw1st=findobj('Tag','sigw1');
sigw1=eval(get(sigw1st,'String'));
E1flag0st=findobj('Tag','E1flag0');
%E1flag0=eval(get(E1flag0st,'String'));
E1flag1st=findobj('Tag','E1flag1');
%E1flag1=eval(get(E1flag1st,'String'));
sigw2st=findobj('Tag','sigw2');
sigw2=eval(get(sigw2st,'String'));
E2flag0st=findobj('Tag','E2flag0');
%E2flag0=eval(get(E2flag0st,'String'));
E2flag1st=findobj('Tag','E2flag1');
%E2flag1=eval(get(E2flag1st,'String'));



sigw3st=findobj('Tag','sigw3');
sigw3=eval(get(sigw3st,'String'));
T21st=findobj('Tag','T21');
T21=eval(get(T21st,'String'));
T32st=findobj('Tag','T32');
T32=eval(get(T32st,'String'));

w1begst=findobj('Tag','w1beg');
w1beg=eval(get(w1begst,'String'));
w1endst=findobj('Tag','w1end');
w1end=eval(get(w1endst,'String'));
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

Ttotst=findobj('Tag','Ttot');
Ttot=eval(get(Ttotst,'String'));
dtst=findobj('Tag','dt');
dt=eval(get(dtst,'String'));
dtfst=findobj('Tag','dtf');
dtf=eval(get(dtfst,'String'));

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

anharmw1st=findobj('Tag','anharmw1');
anharmw1=eval(get(anharmw1st,'String'));
anharmw2st=findobj('Tag','anharmw2');
anharmw2=eval(get(anharmw2st,'String'));
Ratiost=findobj('Tag','Ratio');
Ratio=eval(get(Ratiost,'String'));
theta21st=findobj('Tag','theta21');
theta21=eval(get(theta21st,'String'));
theta31st=findobj('Tag','theta31');
theta31=eval(get(theta31st,'String'));

nsamoffst=findobj('Tag','nsamoff');
nsamoff=eval(get(nsamoffst,'String'));
xintbgst=findobj('Tag','xintbg');
xintbg=eval(get(xintbgst,'String'));
offsetst=findobj('Tag','offset');
offset=eval(get(offsetst,'String'));

%minor conversions to input params take place here.
theta31o=-theta31;
w2vec=(w2beg:w2sp:w2end);

% params here
Params=[T32,T21,sigw1,sigw2,sigw3,ADIR1,ADIR2,ADRam,ACARS,ACARSref,Abg,Gcg,Gcb,Gbg,Gag,...
        wcg,wbg,wag,Ttot,dt,wagref,Gagref,theta21,theta31o,ls,lfw,wagalt,Gagalt,ACARSalt,...
        ASIVE,Afw,Nsam,Nbg,Nref,Nalt,w3];

Subparams=[dtf,anharmw1,anharmw2,Ratio,lbw,Abw,xintbg,offset,nsamoff];

% filename string array created
samnvisfilest=findobj('Tag','samnvisfile');
samnvisfile=get(samnvisfilest,'String');
samnvisfilef=[samnvisfile,'.txt'];
samnirfilest=findobj('Tag','samnirfile');
samnirfile=get(samnirfilest,'String');
samnirfilef=[samnirfile,'.txt'];
samemfilest=findobj('Tag','samemfile');
samemfile=get(samemfilest,'String');
samemfilef=[samemfile,'.txt'];

outfilest=findobj('Tag','outfilepre');
outfilepre=get(outfilest,'String');
outfilex=[outfilepre,'x.txt'];
outfiley=[outfilepre,'y.txt'];
outfilez=[outfilepre,'z.txt'];
saveparamfile=[outfilepre,'p.txt'];
userparamfile=[outfilepre,'userparams.txt'];

pmtQEfilest=findobj('Tag','PMTqefile');
pmtQEfile=get(pmtQEfilest,'String');
pmtQEfilef=[pmtQEfile,'.txt'];

fwnvisfilest=findobj('Tag','fwnvisfile');
fwnvisfile=get(fwnvisfilest,'String');
fwnvisfilef=[fwnvisfile,'.txt'];
fwnirfilest=findobj('Tag','fwnirfile');
fwnirfile=get(fwnirfilest,'String');
fwnirfilef=[fwnirfile,'.txt'];
fwemfilest=findobj('Tag','fwemfile');
fwemfile=get(fwemfilest,'String');
fwemfilef=[fwemfile,'.txt'];

bwnvisfilest=findobj('Tag','bwnvisfile');
bwnvisfile=get(bwnvisfilest,'String');
bwnvisfilef=[bwnvisfile,'.txt'];
bwnirfilest=findobj('Tag','bwnirfile');
bwnirfile=get(bwnirfilest,'String');
bwnirfilef=[bwnirfile,'.txt'];
bwemfilest=findobj('Tag','bwemfile');
bwemfile=get(bwemfilest,'String');
bwemfilef=[bwemfile,'.txt'];

Fileparams.samnvis=samnvisfilef;
Fileparams.samnir=samnirfilef;
Fileparams.samem=samemfilef;
Fileparams.outx=outfilex;
Fileparams.outy=outfiley;
Fileparams.outz=outfilez;
Fileparams.PMT=pmtQEfilef;
Fileparams.fwnvis=fwnvisfilef;
Fileparams.fwnir=fwnirfilef;
Fileparams.fwem=fwemfilef;
Fileparams.bwnvis=bwnvisfilef;
Fileparams.bwnir=bwnirfilef;
Fileparams.bwem=bwemfilef;

Fileparams2.samnvis=samnvisfile;
Fileparams2.samnir=samnirfile;
Fileparams2.samem=samemfile;
Fileparams2.outfilepre=outfilepre;
Fileparams2.PMT=pmtQEfile;
Fileparams2.fwnvis=fwnvisfile;
Fileparams2.fwnir=fwnirfile;
Fileparams2.fwem=fwemfile;
Fileparams2.bwnvis=bwnvisfile;
Fileparams2.bwnir=bwnirfile;
Fileparams2.bwem=bwemfile;

saveparamsst=findobj('Tag','saveparams');
saveparams=get(saveparamsst,'Value');


errorflag=GaussHomogFWM(Params,Subparams,w1beg,w1end,w2vec,Fileparams);

if (saveparams==1)
    if (errorflag==0)
    wvec=[w1beg;w1end;w2beg;w2end;w2sp];
    save(saveparamfile,'Params','Subparams','Fileparams2','wvec')
    saveuser(Params,Subparams,Fileparams,wvec,outfilepre,userparamfile)
    else
    disp('Warning: parameters not saved.')
    end
end

