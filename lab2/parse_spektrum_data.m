clear
[L1,I1] = csv_to_data('balmerserie_väte_lampa_av.csv');
[L2,I2] = csv_to_data('balmerserie_väte_lampa_på.csv');
[L3,I3] = csv_to_data('balmerserie_väte_hög_integreringstid_lampa_på.csv');

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


plot(L1,I1, 'LineWidth',2)
title('Bakgrundsbrus (lampa ej på)')
waitAndReset(windowDim)
plot(L2,I2, 'LineWidth',2)
title('väte spektrum (auto integreringstid)')
waitAndReset(windowDim)
plot(L3,I3, 'LineWidth',2)
title('väte spektrum (195ms integreringstid)')




function [wavelength, intensity] = csv_to_data(pathname)
fileID = fopen(pathname, 'r');
C = textscan(fileID, '%s %s %*s %*s %s %*s %*s %s %*s %s %s', 'Delimiter', ';', 'HeaderLines', 1, 'EmptyValue', NaN);
fclose(fileID);

wavelength = str2double(strrep(C{1}, ',', '.'));
intensity = str2double(strrep(C{2}, ',', '.'));
end

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