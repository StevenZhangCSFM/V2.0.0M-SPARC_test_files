load('dataSet.mat');
volume = [5.9110031390E+02, 7.0166843693E+02, 8.2523041991E+02, 9.6250814394E+02, 1.1142234901E+03, 1.2810983396E+03, 1.4638545734E+03];
volume_interp = linspace(540, 1700, 200);
[SPARCfitResult, QEfitResult] = fitting(presQE, presSPARC, volume);
yyaxis right;
curve1 = plot(volume/14,presQE,'x','color','k','MarkerSize',8);
hold on;
QEFitPres = QEfitResult(volume_interp) * 29421.0264843896;
plot(volume_interp/14,QEFitPres,'-','color','k','MarkerSize',8);
hold on;
curve2 = plot(volume/14,presSPARC,'o','color','#D95139','MarkerSize',8);
hold on;
SPARCFitPres = SPARCfitResult(volume_interp) * 29421.0264843896;
plot(volume_interp/14,SPARCFitPres,'-','color','#D95139','MarkerSize',8);
hold on;
axis([40 110 -50 350]);
yticks([-50 30 110 190 270 350]);
yticklabels({'-50','30','110','190','270','350'});
ylabel('Pressure (GPa)','Interpreter','latex');
yyaxis left;
curve3 = plot(volume/14,energyQE,'*','color','r','MarkerSize',8);
hold on;
QEB0 = QEfitResult.a;
QEdB0 = QEfitResult.b;
QEFitEnergy = (energyQE(4)*14 + 9*volume(4)*QEB0/16*(((volume(4)./volume_interp).^(2/3)-1).^3 * QEdB0 + (((volume(4)./volume_interp).^(2/3)-1).^2).*(6-4*(volume(4)./volume_interp).^(2/3))))/14;
plot(volume_interp/14,QEFitEnergy,'-','color','r','MarkerSize',8);
hold on;
curve4 = plot(volume/14,energySPARC,'diamond','color','#0072BD','MarkerSize',8);
hold on;
SPARCB0 = SPARCfitResult.a;
SPARCdB0 = SPARCfitResult.b;
SPARCFitEnergy = (energySPARC(4)*14 + 9*volume(4)*SPARCB0/16*(((volume(4)./volume_interp).^(2/3)-1).^3 * SPARCdB0 + (((volume(4)./volume_interp).^(2/3)-1).^2).*(6-4*(volume(4)./volume_interp).^(2/3))))/14;
plot(volume_interp/14,SPARCFitEnergy,'-','color','#0072BD','MarkerSize',8);
hold on;
axis([40 110 -33.62 -33.52]);
yticks([-33.62 -33.6 -33.58 -33.56 -33.54 -33.52]);
yticklabels({'-33.62','-33.60','-33.58','-33.56','-33.54','-33.52'});
ylabel('Energy (Ha/atom)','Interpreter','latex');
xticks([40 54 68 82 96 110]);
xticklabels({'40','54','68','82','96','110'});
xlabel('Volume/atom (Bohr$^3$/atom)','Interpreter','latex');
set(gca,'fontsize',18);
set(gca,'fontname','Times New Roman');
set(gca,'TickLabelInterpreter','latex');
lgd = legend([curve4,curve3,curve2,curve1],'Energy (M-SPARC)','Energy (QE)','Pressure (M-SPARC)','Pressure (QE)');
set(lgd,'fontsize',14,'FontName','Times New Roman','Interpreter','Latex');