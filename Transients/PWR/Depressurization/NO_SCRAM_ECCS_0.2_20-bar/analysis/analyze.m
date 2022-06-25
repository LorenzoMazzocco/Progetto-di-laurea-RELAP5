addpath(genpath('../../../../../utils/'));
warning('OFF', 'MATLAB:table:ModifiedAndSavedVarnames')

clear all 
clc

fs = 20;

media_mobile = true;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                DATA EXCTRACTION               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lambdas = [0.025, 0.05, 0.1];
accident_time = 100; % [s]
scram_time = 200;    % [s]
p_ECCS = 20;         % [bar]

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
    data(i).outlet_temperature = table2array(data(i).raw_data(:,3));   % [K]
    data(i).center_radial_temp_profile = table2array(data(i).raw_data(:, 4:14)); % [K]
    data(i).max_fuel_temp_axial = table2array(data(i).raw_data(:,15:64)); % [K]
    data(i).ht_mode_axial = table2array(data(i).raw_data(:,65:114)); % []
    data(i).heat_flux_axial = table2array(data(i).raw_data(:,115:164))./1000; % [kW/m2]
    data(i).htc_axial = table2array(data(i).raw_data(:,165:214))./1000; % [kW/m2/K]
    data(i).flow_regimes_axial = table2array(data(i).raw_data(:,215:264));  % []
    data(i).void_fraction_axial = table2array(data(i).raw_data(:,265:314)); % []
    data(i).quality_axial = table2array(data(i).raw_data(:,315:364));       % []
    data(i).enthalpy_f_axial = table2array(data(i).raw_data(:,365:414));    % [J/kg] (entalpia del LIQUIDO SATURO)
    data(i).pressure_axial = table2array(data(i).raw_data(:,415:464));      % [Pa]
    data(i).max_clad_temp_axial = table2array(data(i).raw_data(:,465:514)); % [K]
    data(i).temp_liquid_axial = table2array(data(i).raw_data(:,515:564)); % [K]
    data(i).temp_vapor_axial = table2array(data(i).raw_data(:,565:614)); % [K]
    data(i).rho_axial = table2array(data(i).raw_data(:,615:664)); % [kg/m3]
    data(i).CHF_RELAP_axial = table2array(data(i).raw_data(:,665:712))./1000; % [kW/m2]
    data(i).CHFR_RELAP_axial = table2array(data(i).raw_data(:,715:762)); % []
    data(i).velocity_liquid_axial = table2array(data(i).raw_data(:,765:814)); % [m/s]
    data(i).velocity_vapor_axial = table2array(data(i).raw_data(:,815:864)); % [m/s]
    data(i).htvat_axial = table2array(data(i).raw_data(:,865:914)); % [K]
    data(i).density_liquid_axial = table2array(data(i).raw_data(:,916:965)); % [kg/m3]
    data(i).density_vapor_axial = table2array(data(i).raw_data(:,966:1015)); % [kg/m3]
    data(i).total_internal_energy_axial = table2array(data(i).raw_data(:,1016:1065)); % [J]

    % CALCOLO CHF_W3 (devo fare un loop per come è implementata la
    % correlazione (richiede vettori, non matrici)
    data(i).CHF_W3_axial = [];
    for j=1:length(data(i).time)
        data(i).CHF_W3_axial = [data(i).CHF_W3_axial; CHF_W3(data(i).pressure_axial(j,:), data(i).quality_axial(j,:), 0.335, data(i).enthalpy_f_axial(j,:), data(i).heat_flux_axial(j,:), 8.79e-5, 1.17808e-2, 3.876)]; % [kW/m2]
    end

    data(i).CHFR_W3_axial = data(i).CHF_W3_axial./data(i).heat_flux_axial;
    data(i).CHF_W3_axial = data(i).CHF_W3_axial(:,1:48);
    data(i).CHFR_W3_axial = data(i).CHFR_W3_axial(:,1:48);

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  MOVING MEAN                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if media_mobile
    for i=1:length(lambdas)
        data(i).power = movmean(data(i).power, 80, 1);
        %data(i).max_fuel_temp_axial = movmean(data(i).max_fuel_temp_axial, 20, 1);
        data(i).ht_mode_axial = round(movmean(data(i).ht_mode_axial, 40, 1));
        data(i).heat_flux_axial = movmean(data(i).heat_flux_axial, 40, 1);
        data(i).htc_axial = movmean(data(i).htc_axial, 40, 1);
        data(i).flow_regimes_axial = round(movmean(data(i).flow_regimes_axial, 40, 1));
        data(i).void_fraction_axial = movmean(data(i).void_fraction_axial, 40,1);
        data(i).quality_axial = movmean(data(i).quality_axial, 80, 1);
        data(i).pressure_axial = movmean(data(i).pressure_axial, 80, 1);
        %data(i).max_clad_temp_axial = movmean(data(i).max_clad_temp_axial, 20, 1);
        data(i).temp_liquid_axial = movmean(data(i).temp_liquid_axial, 40, 1);
        data(i).temp_vapor_axial = movmean(data(i).temp_vapor_axial, 40, 1);
        data(i).rho_axial = movmean(data(i).rho_axial, 50, 1);
        data(i).CHF_RELAP_axial = movmean(data(i).CHF_RELAP_axial, 80, 1);
        data(i).CHFR_RELAP_axial = movmean(data(i).CHFR_RELAP_axial, 80, 1);
        data(i).CHF_W3_axial = movmean(data(i).CHF_W3_axial, 100, 1);
        data(i).CHFR_W3_axial = movmean(data(i).CHFR_W3_axial, 100, 1);
        data(i).velocity_liquid_axial = movmean(data(i).velocity_liquid_axial, 50, 1);
        data(i).velocity_vapor_axial = movmean(data(i).velocity_vapor_axial, 50, 1);
        data(i).htvat_axial = movmean(data(i).htvat_axial, 50, 1);
    end
end

for i=1:length(lambdas)
    % CALCOLO VARIABILI BILANCIO ENERGETICO
    data(i).HS_internal_energy = compute_internal_energy_HS(data(i).htvat_axial);
    
    input_path = sprintf("../lambda_%s/input.i", string(lambdas(i)));
    [relap_tt relap_pp] = read_power_input(input_path, 20288801);
    data(i).rod_power = interp1(relap_tt, relap_pp, data(i).time);

    % CALCOLO TEMPO DI ECCS PER OGNI CASO
    l = lambdas(i);
    p_atm = 3;
    p0 = 155.1;
    toll = 0.1;
    t = linspace(100.5,10100, 20000);
    p_in = (p0-p_atm)*exp(-l*(t-100))+p_atm;
    t = t(p_in-p_atm > toll);
    t_fin = t(end);
    t = linspace(100.0, t_fin, 98);
    p_in = (p0-p_atm)*exp(-l*(t-100))+p_atm;

    data(i).time_ECCS = t(find(p_in<p_ECCS, 1));
    data(i).ECCS_flag = data(i).time >= data(i).time_ECCS;


     % CALCOLO TEMPO DI CHF PER OGNI CASO (usando htmode)
     filter = (data(i).ht_mode_axial == 5) + (data(i).ht_mode_axial == 6) + (data(i).ht_mode_axial == 7) + (data(i).ht_mode_axial == 8) + (data(i).ht_mode_axial == 9);
     data(i).chf_flag = sum(filter, 2) > 5;
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

% 
% 
% % ------ TOTAL POWER -------
% f = figure('Position', [10 10 900 900]);
% hold on
% for i=1:length(data)
%     plot(data(i).time,data(i).power, 'LineWidth', 1.3);
%     xline(data(i).time_ECCS, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('TOTAL POWER EXCHANGED [kW]')
% legend(labels)
% xlim([95 250])
% %saveas(f, "TOTAL POWER.png")
% 
% 
% % ------ ROD INTERNAL ENERGY -------
% f = figure('Position', [10 10 900 900]);
% hold on
% for i=1:length(data)
%     plot(data(i).time,data(i).HS_internal_energy./1000, 'LineWidth', 1.3);
%     xline(data(i).time_ECCS, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('ROD INTERNAL ENERGY [kJ]')
% legend(labels)
% xlim([95 250])
% %saveas(f, "ROD INTERNAL ENERGY.png")
% 
% 
% % ------ ROD GENERATED POWER -------
% f = figure('Position', [10 10 900 900]);
% hold on
% for i=1:length(data)
%     plot(data(i).time,data(i).rod_power./1000, 'LineWidth', 1.3);
%     xline(data(i).time_ECCS, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('ROD GENERATED POWER [kW]')
% legend(labels)
% xlim([95 250])
% %saveas(f, "ROD GENERATED POWER.png")
% 
% 
% % --- -OUTLET TEMPERATURE ----
% figure('Position', [10 10 900 900])
% hold on
% for i=1:length(data)
%     plot(data(i).time,data(i).outlet_temperature-273.15, 'LineWidth', 1.3);
%     xline(data(i).time_ECCS, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('OUTLET TEMPERATURE [°C]')
% xlim([95 250])
% legend(labels)
% 
% 
% % ---- MAX FUEL TEMPERATURE ----
% f = figure('Position', [10 10 900 900], 'DefaultAxesFontSize', 20)
% hold on
% for i=1:length(data)
%     plot(data(i).time,max(data(i).max_fuel_temp_axial-273.15, [], 2), 'LineWidth', 2.5, 'DisplayName', labels(i));
%     xline(data(i).time_ECCS, 'LineWidth', 2.0, 'LineStyle', '--', 'Color', 'k', 'DisplayName', 'ECCS')
% end
% xline(accident_time, 'LineWidth', 2.0, 'LineStyle', '--', 'Color', 'r', 'DisplayName', 'ACCIDENT')
% hold off
% grid on, grid minor
% xlabel('Time (s)')
% title('MAX FUEL TEMPERATURE (°C)')
% xlim([95 198])
% g = get(gca, 'Children')
% legend([g(1) g(3) g(5) g(7) g(2)])
% saveas(f, 'photo_ppt/max_fuel_temp.png')

% 
% 
% % ---- MAX CLAD TEMPERATURE ----
% figure('Position', [10 10 900 900])
% hold on
% for i=1:length(data)
%     plot(data(i).time,max(data(i).max_clad_temp_axial-273.15, [], 2), 'LineWidth', 1.3);
%     xline(data(i).time_ECCS, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('MAX CLAD TEMPERATURE [°C]')
% xlim([95 250])
% legend(labels)
% 
% % ---- MEAN BULK TEMPERATURE LIQUID ----
% figure('Position', [10 10 900 900])
% hold on
% for i=1:length(data)
%     plot(data(i).time,mean(data(i).temp_liquid_axial-273.15, 2), 'LineWidth', 1.3);
%     xline(data(i).time_ECCS, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('MEAN BULK TEMPERATURE LIQUID [°C]')
% xlim([95 250])
% legend(labels)
% 
% % ---- MEAN BULK TEMPERATURE VAPOR ----
% figure('Position', [10 10 900 900])
% hold on
% for i=1:length(data)
%     plot(data(i).time,mean(data(i).temp_vapor_axial-273.15, 2), 'LineWidth', 1.3);
%     xline(data(i).time_ECCS, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('MEAN BULK TEMPERATURE VAPOR [°C]')
% xlim([95 250])
% legend(labels)
% 
% % ---- MEAN DENSITY MIXTURE ----
% figure('Position', [10 10 900 900])
% hold on
% for i=1:length(data)
%     plot(data(i).time,mean(data(i).rho_axial, 2), 'LineWidth', 1.3);
%     xline(data(i).time_ECCS, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('MEAN DENSITY MIXTURE [kg/m^3]')
% xlim([95 250])
% legend(labels)
% 
% % ---- MEAN VELOCITY LIQUID ----
% figure('Position', [10 10 900 900])
% hold on
% for i=1:length(data)
%     plot(data(i).time,mean(data(i).velocity_liquid_axial, 2), 'LineWidth', 1.3);
%     xline(data(i).time_ECCS, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('MEAN VELOCITY LIQUID [m/s]')
% xlim([95 250])
% legend(labels)
% 
% % ---- MEAN VELOCITY VAPOR ----
% figure('Position', [10 10 900 900])
% hold on
% for i=1:length(data)
%     plot(data(i).time,mean(data(i).velocity_vapor_axial, 2), 'LineWidth', 1.3);
%     xline(data(i).time_ECCS, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('MEAN VELOCITY VAPOR [K]')
% xlim([95 250])
% legend(labels)
% 
% % ------- MDNBR (RELAP)-------
% figure('Position', [10 10 900 900])
% hold on
% for i=1:length(data)
%     plot(data(i).time,min(data(i).CHFR_RELAP_axial, [], 2), 'LineWidth', 1.3);
%     xline(data(i).time_ECCS, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('MDNBR (RELAP)')
% ylim([0 7])
% xlim([95 250])
% legend(labels)
% 
% % ------- MDNBR (W3)-------
% figure('Position', [10 10 900 900])
% hold on
% for i=1:length(data)
%     plot(data(i).time,min(data(i).CHFR_W3_axial, [], 2), 'LineWidth', 1.3);
%     xline(data(i).time_ECCS, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('MDNBR (W-3 Correlation)')
% ylim([0 7])
% xlim([95 250])
% legend(labels)
% 
% % ------- MEAN VOID FRACTION -------
% figure('Position', [10 10 900 900])
% hold on
% for i=1:length(data)
%     plot(data(i).time,mean(data(i).void_fraction_axial,2), 'LineWidth', 1.3);
%     xline(data(i).time_ECCS, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('MEAN VOID FRACTION')
% ylim([0 1])
% xlim([95 250])
% legend(labels)
% 
% 
% % ------- MEAN PRESSURE -------
% f = figure('Position', [10 10 900 900], 'DefaultAxesFontSize', 20)
% hold on
% for i=1:length(data)
%     plot(data(i).time,mean(data(i).pressure_axial,2)./1e5, 'LineWidth', 2.5, 'DisplayName', labels(i));
%     xline(data(i).time_ECCS, 'LineWidth', 2.0, 'LineStyle', '--', 'Color', 'k', 'DisplayName', "ECCS")
% end
% xline(accident_time, 'LineWidth', 2.0, 'LineStyle', '--', 'Color', 'r', 'DisplayName', 'ACCIDENT')
% hold off
% grid on, grid minor
% xlabel('Time (s)')
% title('PRESSURE (bar)')
% xlim([95 250])
% g = get(gca, 'Children')
% legend([g(1) g(3) g(5) g(7) g(2)])
% saveas(f, 'photo_ppt/pressure.png')

% 
% % ------- MEAN HTC -------
% figure('Position', [10 10 900 900])
% hold on
% for i=1:length(data)
%     plot(data(i).time,mean(data(i).htc_axial,2), 'LineWidth', 1.3);
%     xline(data(i).time_ECCS, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'k')
% end
% xline(accident_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% xline(scram_time, 'LineWidth', 1.4, 'LineStyle', '--', 'Color', 'r')
% hold off
% grid on, grid minor
% xlabel('Time [s]')
% title('MEAN HTC [kW/m^2/K]')
% xlim([95 250])
% legend(labels)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    ANIMATIONS                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TUTTE LE ANIMAZIONI SONO CON IL SECONDO LAMBDA 
idx = 2;

% % ----- PROFILE CHFR RELAP -------
% f0 = 1919; % initial frame (timestep)
% fend = 2900;
% figure('Position', [10 10 300 900])
% axial_plot(horzcat(data(idx).time(f0:fend,:), data(idx).CHFR_RELAP_axial(f0:fend,:)), true, 'CHFR (RELAP)', 'CHFR', 10, data(idx).ECCS_flag(f0:fend), data(idx).chf_flag(f0:fend), 'Animations/CHFR_RELAP')
% 
% % ----- PROFILE CHFR W3 -------
% f0 = 1919; % initial frame (timestep)
% fend = 2900;
% figure('Position', [10 10 300 900])
% axial_plot(horzcat(data(idx).time(f0:fend,:), data(idx).CHFR_W3_axial(f0:fend,:)), true, 'CHFR (W3)', 'CHFR', 10, data(idx).ECCS_flag(f0:fend), data(idx).chf_flag(f0:fend), 'Animations/CHFR_W3')
% 
% 
% % ----- PROFILE HTMODE -------
% f0 = 1919; % initial frame (timestep)
% fend = 3600; % final frame (timestep)
% f = figure('Position', [10 10 400 900], 'DefaultAxesFontSize',fs)
% htmode_plot(horzcat(data(idx).time(f0:fend,:), data(idx).ht_mode_axial(f0:fend,:)), true, 'Heat Transfer Mode', '', 1, 'Animations/HTMODE', data(idx).ECCS_flag(f0:fend), data(idx).chf_flag(f0:fend))

% % ----- PROFILE FLOW REGIME -------
% f0 = 1919; % initial frame (timestep)
% fend = 3600; % final frame (timestep)
% f = figure('Position', [10 10 400 900], 'DefaultAxesFontSize',fs)
% flowreg_plot(horzcat(data(idx).time(f0:fend,:), data(idx).flow_regimes_axial(f0:fend,:)), true, 'Flow Regime', '', 1, 'Animations/Flow Regime', data(idx).ECCS_flag(f0:fend), data(idx).chf_flag(f0:fend))
% 
% 
% % ----- PROFILE HTC -------
% f0 = 1919; % initial frame (timestep)
% fend = 3600;
% f = figure('Position', [10 10 400 900], 'DefaultAxesFontSize',fs)
% axial_plot(horzcat(data(idx).time(f0:fend,:), data(idx).htc_axial(f0:fend,:)), true, 'HTC (kW/m^2/K)', 'HTC (kW/m^2/K)', 100, data(idx).ECCS_flag(f0:fend), data(idx).chf_flag(f0:fend), 'Animations/HTC')
% % 
% % ----- PROFILE VOID FRACTION -------
% f0 = 1919; % initial frame (timestep)
% fend = 3600; % final frame (timestep)
% f = figure('Position', [10 10 400 900], 'DefaultAxesFontSize',fs)
% axial_plot(horzcat(data(idx).time(f0:fend,:), data(idx).void_fraction_axial(f0:fend,:)), true, 'Void Fraction \alpha', 'Void Fraction \alpha', 1, data(idx).ECCS_flag(f0:fend), data(idx).chf_flag(f0:fend), 'Animations/Void Fraction')
% 
% % ----- PROFILE RADIAL TEMPERATURE -------
% f0 = 1919; % initial frame (timestep)
% fend = 3600; % final frame (timestep)
% figure('DefaultAxesFontSize', fs-2)
% radial_plot_fuel(horzcat(data(idx).center_radial_temp_profile(f0:fend, :)-273.15, data(idx).time(f0:fend,:)), true, 'pwr', 'Animations/Radial Temperature', data(idx).ECCS_flag(f0:fend), data(idx).chf_flag(f0:fend))

% 
% % ----- PROFILE MAX FUEL TEMPERATURE -------
% f0 = 1919; % initial frame (timestep)
% fend = 3600; % final frame (timestep)
% f = figure('Position', [10 10 400 900], 'DefaultAxesFontSize',fs)
% axial_plot(horzcat(data(idx).time(f0:fend,:), data(idx).max_fuel_temp_axial(f0:fend,:)-273.15), true, 'Max Fuel Temp (°C)', 'Temperature (°C)', 2100, data(idx).ECCS_flag(f0:fend), data(idx).chf_flag(f0:fend),  'Animations/Max Fuel Temperature')
% 
% % ----- PROFILE MAX CLAD TEMPERATURE -------
% f0 = 1919; % initial frame (timestep)
% fend = 3600; % final frame (timestep)
% f = figure('Position', [10 10 400 900], 'DefaultAxesFontSize',fs)
% axial_plot(horzcat(data(idx).time(f0:fend,:), data(idx).max_clad_temp_axial(f0:fend,:)-273.15), true, 'Max Clad Temp (°C)', 'Temperature (°C)', 1300, data(idx).ECCS_flag(f0:fend), data(idx).chf_flag(f0:fend), 'Animations/Max Clad Temperature')

% 
% % ----- PROFILE HEAT FLUX -------
% f0 = 1919; % initial frame (timestep)
% fend = 3600; % final frame (timestep)
% f = figure('Position', [10 10 400 900], 'DefaultAxesFontSize',fs)
% axial_plot(horzcat(data(idx).time(f0:fend,:), data(idx).heat_flux_axial(f0:fend,:)), true, 'Heat Flux [kW/m^2]', 'Heat Flux [kW/m^2]', 1100, data(idx).ECCS_flag(f0:fend), data(idx).chf_flag(f0:fend), 'Animations/Heat Flux')
% 
% 
% % ----- PROFILE DENSITY MIXTURE -------
% f0 = 1919; % initial frame (timestep)
% fend = 3600; % final frame (timestep)
% f = figure('Position', [10 10 400 900], 'DefaultAxesFontSize',fs)
% axial_plot(horzcat(data(idx).time(f0:fend,:), data(idx).rho_axial(f0:fend,:)), true, 'Density Mixture (kg/m^3)', 'Density (kg/m^3)', 2000, data(idx).ECCS_flag(f0:fend), data(idx).chf_flag(f0:fend), 'Animations/Density')
% 
% % ----- PROFILE BULK TEMPERATURE LIQUID -------
% f0 = 1919; % initial frame (timestep)
% fend = 3600; % final frame (timestep)
% f = figure('Position', [10 10 400 900], 'DefaultAxesFontSize',fs)
% axial_plot(horzcat(data(idx).time(f0:fend,:), data(idx).temp_liquid_axial(f0:fend,:)-273.15), true, 'Bulk Temp. Liquid (°C)', 'Temperature (°C)', 600, data(idx).ECCS_flag(f0:fend), data(idx).chf_flag(f0:fend), 'Animations/Bulk Temperature Liquid')
% 
% % ----- PROFILE BULK TEMPERATURE VAPOR -------
% f0 = 1919; % initial frame (timestep)
% fend = 2900; % final frame (timestep)
% figure('Position', [10 10 300 900])
% axial_plot(horzcat(data(idx).time(f0:fend,:), data(idx).temp_vapor_axial(f0:fend,:)-273.15), true, 'Bulk Temperature Vapor [°C]', 'Temperature [°C]', 1100, data(idx).ECCS_flag(f0:fend), data(idx).chf_flag(f0:fend), 'Animations/Bulk Temperature Vapor')
% 
% 
% ------------ ENERGY BALANCE ----------------
f0 = 1919;
fend = 3600;
kin_energy = kinetic_energy(data(idx).velocity_liquid_axial, data(idx).velocity_vapor_axial, data(idx).density_liquid_axial, data(idx).density_vapor_axial);
pres_energy = pressure_energy(data(idx).pressure_axial);
figure('Position', [10 10 1000 1000], 'DefaultAxesFontSize', fs -4)
energy_balance(sum(data(idx).total_internal_energy_axial(f0:fend,:),2), kin_energy(f0:fend), pres_energy(f0:fend), data(idx).HS_internal_energy(f0:fend), data(idx).time(f0:fend), data(idx).rod_power(f0:fend), data(idx).power(f0:fend), data(idx).density_liquid_axial(f0:fend,:), data(idx).density_vapor_axial(f0:fend,:), 'Animations/Energy Balance')


