%% old shizzle
% regression indoor 50 bin :  0.012.*exp(-((x-1200)./275).^2)+0.0422*exp(-((x-2400)./1710).^2)+3.181e-06.*x-a
% regression indoor 100 bin : 0.016.*exp(-((x-1225)./273).^2)+0.042*exp(-((x-2480)./1690).^2)+3.181e-06.*x-a

%% run analyseAllDatasetsUTM before
hold on;
% -0.203*exp(-((x+986)/6648)^2)+0.262*exp(-((x+76.05)/6568)^2)-0.05358*exp(-((x-2725)/4174)^2)+a
% -0.203*exp(-((x+0.0986)/0.6648)^2)+0.262*exp(-((x+.007605)/0.6568)^2)-0.05358*exp(-((x-0.2725)/0.4174)^2)+a
% -0.203*exp(-((x+500)/3300)^2)+0.262*exp(-((x+40.05)/3300)^2)-0.05358*exp(-((x-1400)/2050)^2)+a

% avec droite (mx + b où b sera 1.075e-06
%-0.23*exp(-((x+400)/1600)^2)+0.25*exp(-((x+200)/1600)^2)+1.075e-06*x+a
% -0.23*exp(-((x+400)/1500)^2)+0.25*exp(-((x+200)/1500)^2)+a*x+0.0029

%% CONTRAINDRE LE PARAM DANS FIT OPTIONS

% (0.938) -0.016*exp(-((x-650)./400).^2)+0.028*exp(-((x-2300)./800).^2)+a.*x+b

% (0.946) -0.016*exp(-((x-700)./400).^2)+0.027*exp(-((x-2300)./800).^2)+a.*x+b 

% (0.96) c*exp(-((x-700)./400).^2)+d*exp(-((x-2300)./800).^2)+a.*x+b

% (0.97) -0.020*exp(-((x-c)./400).^2)+d*exp(-((x-2300)./800).^2)+a.*x+b

% saved (0.978 bisquare) -0.021*exp(-((x-a)./400).^2)+0.02*exp(-((x-2400)./800).^2)+b*x+c

