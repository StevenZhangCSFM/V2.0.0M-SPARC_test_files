load('elecDensity.mat');
Nx = 133; Ny = 108; Nz = 75;
rho3D = reshape(rho,Nx+1,Ny+1,Nz+1);
rho_Tilde_3D = reshape(rho_Tilde,Nx+1,Ny+1,Nz+1);
rho_2D = reshape(rho3D(:,:,45),Nx+1,Ny+1);
rho_2D_small = rho_2D(31:Nx+1-23,31:Ny+1-25);
rho_Tilde_2D = reshape(rho_Tilde_3D(:,:,45),Nx+1,Ny+1);
rho_Tilde_2D_small = rho_Tilde_2D(31:Nx+1-23,31:Ny+1-25);
xCoord = (30:1:Nx-23)*(32/Nx);
yCoord = (30:1:Ny-25)*(26/Ny);
figure('Renderer', 'painters', 'Position', [1361 558 400 420])
elec = pcolor(yCoord,xCoord,rho_2D_small+rho_Tilde_2D_small);
set(elec,'EdgeColor','none');
% set(elec,'TickLabelInterpreter','latex');
pbaspect([Ny-55,Nx-53,26]);
map = [0.2 0.7 0.1
    0.1 0.7 0.2
    0.2 0.7 0.3
    0.3 0.7 0.35
    0.4 0.7 0.4
    0.5 0.7 0.5
    0.6 0.7 0.55
    0.8 0.7 0.6
    0.9 0.85 0.8
    1 1 1];
colormap(flipud(map));
cbar = colorbar;
cbar.Limits = [0 1.6];
cbar.Ticks = [0.0 0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6];
cbar.TickLabels = {'0.0','0.2','0.4','0.6','0.8','1.0','1.2','1.4','1.6'};
cbar.TickLabelInterpreter = 'latex';
title(cbar,'(a.u.)','fontname','Times New Roman','fontsize',18);
% yticks([0 4 8 12 16 20 24 28 32])
yticks([]);
% ylabel('X coord (Bohr)','Interpreter','latex');
% xticks([0 6.5 13 19.5 26]);
xticks([]);
% xlabel('Y coord (Bohr)','Interpreter','latex');
set(gca,'fontname','Times New Roman','fontsize',18);
set(gca,'visible','off'); % remove box
% set(gcf,'position',[0.2,0.2,0.52,0.64]);