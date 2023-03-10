load('abinitEigs.mat');
abinitEigs = abinitEigs';
load('neededEigMSPARC.mat');
totalXcoord = [XcoordFigure(1)-1/3, XcoordFigure, XcoordFigure(end)+sqrt(2)/3];
totalEigenValue = [neededEigs(:, 2), neededEigs, neededEigs(:, 16-1)]*27.2113897;
abinitTotalEigenValue = [abinitEigs(:, 2), abinitEigs, abinitEigs(:, 16-1)]*27.2113897;
for line = 19:28
	plot(totalXcoord, abinitTotalEigenValue(line,:), 'xk','linewidth',1.5, 'markersize', 6);
    hold on;
	plot(totalXcoord, totalEigenValue(line,:), 'or', 'markersize', 6);
	hold on;
	k_interp = linspace(totalXcoord(1),totalXcoord(end),1000);
	lambda_interp_abinit = interp1(totalXcoord,abinitTotalEigenValue(line,:), k_interp, 'spline');
	curve1 = plot(k_interp, lambda_interp_abinit, '-k', 'linewidth',1.5);
	hold on;
	lambda_interp_msparc = interp1(totalXcoord,totalEigenValue(line,:), k_interp, 'spline');
	curve2 = plot(k_interp, lambda_interp_msparc, '--r', 'linewidth',1.5);
	hold on;
	% legendInfo{i} = ['$n$ = ' num2str(n)];
end
fermiLevel = [totalXcoord(1),4.8619178762E-01*27.2113897;totalXcoord(end),4.8619178762E-01*27.2113897];
curve3 = plot(fermiLevel(:,1),fermiLevel(:,2),':b', 'linewidth',1.5);
Xline = [1,0; 1,20];
Mline = [2,0; 2,20];
Gline = [2+sqrt(2),0;2+sqrt(2),20];
Rline = [2+sqrt(2)+sqrt(3),0;2+sqrt(2)+sqrt(3),20];
plot(Xline(:,1),Xline(:,2),'-k',Mline(:,1),Mline(:,2),'-k',Gline(:,1),Gline(:,2),'-k',Rline(:,1),Rline(:,2),'-k');
axis([totalXcoord(2) totalXcoord(end-1) 8 16]);
ylabel('Energy (eV)','Interpreter','latex');
xticks([0 1 2 2+sqrt(2) 2+sqrt(2)+sqrt(3) 2+2*sqrt(2)+sqrt(3)]);
xticklabels({'$\Gamma$','X','M','$\Gamma$','R','X'});
xlabel('Wavevector','Interpreter','latex');
set(gca,'fontsize',14);
set(gca,'fontname','Times New Roman');
set(gca,'TickLabelInterpreter','latex');
lgd = legend([curve2,curve1,curve3],'M-SPARC','ABINIT','Fermi level','Location','south','NumColumns',3);
set(lgd,'fontsize',14,'FontName','Times New Roman','Interpreter','Latex');