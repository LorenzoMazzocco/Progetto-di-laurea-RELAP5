addpath(genpath('../../../../utils/'));
warning('OFF', 'MATLAB:table:ModifiedAndSavedVarnames')

clear all
clc

fs = 20;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                DATA EXCTRACTION               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = readtable('../out/data.csv');

% -----TIME-----
time = data.time;
% ----TOTAL POWER -----
power = data.cntrlvar110;
% ----OUTLET TEMPERATURE ---
T_out = data.tempf555500000;

% ----- MAX FUEL TEMP -----
T_fuel_max_do = data.httemp555000101;
T_fuel_max_med = data.httemp555002501;
T_fuel_max_up = data.httemp555005001;

% ----- MAX CLAD TEMP -----
T_clad_max_do = data.httemp555000108;
T_clad_max_med = data.httemp555002508;
T_clad_max_up = data.httemp555005008;


% ---- MIDDLE FUEL ROD RADIAL TEMPERATURE PROFILE ----
T_profile = data(:,{'httemp555002501', ...
                    'httemp555002502', ...
                    'httemp555002503', ...
                    'httemp555002504', ...
                    'httemp555002505', ...
                    'httemp555002506', ...
                    'httemp555002507', ...
                    'httemp555002508', ...
                    'httemp555002509', ...
                    'httemp555002510', ...
                    'tempf555250000', ...
                    'time'});
T_profile = table2array(T_profile);

% ---- PRESSURE DROP ----
p_drop = data.cntrlvar120;

% ---- AXIAL PROFILE MAX FUEL TEMPERATURE ----
T_max_fuel_axial = table2array(data);
T_max_fuel_axial = T_max_fuel_axial(:,22:71);

% ---- AXIAL PROFILE HT MODE ------
HTMODE_axial = table2array(data);
HTMODE_axial = HTMODE_axial(:, 72:121);

% ---- HEAT FLUX [kW/mq] ------
heat_flux_axial = table2array(data);
heat_flux_axial = heat_flux_axial(:,122:171)./1000;

% -------- HTC [kW/mq/K]--------
htc_axial = table2array(data);
htc_axial = htc_axial(:, 172:221)./1000;

% ---- FLOW REGIMES ----
flow_reg_axial = table2array(data);
flow_reg_axial = flow_reg_axial(:, 222:271);

% ---- VOID FRACTION ----
void_axial = table2array(data);
void_axial = void_axial(:, 272:321);

% ---- EQUILIBRIUM QUALITY ----
quality_axial = table2array(data);
quality_axial = quality_axial(:, 322:371);

% ---- SPECIFIC SAT LIQUID ENTHALPY ----
enthalpy_f_axial = table2array(data);
enthalpy_f_axial = enthalpy_f_axial(:, 372:421);

% ---- PRESSURE AXIAL ----
pressure_axial = table2array(data);
pressure_axial = pressure_axial(:, 422:471);


% ---- AXIAL CHFR ------
CHF_W3 = CHF_W3(pressure_axial(end,:), quality_axial(end,:), 0.335, enthalpy_f_axial(end,:), heat_flux_axial(end,:), 8.79e-5, 1.17808e-2, 3.876);
CHFR = CHF_W3(1:48)./heat_flux_axial(end,1:48);


% ---- AXIAL CHFR ------
% chfr = table2array(data);
% chfr = chfr(:,122:171);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SENSITIVITY ANALYSIS %%%%%%%%%%%%%%%%%%%%%%%%
sens_analysis_absolute = readtable("../../../Sensitivity Analysis/PWR/sensitivity_absolute.csv")
sens_analysis_relative = readtable("../../../Sensitivity Analysis/PWR/sensitivity_relative.csv")
sens_analysis_adimensional = readtable("../../../Sensitivity Analysis/PWR/sensitivity_adimensional.csv")
parameter_lables = sens_analysis_relative.Properties.VariableNames;
sens_analysis_absolute = table2array(sens_analysis_absolute);
sens_analysis_relative = table2array(sens_analysis_relative);
sens_analysis_adimensional = table2array(sens_analysis_adimensional);

