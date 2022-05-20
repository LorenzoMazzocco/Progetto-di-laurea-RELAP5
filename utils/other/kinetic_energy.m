function [kinetic_energy_total] = kinetic_energy (vel_liq, vel_vap, rho_liq, rho_vap)
    % gli input sono 4 matrici di n-colonne per ogni volumetto della pipe e
    % m-righe per ogni dt
    
    A = 8.79e-5;                        % [m^2]
    height = 0.07752;                   % [m]
    single_volume = A*height;           % [m^3]
    
    % calcolo l'energia cinetica di ciascun volume in ogni istante di tempo
    % separatamente per liquido e vapore
    
    kin_energy_liq_sngl =  single_volume .* (rho_liq .* vel_liq .^ 2) / 2; % [J]
    kin_energy_vap_sngl =  single_volume .* (rho_vap .* vel_vap .^ 2) / 2; % [J]
    
    % ora sommo tutti gli elementi di ogni riga e ottengo l'energia
    % cinetica del liquido e del vapore contenuti nella pipe per ogni time step
    
    kin_energy_total_liq = sum(kin_energy_liq_sngl , 2);   % [J]
    kin_energy_total_vap = sum(kin_energy_vap_sngl , 2);   % [J]
    
    % ora sommo i due vettori e ottengo un vettore colonna con l'energia
    % totale del fluido per ciascun time step in ogni riga
    
    kinetic_energy_total = kin_energy_total_vap + kin_energy_total_liq;     % [J]
end