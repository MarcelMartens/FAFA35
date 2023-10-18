clear
close all
hold off
c = 299792458;
h_ = 6.62618e-34;
h__ = 1.054589300816655e-34;

data1 = importdata("bcg-1006-wavelength.dat");
data2 = importdata("bcg-1006-wavenumber.dat");
data3 = importdata("CO-01-1006.dat");

%% plot för bakgrund - vågnummer
clf
bp = plot(data2(:,1),data2(:,2));
set(bp,'lineWidth', 2)
title('Bakgrundsspektrum för ett tomt rör')
set(gca, 'fontsize', 20, 'linewidth', 2)
waitfor(gcf)

hold off
%% plot för kolmonoxid minus bakgrund
clf
% beräkningar och databehandling
P_rows = [1, 2438]; % genom find(data3(:,1) == <x-värde>)
R_rows = [2564, 4625];
P_coords = [data3(P_rows(1),:)
			data3(P_rows(2),:)];
R_coords = [data3(R_rows(1),:)
			data3(R_rows(2),:)];
Q_coords = [(P_coords(2,1)+R_coords(1,1)) / 2 , (P_coords(2,2)+R_coords(1,2)) / 2];
Q_low = (data3(2415,2) + data3(2581,2)) / 2; % genom find()

% plots
h(1) = plot(data3(1:P_rows(2),1),data3(1:P_rows(2),2));hold on;
h(2) = plot(data3(R_rows(1):R_rows(2),1),data3(R_rows(1):R_rows(2),2));hold on;
h(3) = line([Q_coords(1),Q_coords(1)] , [Q_low,Q_coords(2)]);hold on;

% vågtal R1 och P1: 
	% R1 - 2147.04646
	% P1 - 2139.45312
% B och w0:
	% B - 3.771002212581517e-23
	% w0 (rad/s) - 4.022832619275761e+14
	% w0 (cm^-1) - 2.135656450000000e+03

% plot-anpassning
set(h([1,2,3]), 'lineWidth', 2)
Legend={'P-gren', 'R-gren', 'Q'};
legend(h([1,2,3]),Legend);
title("Rotationsstrukturen i vibrationsövergången 0 \rightarrow 2 i CO-molekylen", 'Interpreter', 'tex');
ylabel('Intensitet');
xlabel('Vågtal [cm^{-1}]', 'Interpreter','tex');
set(gca,'fontsize', 20, 'lineWidth', 2)
ylim([0,0.5])
xlim([1985,2275])



