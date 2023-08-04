function saveuser(params,subparams,fileparams,wvec,outfilepre,outputfile)

% displays parameter information to screen to be copied and pasted.
disstr=strcat('The parameters used for the file  ', outfilepre,' are (copy and paste these):');
disp(disstr)
disp('-------------------------------------------------')

wcg=params(16)
wbg=params(17)
wag=params(18)
wagref=params(21)
wagalt=params(27)
Gcg=params(12)
Gbg=params(14)
Gag=params(15)
Gcb=params(13)
Gagref=params(22)
Gagalt=params(28)
AdoveIR1=params(6)
AdoveIR2=params(7)
AdoveRaman=params(8)
Asivew2=params(30)
Acars=params(9)
Abackgd=params(11)
Acarsref=params(10)
Acarsalt=params(29)
sigmaw1=params(3)
sigmaw2=params(4)
sigmaw3=params(5)
delay21=params(2)
delay32=params(1)
w1begin=wvec(1)
w1end=wvec(2)
w2begin=wvec(3)
w2end=wvec(4)
w2spacing=wvec(5)
w3=params(36)
upperlimt=params(19)
dt=params(20)
dtfinalint=subparams(1)
sampleconc=params(32)
backgdconc=params(33)
refconc=params(34)
altconc=params(35)
thksamp=params(25)
Afrntwin=params(31)
thkfrntwin=params(26)
Abackwin=subparams(6)
thkbackwin=subparams(5)
nsamploffset=subparams(9)
nxintercept=subparams(7)
dataoffset=subparams(8)
theta21air=params(23)
theta31air=-params(24)
hotbandanharmw1=subparams(2)
hotbandanharmw2=subparams(3)
Aratiohotbandtomain=subparams(4)

nsampleIRfile=fileparams.samnvis
emsampleIRfile=fileparams.samnir
nsamplevisfile=fileparams.samem
nfrntwinvisfile=fileparams.fwnvis
nfrntwinIRfile=fileparams.fwnir
emfrntwinIRfile=fileparams.fwem
nbackwinvisfile=fileparams.bwnvis
nbackwinIRfile=fileparams.bwnir
embackwinIRfile=fileparams.bwem
detectortotalQEfile=fileparams.PMT

disp('-------------------------------------------------')
return
