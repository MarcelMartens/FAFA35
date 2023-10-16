
h = 6.62618e-34;
c = 299792458;
e = 1.60219e-19;

lambda = [460, 500, 550, 600, 694.3] * 1e-9; % enhet 1m
U = [1.232, 1.072, 0.882, 0.682, 0.422]; % enhet 1V
f = (c ./ lambda); % enhet 1Hz
fthz = f / 1e+12; % enhet 1THZ
E = U; % enhet 1eV

pE = polyfit(fthz,E,1);
h_eV = polyder(pE);
x_val = linspace(-100,900,1000);
disp(['plancks konstant (eV/THz) = ', num2str(h_eV)])
disp(['plancks konstant (J/Hz) = ', num2str((e*h_eV)/(1e+12))])
disp(['Utträderarbete (eV) = ', num2str(-pE(2))])
disp(['Utträderarbete (J) = ', num2str(-e*pE(2))])
disp(['Gränsvåglängd (nm) = ', num2str(c/(roots(pE)*1e12))])



hold on
plot(x_val,polyval(pE,x_val,1))
plot(fthz,E,'-x','DisplayName','mätvärden')
grid on
legend('show')
ylabel('Kinetisk energi [1eV]')
xlabel('frekvens [1THz]')
ylim([-1.5, 2.5])
xlim([-100, 900])



