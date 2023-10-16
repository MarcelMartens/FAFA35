% Vibrationsövergången 0-1 2130 cm^-1
% Beräkna energin för vibrationsövergången som presenteras i filmen 
% och som ni har fått data till och använd också data filen till att 
% beräkna B som kopplar till rotationsövergångarna. Ta med era 
% resultat i rapporten. En utförlig beskrivning över hur en 
% Fouriertransformspektrometer fungerar hittar ni i appendix 3


%frågor:
% a) identifiera R- och P-grenarna
% b) Bestäm vågtalet för R_1 och P_1
% c) Ställ upp ett enkelt ekvationssystem där vågtalen 
		% för R1 och P1 uttrycks i energiseparationen mellan 
		% vibrationsnivåerna (ω0) samt rotationskonstanten 
		% (E0r, ekv 37-13 eller B, som den också brukar betecknas) 
		% i approximationen att den senare är samma i de bägge 
		% vibrationstillstånden.
% d) Beräkna ω0 och B från den hämtade datan. Beräkna utifrån 
		% dessa värden medelavståndet mellan C och O-atomerna i molekylen.
% e) Hur skulle d kunna förfina analysen?


data1 = importdata("bcg-1006-wavelength.dat");
data2 = importdata("bcg-1006-wavenumber.dat");
data3 = importdata("CO-01-1006.dat");

%% plot for bakgrund - våglängd
plot(data1(:,1),data1(:,2),'LineWidth',2)
hold off
%% plot för bakgrund - vågnummer
plot(data2(:,1),data2(:,2),'LineWidth',2)
hold off
%% plot för kolmonoxid minus bakgrund

P_rows = [1, 2438]; % genom find(data3(:,1) == <x-värde>)
R_rows = [2564, 4625];

P_coords = [data3(P_rows(1),:)
			data3(P_rows(2),:)];
R_coords = [data3(R_rows(1),:)
			data3(R_rows(2),:)];
Q_coords = [(P_coords(2,1)+R_coords(1,1)) / 2 , (P_coords(2,2)+R_coords(1,2)) / 2];

h(1) = plot(data3(:,1),data3(:,2),'LineWidth',2);hold on;
h(2) = line([Q_coords(1),Q_coords(1)] , [0,Q_coords(2)]);


Legend={'a'};
legend(h,Legend);