% Sostituisco agli zeri numeri piccolissimi in modo da non avere rogne con
% le funzioni di plotting
R = rand(3,length(parameter_lables))*1e-10;
sens_analysis_absolute(sens_analysis_absolute == 0) = R(sens_analysis_absolute == 0);
sens_analysis_relative(sens_analysis_relative == 0) = R(sens_analysis_relative == 0);
sens_analysis_adimensional(sens_analysis_adimensional == 0) = R(sens_analysis_adimensional == 0);

sa_abs_max_fuel = sens_analysis_absolute(1,:);
sa_abs_max_clad = sens_analysis_absolute(2,:);
sa_abs_mdnbr = sens_analysis_absolute(3,:);
sa_rel_max_fuel = sens_analysis_relative(1,:);
sa_rel_max_clad = sens_analysis_relative(2,:);
sa_rel_mdnbr = sens_analysis_relative(3,:);
sa_adi_max_fuel = sens_analysis_adimensional(1,:);
sa_adi_max_clad = sens_analysis_adimensional(2,:);
sa_adi_mdnbr = sens_analysis_adimensional(3,:);

%%%%%%%%%%%%%%%%%%%%% SENSITIVITY ANALYSIS CONDUCTIVITY %%%%%%%%%%%%%%%%%%%
sens_analysis_k_relative = readtable("../../../Sensitivity Analysis/PWR/sensitivity_conductivity_relative.csv")
sens_analysis_k_adimensional = readtable("../../../Sensitivity Analysis/PWR/sensitivity_conductivity_adimensional.csv")

parameter_lables_k = sens_analysis_k_relative.Properties.VariableNames;
sens_analysis_k_relative = table2array(sens_analysis_k_relative);
sens_analysis_k_adimensional = table2array(sens_analysis_k_adimensional);

% Sostituisco agli zeri numeri piccolissimi in modo da non avere rogne con
% le funzioni di plotting
R = rand(3,length(parameter_lables_k))*1e-10;
sens_analysis_k_relative(sens_analysis_k_relative == 0) = R(sens_analysis_k_relative == 0);
sens_analysis_k_adimensional(sens_analysis_k_adimensional == 0) = R(sens_analysis_k_adimensional == 0);


sak_rel_max_fuel = sens_analysis_k_relative(1,:);
sak_rel_max_clad = sens_analysis_k_relative(2,:);
sak_rel_mdnbr = sens_analysis_k_relative(3,:);
sak_adi_max_fuel = sens_analysis_k_adimensional(1,:);
sak_adi_max_clad = sens_analysis_k_adimensional(2,:);
sak_adi_mdnbr = sens_analysis_k_adimensional(3,:);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                            %
%                           PLOTS                            %
%                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SENSITIVITY ANALYSIS %%%%%%%%%%%%%%%%%%%%%%%%

