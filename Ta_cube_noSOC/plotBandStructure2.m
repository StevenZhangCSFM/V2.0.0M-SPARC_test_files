load('abinitEigs.mat');
abinitEigs = abinitEigs';
load('neededEigMSPARC.mat');
totalXcoord = [XcoordFigure(10)-sqrt(2)/3, XcoordFigure(10:16), XcoordFigure(16)+sqrt(2)/3];
totalEigenValue = [neededEigs(:, 10+1), neededEigs(:, 10:16), neededEigs(:, 16-1)]*27.2113897;
abinitTotalEigenValue = [abinitEigs(:, 10+1), abinitEigs(:, 10:16), abinitEigs(:, 16-1)]*27.2113897;
figure('Renderer', 'painters', 'Position', [1361 558 300 420])
for line = 10:14
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
% Xline = [1,0; 1,20];
% Mline = [2,0; 2,20];
% Gline = [2+sqrt(2),0;2+sqrt(2),20];
Rline = [2+sqrt(2)+sqrt(3),0;2+sqrt(2)+sqrt(3),20];
set(gca,'position',[0.277785332933479,0.168789338465176,0.627214667066521,0.756210661534824]);
plot(Rline(:,1),Rline(:,2),'-k');
axis([totalXcoord(2) totalXcoord(end-1) 7.5 15]);
% ylabel('Energy (eV)','Interpreter','latex');
yticks([]);
% yticklabels({'7.5','10.0','12.5','15.0'});
xticks([2+sqrt(2) 2+sqrt(2)+sqrt(3) 2+2*sqrt(2)+sqrt(3)]);
xticklabels({'$\Gamma$','R','X'});
xlabel('Wavevector','Interpreter','latex');
set(gca,'fontsize',18);
set(gca,'fontname','Times New Roman');
set(gca,'TickLabelInterpreter','latex');
% lgd = legend([curve2,curve1,curve3],'M-SPARC','ABINIT','Fermi level','Location','south');
% set(lgd,'fontsize',14,'FontName','Times New Roman','Interpreter','Latex');