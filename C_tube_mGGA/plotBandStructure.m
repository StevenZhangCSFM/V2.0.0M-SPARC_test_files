load('abinitEigens.mat');
load('SPARCeigens.mat');
totalKptGrid = [kpointGrid(5,:);-kpointGrid(4:-1:1,:);kpointGrid(1:4,:);-kpointGrid(5,:)];
% totalEigenValue = [eigenValue(:,5),eigenValue(:,4:-1:1),eigenValue(:,1:4),eigenValue(:,5)];
totalEigenValue = [eigenValue(:,5),eigenValue(:,5),eigenValue(:,4:-1:1),eigenValue(:,1:4),eigenValue(:,5),eigenValue(:,5)]*27.2113897; % expand the scape to fulfill periodic condition
reciUnitLen = 2*pi/4.647785137;
reduceKptGrid = totalKptGrid(:,3)/reciUnitLen;
reduceKptGrid = [reduceKptGrid(1)-0.1;reduceKptGrid;reduceKptGrid(10)+0.1];

abinitTotalEigenValue = [abinitTotalEigenValue(:,1), abinitTotalEigenValue, abinitTotalEigenValue(:,10)]*27.2113897; % expand the scape to fulfill periodic condition
for line = 21:28
	curve1 = plot(reduceKptGrid, abinitTotalEigenValue(line,:), 'xk','linewidth',1.5, 'markersize', 6);
    hold on;
	curve2 = plot(reduceKptGrid, totalEigenValue(line,:), 'or', 'markersize', 6);
	hold on;
	k_interp_abinit = linspace(-0.5,0.5,1000);
	lambda_interp_abinit = interp1(reduceKptGrid,abinitTotalEigenValue(line,:), k_interp_abinit, 'spline');
	plot(k_interp_abinit, lambda_interp_abinit, '-k', 'linewidth',1.5);
	hold on;
	k_interp_msparc = linspace(-0.5,0.5,1000);
	lambda_interp_msparc = interp1(reduceKptGrid,totalEigenValue(line,:), k_interp_msparc, 'spline');
	plot(k_interp_msparc, lambda_interp_msparc, '--r', 'linewidth',1.5);
	hold on;
	% legendInfo{i} = ['$n$ = ' num2str(n)];
end
fermiLevel = [-0.5,7.1356773626E-02*27.2113897;0.5,7.1356773626E-02*27.2113897];
curve3 = plot(fermiLevel(:,1),fermiLevel(:,2),':b', 'linewidth',1.5);
axis([-0.5 0.5 -4 8]);
yticks([-4 -2 0 2 4 6 8]);
xticks([-0.5 -0.25 0 0.25 0.5])
ylabel('Energy (eV)','Interpreter','latex');
xlabel('Wavevector','Interpreter','latex');
set(gca,'fontsize',18);
set(gca,'fontname','Times New Roman');
set(gca,'TickLabelInterpreter','latex');
lgd = legend([curve2,curve1, curve3],'M-SPARC','ABINIT','Fermi level','fontsize',14,'NumColumns',3);
set(lgd,'fontsize',14,'FontName','Times New Roman','Interpreter','Latex');