% % --------- RELATIVE PLOT ------------
% figure('Position', [10 10 900 900])
% t = tiledlayout(3,1, 'TileSpacing', 'normal');
% title(t, "SA RELATIVE")
% 
% % Relative Fuel Temp
% nexttile
% Y = sa_rel_max_fuel;
% if length(Y) == length(unique(Y))
%     X = categorical(sort(Y), Y, parameter_lables);
%     X = reordercats(X,string(X));
% else
%     X = categorical(Y);
% end
% barh(X,sort(Y))
% xlabel("Temperature Variation [ ^{??K}/_{%} ]")
% title("Max Fuel Temperature")
% 
% % Relative Clad Temp
% nexttile
% Y = sa_rel_max_clad;
% if length(Y) == length(unique(Y))
%     X = categorical(sort(Y), Y, parameter_lables);
%     X = reordercats(X,string(X));
% else
%     X = categorical(Y);
% end
% barh(X,sort(Y))
% title("Max Clad Temperature")
% xlabel("Temperature Variation [ ^{??K}/_{%} ]")
% 
% % Relative MDNBR
% nexttile
% Y = sa_rel_mdnbr;
% if length(Y) == length(unique(Y))
%     X = categorical(sort(Y), Y, parameter_lables);
%     X = reordercats(X,string(X));
% else
%     X = categorical(Y);
% end
% barh(X,sort(Y))
% title("MDNBR")
% xlabel("MDNBR Variation [ ^{1}/_{%} ]")
% 
% 
% % --------- ADIMENSIONAL PLOT ------------
% f = figure('Position', [10 10 900 900])
% t = tiledlayout(3,1, 'TileSpacing', 'normal');
% title(t, "SA ADIMENSIONALE")
% 
% % Adimensional Fuel Temp
% nexttile
% Y = sa_adi_max_fuel;
% if length(Y) == length(unique(Y))
%     X = categorical(sort(Y), Y, parameter_lables);
%     X = reordercats(X,string(X));
% else
%     X = categorical(Y);
% end
% barh(X,sort(Y))
% xlabel("Variazione Temperatura ( ^{%}/_{%} )")
% title("TEMPERATURA MASSIMA COMBUSTIBILE")
% 
% % Adimensional Clad Temp
% nexttile
% Y = sa_adi_max_clad;
% if length(Y) == length(unique(Y))
%     X = categorical(sort(Y), Y, parameter_lables);
%     X = reordercats(X,string(X));
% else
%     X = categorical(Y);
% end
% barh(X,sort(Y))
% title("TEMPERATURA MASSIMA CLADDING")
% xlabel("Variazione Temperatura ( ^{%}/_{%} )")
% 
% % Adimensional MDNBR
% nexttile
% Y = sa_adi_mdnbr;
% if length(Y) == length(unique(Y))
%     X = categorical(sort(Y), Y, parameter_lables);
%     X = reordercats(X,string(X));
% else
%     X = categorical(Y);
% end
% barh(X,sort(Y))
% title("MDNBR")
% xlabel("VARIAZIONE MDNBR ( ^{%}/_{%} )")
% saveas(f, 'photo_ppt/sa1.png')

% 
% 
% %%%%%%%%%%%%%%%%%%%%% SENSITIVITY ANALYSIS CONDUCTIVITY %%%%%%%%%%%%%%%%%%%
% 
% % --------- RELATIVE PLOT ------------
% figure('Position', [10 10 900 900])
% t = tiledlayout(3,1, 'TileSpacing', 'normal');
% title(t, "SA CONDUCTIVITY RELATIVE")
% % Relative Fuel Temp
% nexttile
% Y = sak_rel_max_fuel;
% if length(Y) == length(unique(Y))
%     X = categorical(sort(Y), Y, parameter_lables_k);
%     X = reordercats(X,string(X));
% else
%     X = categorical(Y);
% end
% barh(X,sort(Y))
% xlabel("Temperature Variation [ ^{??K}/_{%} ]")
% title("Max Fuel Temperature")
% 
% % Relative Clad Temp
% nexttile
% Y = sak_rel_max_clad;
% if length(Y) == length(unique(Y))
%     X = categorical(sort(Y), Y, parameter_lables_k);
%     X = reordercats(X,string(X));
% else
%     X = categorical(Y);
% end
% barh(X,sort(Y))
% title("Max Clad Temperature")
% xlabel("Temperature Variation [ ^{??K}/_{%} ]")
% 
% 
% 
% % --------- ADIMENSIONAL PLOT ------------
% f = figure('Position', [10 10 900 900])
% t = tiledlayout(3,1, 'TileSpacing', 'normal');
% title(t, "SA CONDUCTIVITY ADIMENSIONALE")
% 
% % Adimensional Fuel Temp
% nexttile
% Y = sak_adi_max_fuel;
% if length(Y) == length(unique(Y))
%     X = categorical(sort(Y), Y, parameter_lables_k);
%     X = reordercats(X,string(X));
% else
%     X = categorical(Y);
% end
% barh(X,sort(Y))
% xlabel("Variazione Temperatura ( ^{%}/_{%} )")
% title("TEMPERATURA MASSIMA COMBUSTIBILE")
% 
% 
% % Adimensional Clad Temp
% nexttile
% Y = sak_adi_max_clad;
% if length(Y) == length(unique(Y))
%     X = categorical(sort(Y), Y, parameter_lables_k);
%     X = reordercats(X,string(X));
% else
%     X = categorical(Y);
% end
% barh(X,sort(Y))
% title("TEMPERATURA MASSIMA CLADDING")
% xlabel("Variazione Temperatura ( ^{%}/_{%} )")
% saveas(f, 'photo_ppt/sa2.png')

