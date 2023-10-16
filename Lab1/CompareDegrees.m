[t, W, T_H, T_C] = read_vpdata("Data_Heat_Pump_Del_2.txt");

% Fitting datasets to curves with different degrees
delta_T = T_H - T_C;

poly_Q1 = polyfit(t, T_H, 1);
poly_Q2 = polyfit(t, T_H, 2);
poly_Q3 = polyfit(t, T_H, 3);
poly_Q5 = polyfit(t, T_H, 5);

poly_W1 = polyfit(t, W, 1);
poly_W2 = polyfit(t, W, 2);
poly_W3 = polyfit(t, W, 3);
poly_W4 = polyfit(t, W, 4);
poly_W5 = polyfit(t, W, 5);



% Calculating the optimal screen size for different monitors.
screenSize = get(groot, "ScreenSize"); % gets users resolution
windowDim = [						   % creates vector with window specs
	(screenSize(3) - screenSize(3)*0.8)/2, ...	% x-coordinate
	(screenSize(4) - screenSize(4)*0.8)/2, ...	% y-coordinate
	screenSize(3)*0.8, ...					% window-width
	screenSize(4)*0.8];						% window-height
figure('Position', ...                      % Creates new figure
    [windowDim(1), ...                      % sets x-position
    windowDim(2), ...                       % sets y-position
    windowDim(3), ...                       % sets width
    windowDim(4)] )                         % sets height


% plotting fitted curves of Q(t) with different degrees and the Dataset
plot(t, T_H, ...
	'DisplayName', 'TH(t)', ...
	'LineWidth', 5)
title("Different fitted functions and the dataset")
ylabel("Temperature / K")
xlabel("time / s")
ylim([29 50])
hold on
plot(t, polyval(poly_Q1,t), ...
	'DisplayName', 'Q(t) n=1', ...
	'LineWidth', 4, ...
	'LineStyle','--')
plot(t, polyval(poly_Q2,t), ...
	'DisplayName', 'Q(t) n=2', ...
	'LineWidth', 4, ...
	'LineStyle','--')
plot(t, polyval(poly_Q3,t), ...
	'DisplayName', 'Q(t) n=3', ...
	'LineWidth', 4, ...
	'LineStyle','--')
plot(t, polyval(poly_Q5,t), ...
	'DisplayName', 'Q(t) n=5', ...
	'LineWidth', 4, ...
	'LineStyle','--')
hold off
legend('show')
legend('Location','southeast')
legend('FontSize',20)

waitfor(gcf);
clf;
close(gcf);
figure('Position', ...                      % Creates new figure
    [windowDim(1), ...                      % sets x-position
    windowDim(2), ...                       % sets y-position
    windowDim(3), ...                       % sets width
    windowDim(4)] )                         % sets height

% plotting fitted curves of W(t) with different degrees and the Dataset
plot(t, W, ...
	'DisplayName', 'W(t)', ...
	'LineWidth', 5)
title("Different fitted functions and the dataset")
ylabel("Energy / J")
xlabel("time / s")
hold on
plot(t, polyval(poly_W1,t), ...
	'DisplayName', 'W(t) n=1', ...
	'LineWidth', 4, ...
	'LineStyle','--')
plot(t, polyval(poly_W2,t), ...
	'DisplayName', 'W(t) n=2', ...
	'LineWidth', 4, ...
	'LineStyle','--')
plot(t, polyval(poly_W3,t), ...
	'DisplayName', 'W(t) n=3', ...
	'LineWidth', 4, ...
	'LineStyle','--')
plot(t, polyval(poly_W5,t), ...
	'DisplayName', 'W(t) n=5', ...
	'LineWidth', 4, ...
	'LineStyle','--')
hold off
legend('show')
legend('Location','southeast')
legend('FontSize',20)