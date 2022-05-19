function [U] = compute_internal_energy_HS(temperatures)
% The function computes the internal energy of a series of axial intervals
% of the heat structure (summing them). THE FUNCTION IS APPLICABLE TO PWR
% ONLY!
%
%   INPUTS:
%           - temperatures [K]: axial profile of heat structure volume
%                               averaged temperature of the volumes
%                               (HTVAT), its a matrix of size (n_timesteps,50)
%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              DATA           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% GEOMETRY [SI UNITS]
D_fuel = 8.192E-3;
t_gap = 8.260E-5; 
t_clad = 5.720E-4;
H = 0.07752;

V_fuel = (pi*(D_fuel^2)/4)*H;
V_gap = (pi*(D_fuel/2 + t_gap)^2)*H - V_fuel;
V_clad = (pi*(D_fuel/2 + t_gap + t_clad)^2)*H - V_fuel - V_gap;

V_tot = V_fuel + V_gap + V_clad;

% VOLUMETRIC HEAT CAPACITY
c_fuel = 3839500.0;   % [J/m3/K]
c_gap = 10.126;       % [J/m3/K]
c_clad = 2200000.0;   % [J/m3/K]

c_rod = (V_fuel*c_fuel + V_gap*c_gap + V_clad*c_clad)/V_tot; % [J/m3/K]
C_rod = V_tot*c_rod;  % [J/K]



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       INTERNAL ENERGY       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

U = sum(C_rod.*temperatures, 2); % Internal energy of the whole rod (U=0 if T=0K)
 
end