% 
% 
% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% OTHER %%%%%%%%%%%%%%%%%%%%%%%%

% % ---- TOTAL POWER EXCHANGED -----
% f = figure('Position', [10 10 900 900], 'DefaultAxesFontSize',fs)
% plot(time,power, 'LineWidth', 2.8 , 'Color', 'r');
% str = strcat({'   '}, num2str(power(end),3));
% text(time(end), power(end), str, "FontSize", fs, 'FontWeight','bold');
% grid on, grid minor
% xlabel('Tempo (s)')
% ylabel('Potenza (kW)')
% title('POTENZA SCAMBIATA AL FLUIDO (kW)')
% saveas(f, 'photo_ppt/power_to_fluid.png')
% % 
% % --- -OUTLET TEMPERATURE ----
% f = figure('Position', [10 10 900 900], 'DefaultAxesFontSize',fs)
% plot(time,T_out-273.15, 'LineWidth', 2.8, 'Color', 'r');
% str = strcat({'   '}, num2str(T_out(end)-273.15,3));
% text(time(end), T_out(end)-273.15, str, "FontSize", fs, 'FontWeight','bold');
% grid on, grid minor
% xlabel('Tempo (s)')
% ylabel('Temperatura (??C)')
% title('TEMPERATURA USCITA FLUIDO (??C)')
% saveas(f, 'photo_ppt/outlet_temperature.png')

