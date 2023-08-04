function lambdacompute

% this function determines a lambda value for GUI test kappa and FWHM inputs

kappast=findobj('Tag','kappa');
kappa=eval(get(kappast,'String'));
fwhmst=findobj('Tag','FWHM');
fwhm=eval(get(fwhmst,'String'));

[Delta,Lambda,Pure]=PadeApprox(kappa,fwhm);

lambdast=findobj('Tag','lambda');
set(lambdast,'String',num2str(Lambda));
deltast=findobj('Tag','delta');
set(deltast,'String',num2str(Delta));
purest=findobj('Tag','pure');
set(purest,'String',num2str(Pure));