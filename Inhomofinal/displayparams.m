function displayparams(Params,outputfile)

% displays parameter information of DOVE.fig to be copied and pasted from screen.
disstr=strcat('The parameters used for the file  ', outputfile,' are (copy and paste these):');
disp(disstr)
disp('-------------------------------------------------')

wcg=Params.solute.freqs.wcg
wbg=Params.solute.freqs.wbg
wag=Params.solute.freqs.wag 
Gcg=Params.solute.popgammas.Gcg
Gbg=Params.solute.popgammas.Gbg
Gag=Params.solute.popgammas.Gag
Gcb=Params.solute.popgammas.Gcb
ADIR1=Params.solute.coeff.ADIR1
ADIR2=Params.solute.coeff.ADIR2
ADRam=Params.solute.coeff.ADRam
ACARS=Params.solute.coeff.ACARS
ASIVE=Params.solute.coeff.ASIVE
lbg=Params.solute.biglambdas.lbg
lag=Params.solute.biglambdas.lag 
kbg=Params.solute.kappas.kbg
kag=Params.solute.kappas.kag
eta=Params.solute.correlations.eta
anharmw1=Params.solute.hotband.anharmw1
anharmw2=Params.solute.hotband.anharmw2
ratio=Params.solute.hotband.ratio
Nsam=Params.solute.conc.Nsam

wagref=Params.solvent.freqs.wagref
wagalt=Params.solvent.freqs.wagalt
Gagref=Params.solvent.popgammas.Gagref
Gagalt=Params.solvent.popgammas.Gagalt
ACARSref=Params.solvent.coeff.ACARSref
ACARSalt=Params.solvent.coeff.ACARSalt
Nref=Params.solvent.conc.Nref
Nalt=Params.solvent.conc.Nalt

I1FWHM=Params.fields.I1FWHM
I2FWHM=Params.fields.I2FWHM
I3FWHM=Params.fields.I3FWHM
T21=Params.fields.T21
T32=Params.fields.T32

nyquist=Params.plot.nyquist
resolution=Params.plot.resolution 
w2beginning=Params.plot.w2beginning
w2end=Params.plot.w2end
w2spacing=Params.plot.w2spacing
w3=Params.plot.w3

Afw=Params.cell.front.Afw
lfw=Params.cell.front.lfw
fwnvisfile=Params.cell.front.fwnvisfile
fwnirfile=Params.cell.front.fwnirfile
fwemfile=Params.cell.front.fwemfile
Abg=Params.cell.sample.Abg
ls=Params.cell.sample.ls
sampnvisfile=Params.cell.sample.sampnvisfile
sampnirfile=Params.cell.sample.sampnirfile
sampemfile=Params.cell.sample.sampemfile
Abw=Params.cell.back.Abw
lbw=Params.cell.back.lbw
bwnvisfile=Params.cell.back.bwnvisfile
bwnirfile=Params.cell.back.bwnirfile
bwemfile=Params.cell.back.bwemfile
theta21=Params.cell.angles.theta21
theta31=Params.cell.angles.theta31

QEfile=Params.misc.QEfile

outfilex=Params.output.outfilex
outfiley=Params.output.outfiley
outfilez=Params.output.outfilez

disp('-------------------------------------------------')
return