% % ----- MAX FUEL TEMP -----
% figure('Position', [10 10 900 900])
% hold on
% plot(time,T_fuel_max_do, 'LineWidth', 1.3, 'Color', 'b');
% plot(time,T_fuel_max_med, 'LineWidth', 1.3, 'Color', 'g');
% plot(time,T_fuel_max_up, 'LineWidth', 1.3, 'Color', 'r');
% hold off
% str = strcat({'   '}, num2str(T_fuel_max_med(end),3));
% text(time(end), T_fuel_max_med(end), str, "FontSize", 12, 'FontWeight','bold');
% str = strcat({'   '}, num2str(T_fuel_max_do(end),3));
% text(time(end), T_fuel_max_do(end), str, "FontSize", 12, 'FontWeight','bold');
% str = strcat({'   '}, num2str(T_fuel_max_up(end),3));
% text(time(end), T_fuel_max_up(end), str, "FontSize", 12, 'FontWeight','bold');
% grid on, grid minor
% legend('bottom', 'center', 'top','Location','northwest')
% xlabel('Time [s]')
% title('MAX FUEL TEMPERATURE [K]')
% 
% % ----- MAX CLAD TEMP -----
% figure('Position', [10 10 900 900])
% hold on
% plot(time,T_clad_max_do, 'LineWidth', 1.3, 'Color', 'b');
% plot(time,T_clad_max_med, 'LineWidth', 1.3, 'Color', 'g');
% plot(time,T_clad_max_up, 'LineWidth', 1.3, 'Color', 'r');
% hold off
% str = strcat({'   '}, num2str(T_clad_max_do(end),3));
% text(time(end), T_clad_max_do(end), str, "FontSize", 12, 'FontWeight','bold');
% str = strcat({'   '}, num2str(T_clad_max_med(end),3));
% text(time(end), T_clad_max_med(end), str, "FontSize", 12, 'FontWeight','bold');
% str = strcat({'   '}, num2str(T_clad_max_up(end),3));
% text(time(end), T_clad_max_up(end), str, "FontSize", 12, 'FontWeight','bold');
% grid on, grid minor
% legend('bottom', 'center', 'top','Location','northwest')
% xlabel('Time [s]')
% title('MAX CLAD TEMPERATURE [K]')
% 
% % ----- AXIAL PROFILE MAX TEMP FUEL -------
% f = figure('Position', [10 10 400 900], 'DefaultAxesFontSize',fs)
% axial_plot(T_max_fuel_axial(end,:)-273.15, false, 'TEMP. MAX  UO2 (??C)', 'Temperatura (??C)', 2000-273.15)
% saveas(f, 'photo_ppt/axial_max_fuel_temp.png')
% % 
% % 
% % ----- AXIAL PROFILE HTMODE -------
% f = figure('Position', [10 10 400 900], 'DefaultAxesFontSize',fs)
% htmode_plot(HTMODE_axial(end,:), false, 'Heat Transfer Mode', '', 1)
% saveas(f, 'photo_ppt/axial_htmode.png')
% 
% % ----- AXIAL PROFILE HEAT FLUX -------
% f = figure('Position', [10 10 400 900], 'DefaultAxesFontSize',fs)
% axial_plot(heat_flux_axial(end,:), false, 'FLUSSO TERMICO (kW/m^2)', 'Flusso termico (kW/m^2)', 1500)
% saveas(f, 'photo_ppt/axial_heat_flux.png')
% % 
% % ----- AXIAL PROFILE HTC -------
% f = figure('Position', [10 10 400 900], 'DefaultAxesFontSize',fs)
% axial_plot(htc_axial(end,:), false, 'HTC (kW/m^2/K)', 'HTC (kW/m^2/K)', 100)
% saveas(f, 'photo_ppt/axial_htc.png')
% 
% % ----- AXIAL PROFILE FLOW REGIME -------
% f = figure('Position', [10 10 400 900], 'DefaultAxesFontSize',fs)
% flowreg_plot(flow_reg_axial(end,:), false, 'Flow Regime', '', 1)
% saveas(f, ['photo_ppt/axial_flow_reg.png'])
% 
% % ----- AXIAL PROFILE VOID FRACTION -------
% f = figure('Position', [10 10 400 900], 'DefaultAxesFontSize',fs)
% axial_plot(void_axial(end,:), false, 'Void Fraction', 'Void Fraction', 1)
% saveas(f, 'photo_ppt/axial_void_fraction.png')
% 
% % ----- AXIAL PROFILE CHF W-3 -------
% f = figure('Position', [10 10 400 900], 'DefaultAxesFontSize',fs)
% axial_plot(CHF_W3, false, 'CHF W-3 (kW/m^2)', 'CHF (kW/m^2)', 6000)
% saveas(f, 'photo_ppt/axial_chfw3.png')
% 
% % ----- AXIAL PROFILE CHFR -------
% f = figure('Position', [10 10 400 900], 'DefaultAxesFontSize',fs)
% MDNBR = min(CHFR);
% title = strcat(["MDNBR:{ }", num2str(MDNBR)]);
% axial_plot(CHFR, false, 'CHFR', title, 6)
% saveas(f, 'photo_ppt/CHFR.png')
% 
% ----- PROFILE RADIAL TEMP FUEL ------
f = figure('DefaultAxesFontSize',fs-4)
radial_plot_fuel(T_profile(end,:)-273.15, false, 'pwr')
saveas(f, 'photo_ppt/radial_temp.png')



% ----- AXIAL CHFR -------
% figure('Position', [10 10 300 900])
% chfr_axial_plot(chfr(end,:), false, 'Axial Profile - CHFR', 'CHFR', 30)
% 
% ----- ANIMATION PROFILE MAX TEMP FUEL -------
% figure('Position', [10 10 300 900])
% axial_plot(horzcat(time, T_max_fuel_axial), true, 'Animation Profile - Max Fuel Temperature', 'Fuel Temperature [K]', 3000)
% 
% % ----- ANIMATION PROFILE HTMODE -------
% % figure('Position', [10 10 300 900])
% % htmode_plot(horzcat(time, HTMODE_axial), true, 'Animation Profile - Heat Transfer Mode', '', 1)
% 
% % ----- ANIMATION PROFILE RADIAL TEMP FUEL ------
% % figure(10)
% % radial_plot_fuel(T_profile, true, 'pwr')
