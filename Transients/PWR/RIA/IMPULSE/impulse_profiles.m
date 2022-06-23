react = [1000, 2000, 3000, 4000, 5000, 6000]*1e-5; %[pcm]
r = react(end);
accident_time = 110; % [s]

for i=1:length(react)
    labels(i) = sprintf("\\rho = %s pcm", string(react(i)*1e5));
end

% DATI
m_uo2 = 2.115;   % [kg]
P0 = 66.35188;   % [kW]

c_fuel = 235;     % [J/g/K]  specific heat capacity fuel
beta = 0.0065;    % []       delayed neutron fraction
l = 40e-6;        % [s]      effective neutron lifetime
ftc = -3;         % [pcm/K]  fuel temperature coefficient

t_max = 0;

energy = zeros(1,length(react));

%% APPLICO MODELLO DI NORDHEIM-FUCHS PER IL PROFILO DI IMPULSO
f = figure('Position', [10 10 1100 900]);
hold on
for i=1:length(react)
    P_max = -m_uo2*(c_fuel*(react(i) - beta)^2)/(2*l*ftc);  % [kW]

    a = 0.04;
    n = 1000;
    t = linspace(-a,a, n);
    delta_t = 2*a/(n-1);
    P_impulso = P_max*(1./cosh((react(i)-beta).*(t-t_max)./(2.*l))).^2;  % [kW]
    energy(i) = trapz(P_impulso)*delta_t; % [kJ]

    plot(t,P_impulso, 'LineWidth', 1.5);
end
hold off
grid on, grid minor
ylabel('Power [kW]')
xlabel('Time [s]')
title('Power impulse profile for reactivity insertion')
legend(labels)
saveas(f, "ppt_photos/power_impulses.png");

f = figure('Position', [10 10 800 800]);
bar(react*1e5,energy)
grid on
xlabel('Reactivity [pcm]')
ylabel('Energy Released [kJ]')
title('Energy released by power impulse [kJ]')
saveas(f, "ppt_photos/energy_impulses.png");
