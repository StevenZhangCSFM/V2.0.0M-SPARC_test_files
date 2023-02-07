function [SPARCfitResult, QEfitResult] = fitting(presQE, presSPARC, volume)
% load('dataSet.mat');
% volume = [5.9110031390E+02, 7.0166843693E+02, 8.2523041991E+02, 9.6250814394E+02, 1.1142234901E+03, 1.2810983396E+03, 1.4638545734E+03];
presQE_atomic = presQE / 29421.0264843896;
presSPARC_atomic = presSPARC / 29421.0264843896;
[SPARCfitResult, SPARCgof] = createFit(volume, presSPARC_atomic);
% SPARCB0 = SPARCfitResult.a;
% SPARCdB0 = SPARCfitResult.b;
[QEfitResult, QEgof] = createFit(volume, presQE_atomic);
% QEB0 = QEfitResult.a;
% QEdB0 = QEfitResult.b;
end

function [fitresult, gof] = createFit(volume, presSPARC)
%CREATEFIT(VOLUME,PRESSPARC)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : volume
%      Y Output: presSPARC
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 06-Nov-2022 14:54:48


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( volume, presSPARC );

% Set up fittype and options.
ft = fittype( '3/2*a*((962.50814394/x)^(7/3)-(962.50814394/x)^(5/3))*(1+3/4*(b-4)*((962.50814394/x)^(2/3)-1))', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.0067 4.1805];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% % Plot fit with data.
% figure( 'Name', 'untitled fit 1' );
% h = plot( fitresult, xData, yData );
% legend( h, 'presSPARC vs. volume', 'untitled fit 1', 'Location', 'NorthEast', 'Interpreter', 'none' );
% % Label axes
% xlabel( 'volume', 'Interpreter', 'none' );
% ylabel( 'presSPARC', 'Interpreter', 'none' );
% grid on
end