[t, W, T_H, T_C] = read_vpdata("Data_Heat_Pump_Del_2.txt");

%% pre-plot calculations
% Declaring used variables and values
T_H = T_H + 273;
T_C = T_C + 273;
delta_T = T_H - T_C;
c = 4180;
m = 10;

% Fitting datasets to curves with optimal degree's
p_TH = polyfit(t, T_H, 3);
p_W = polyfit(t, W, 1);
p_delta_T = polyfit(t,delta_T,2);

% Derivitives of fitted curves
P_in = polyder(p_W);
P_ut = ((c*m) * polyder(p_TH));


% Calculating values and vectors needed for plot
Vf_carnot = polyval(p_TH,t) ./ polyval(p_delta_T,t);
Vf_real = (polyval(P_ut, t) ./ polyval(P_in, t));
Vf_div = Vf_real ./ Vf_carnot;



%% plots and their appearence
% Calculating the optimal screen size for different monitors.
screenSize = get(groot, "ScreenSize"); % gets users resolution
windowDim = [						   % creates vector with window specs
	screenSize(3)/2 - (screenSize(3)*0.8)/2, ...	% x-coordinate
	screenSize(4)/2 - (screenSize(4)*0.8)/2, ...	% y-coordinate
	screenSize(3)*0.8, ...			   % window-width
	screenSize(4)*0.8];				   % window-height
figure('Position', ...                 % Creates new figure
    [windowDim(1), ...                 % sets x-position
    windowDim(2), ...                  % sets y-position
    windowDim(3), ...                  % sets width
    windowDim(4)] )                    % sets height

% Plotting the raw datasets
subplot(3,1,1)					% specifies sub plot 
plot(t, T_H, ...				% what to plot	
	'DisplayName', 'TH(t)', ... % name of graph
	'LineWidth', 3)				% linewidth of plot
title("TH(t)")					% name of plot
ylabel("K")						% Adds correct label for y-axis

subplot(3,1,2)					% Same as above comments:
plot(t, T_C, ...
	'DisplayName', 'TC(t)', ...
	'LineWidth', 3)
title("TC(t)")

subplot(3,1,3)
plot(t, W, ...
	'DisplayName', 'W(t)', ...
	'LineWidth', 3)
title("W(t)")

waitAndReset(windowDim);

% plotting the quotient of Vf_carnot over Vf_real
subplot(2,1,1)
plot(t, Vf_div, ...
	'DisplayName', 'Quotient (Real/Carnot)', ...
	'LineWidth', 4);
title("vf (carnot) divided by Vf (real)")
subplot(2,1,2)
hold on
plot(t, Vf_real, ...
	'DisplayName', 'Vf(t) (Real)', ...
	'LineWidth', 4)
plot(t,Vf_carnot, ...
	'DisplayName', 'Vf(t) (Carnot)', ...
	'LineWidth', 4)
hold off
title("Vf (carnot), Vf (real)")
legend('show')


% Function to wait for figure close and then reset and clear it
function waitAndReset(dim_vector)
hold off							% forces hold off
waitfor(gcf)						% waits untill figure close
clf									% clears figure
close(gcf)							% closes figure
figure('Position', ...              % Creates new figure
    [dim_vector(1), ...             % sets x-position
    dim_vector(2), ...              % sets y-position
    dim_vector(3), ...              % sets width
    dim_vector(4)] )                % sets height
end
