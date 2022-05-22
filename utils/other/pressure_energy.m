function [pressure_energy] = pressure_energy (pressure)
    % prendo in input una matrice di n-colonne per ogni volume e m-righe
    % per ogni dt. 
    % restituisco un vettore colonna di m-righe rappresentante l'energia di
    % pressione di tutto il fluido contenuto nella pipe per ogni dt

    % la pressione è estratta in Pa

    A = 8.79e-5;                        % [m^2]
    height = 0.07752;                   % [m]
    single_volume = A*height;           % [m^3]

    pressure_energy = single_volume .* sum(pressure,2);   % [J]
end