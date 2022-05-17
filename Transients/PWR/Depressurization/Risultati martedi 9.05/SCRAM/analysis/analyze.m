addpath(genpath('../../../../../utils/'));
warning('OFF', 'MATLAB:table:ModifiedAndSavedVarnames')

clear all 
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                DATA EXCTRACTION               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lambdas = [0.01, 0.05, 0.1, 0.2];
accident_time = 100; % [s]
scram_time = 103;    % [s]

% Creo una struct. Ogni elemento di questa struct rappresenta un
% esperimento di depressurizzazione. Esiste un field principale detto
% raw_data
data = struct([]);

for i=1:length(lambdas)
    filename = sprintf("../lambda_%s/out/data.csv", string(lambdas(i)));
    new = readtable(filename);
    data(i).lambda = lambdas(i);
    data(i).raw_data = new;
end

% Per ogni esperimento creo un field con dati di interesse
for i=1:length(lambdas)
    data(i).time = table2array(data(i).raw_data(:,1));  % [s]
    data(i).power = table2array(data(i).raw_data(:,2)); % [kW]
    data(i).outlet_temperature = table2array(data(i).raw_data(:,3));   % [°K]
    data(i).max_fuel_temp_bct = table2array(data(i).raw_data(:,4:6));  % [°K]
    data(i).max_clad_temp_bct = table2array(data(i).raw_data(:, 7:9)); % [°K]
    data(i).center_radial_temp_profile = table2array(data(i).raw_data(:, 10:20)); % [°K]
    data(i).max_fuel_temp_axial = table2array(data(i).raw_data(:,22:71)); % [°K]
    data(i).ht_mode_axial = table2array(data(i).raw_data(:,72:121)); % []
    data(i).heat_flux_axial = table2array(data(i).raw_data(:,122:171))./1000; % [kW/m2]
    data(i).htc_axial = table2array(data(i).raw_data(:,172:221))./1000; % [kW/m2/°K]
    data(i).flow_regimes_axial = table2array(data(i).raw_data(:,222:271));  % []
    data(i).void_fraction_axial = table2array(data(i).raw_data(:,272:321)); % []
    data(i).quality_axial = table2array(data(i).raw_data(:,322:371));       % []
    data(i).enthalpy_f_axial = table2array(data(i).raw_data(:,372:421));    % [J/kg] (entalpia del LIQUIDO SATURO)
    data(i).pressure_axial = table2array(data(i).raw_data(:,422:471));      % [Pa]

    % CALCOLO CHF_W3 (devo fare un loop per come è implementata la
    % correlazione (richiede vettori, non matrici)
    data(i).CHF_W3 = [];
    for j=1:length(data(i).time)
        data(i).CHF_W3 = [data(i).CHF_W3; CHF_W3(data(i).pressure_axial(j,:), data(i).quality_axial(j,:), 0.335, data(i).enthalpy_f_axial(j,:), data(i).heat_flux_axial(j,:), 8.79e-5, 1.17808e-2, 3.876)]; % [kW/m2]
    end

    data(i).CHFR = data(i).CHF_W3./data(i).heat_flux_axial;
    data(i).CHF_W3 = data(i).CHF_W3(:,1:48);
    data(i).CHFR = data(i).CHFR(:,1:48);
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                            %
%                           PLOTS                            %
%                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% ------ LEGEND LABELS -------
labels = [];
for i=1:length(lambdas)
    new = sprintf("\\lambda = %s", string(lambdas(i)));
    labels = [labels new];
end
labels = [labels "ACCIDENT" "SCRAM"];



% % ------ TOTAL POWER -------
% f = figure('Position', [10 10 900 900]);
% hold on
% for i=1:length(data)
%     plot(data(i).time,data(i).power, 'LineWidth', 1.3);
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('TOTAL POWER EXCHANGED [kW]')
% legend(labels)
% xlim([95 120])
% %saveas(f, "TOTAL POWER.png")
% 
% 
% % --- -OUTLET TEMPERATURE ----
% figure('Position', [10 10 900 900])
% hold on
% for i=1:length(data)
%     plot(data(i).time,data(i).outlet_temperature, 'LineWidth', 1.3);
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('OUTLET TEMPERATURE [K]')
% xlim([95 130])
% legend(labels)
% 
% 
% 
% 
% % ---- MAX FUEL TEMPERATURE ----
% figure('Position', [10 10 900 900])
% hold on
% for i=1:length(data)
%     plot(data(i).time,max(data(i).max_fuel_temp_axial, [], 2), 'LineWidth', 1.3);
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('MAX FUEL TEMPERATURE [K]')
% xlim([95 160])
% legend(labels)
% 
% 
% % ------- MDNBR -------
% figure('Position', [10 10 900 900])
% hold on
% for i=1:length(data)
%     plot(data(i).time,min(data(i).CHFR, [], 2), 'LineWidth', 1.3);
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('MDNBR (W-3 Correlation)')
% ylim([0 7])
% xlim([95 106])
% legend(labels)
% 
% % ------- MEAN VOID FRACTION -------
% figure('Position', [10 10 900 900])
% hold on
% for i=1:length(data)
%     plot(data(i).time,mean(data(i).void_fraction_axial,2), 'LineWidth', 1.3);
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('MEAN VOID FRACTION')
% ylim([0 1])
% xlim([95 160])
% legend(labels)
% 
% 
% % ------- MEAN PRESSURE -------
% figure('Position', [10 10 900 900])
% hold on
% for i=1:length(data)
%     plot(data(i).time,mean(data(i).pressure_axial,2)./1e5, 'LineWidth', 1.3);
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('MEAN PRESSURE [bar]')
% xlim([95 160])
% legend(labels)
% 
% % ------- MEAN HTC -------
% figure('Position', [10 10 900 900])
% hold on
% for i=1:length(data)
%     plot(data(i).time,mean(data(i).htc_axial,2), 'LineWidth', 1.3);
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('MEAN HTC [kW/m^2/°K]')
% xlim([95 110])
% legend(labels)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    ANIMATIONS                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TUTTE LE ANIMAZIONI SONO CON IL TERZO LAMBDA (0.1)


% ----- PROFILE CHFR -------
% idx = 3;
% f0 = 180; % initial frame (timestep)
% fend = 250;
% figure('Position', [10 10 300 900])
% axial_plot(horzcat(data(idx).time(f0:fend,:), data(idx).CHFR(f0:fend,:)), true, 'Animation Profile - CHFR (W3)', 'CHFR', 10, 'Animations/CHFR')
% 
% 
% % ----- PROFILE HTMODE -------
% idx = 3;
% f0 = 195; % initial frame (timestep)
% fend = 300; % final frame (timestep)
% figure('Position', [10 10 300 900])
% htmode_plot(horzcat(data(idx).time(f0:fend,:), data(idx).ht_mode_axial(f0:fend,:)), true, 'Animation Profile - Heat Transfer Mode', '', 1, 'Animations/HTMODE')

% ----- PROFILE FLOW REGIME -------
% idx = 3;
% f0 = 180; % initial frame (timestep)
% fend = 250; % final frame (timestep)
% figure('Position', [10 10 300 900])
% flowreg_plot(horzcat(data(idx).time(f0:fend,:), data(idx).flow_regimes_axial(f0:fend,:)), true, 'Animation Profile - Flow Regime', '', 1, 'Animations/Flow Regime')
% 
% 
% % ----- PROFILE HTC -------
% idx = 3;
% f0 = 180; % initial frame (timestep)
% fend = 300;
% figure('Position', [10 10 300 900])
% axial_plot(horzcat(data(idx).time(f0:fend,:), data(idx).htc_axial(f0:fend,:)), true, 'Animation Profile - HTC [kW/m^2/°K]', 'HTC [kW/m^2/°K]', 60, 'Animations/HTC')
% 
% % ----- PROFILE VOID FRACTION -------
% idx = 3;
% f0 = 170; % initial frame (timestep)
% fend = 300; % final frame (timestep)
% figure('Position', [10 10 300 900])
% axial_plot(horzcat(data(idx).time(f0:fend,:), data(idx).void_fraction_axial(f0:fend,:)), true, 'Animation Profile - Void Fraction ( \alpha )', 'Void Fraction ( \alpha )', 1, 'Animations/Void Fraction')

% % ----- PROFILE RADIAL TEMPERATURE -------
% idx = 3;
% f0 = 180; % initial frame (timestep)
% fend = 300; % final frame (timestep)
% figure(10)
% radial_plot_fuel(horzcat(data(idx).center_radial_temp_profile(f0:fend, :), data(idx).time(f0:fend,:)), true, 'pwr', 'Animations/Radial Temperature')

% ----- PROFILE MAX FUEL TEMPERATURE -------
% idx = 3;
% f0 = 170; % initial frame (timestep)
% fend = 300; % final frame (timestep)
% figure('Position', [10 10 300 900])
% axial_plot(horzcat(data(idx).time(f0:fend,:), data(idx).max_fuel_temp_axial(f0:fend,:)), true, 'Animation Profile - Max Fuel Temp [°K]', 'Temperature [°K]', 2300, 'Animations/Max Fuel Temperature')

% ----- PROFILE HEAT FLUX -------
% idx = 3;
% f0 = 170; % initial frame (timestep)
% fend = 300; % final frame (timestep)
% figure('Position', [10 10 300 900])
% axial_plot(horzcat(data(idx).time(f0:fend,:), data(idx).heat_flux_axial(f0:fend,:)), true, 'Animation Profile - Heat Flux [kW/m^2]', 'Heat Flux [kW/m^2]', 1100, 'Animations/Heat Flux')



