function [] = energy_balance (int_energy_pipe, kin_energy, pres_energy, int_energy_hs, time, power_generated, power_exchanged, rho_liq, rho_vap, videoname)
    % ricevo in input vettori colonna di n-righe per ogni dt contenenti le energie [J] totali di
    % pipe e heat structure, il tempo [s] e le potenze in gioco nel mio
    % sistema [W]

    % Convert from [J] to [kJ], [W] to [kW]
    int_energy_pipe = int_energy_pipe / 1000;
    int_energy_hs = int_energy_hs / 1000;
    kin_energy = kin_energy / 1000;
    pres_energy = pres_energy / 1000;
    power_generated = power_generated / 1000;
    power_stored = power_generated - power_exchanged;

        %% Energie specifiche
    A = 8.79e-5;                                                % [m^2]
    height = 0.07752;                                           % [m]
    single_volume = A*height;                                   % [m^3]

    % ricavo 2 matrici contenenti la massa di liquido e vapore per ogni
    % volumetto ad ogni dt
    mass_liq = rho_liq .* single_volume;                        % [kg]
    mass_vap = rho_vap .* single_volume;                        % [kg]

    % ottengo il vettore colonna contenente la massa totale di fluido in
    % tutta la pipe per ciascun dt
    total_mass_pipe = sum(mass_liq + mass_vap, 2);              % [kg]

    % ricavo il vettore colonna dell'energia interna specifica del fluido
    specific_int_energy_pipe = int_energy_pipe ./ total_mass_pipe;   % [kJ/kg]

    % ricavo il vettore colonna dell'energia interna specifica del fluido
    specific_kin_energy = kin_energy ./ total_mass_pipe;        % [kJ/kg]
        
    % ricavo il vettore colonna dell'energia interna specifica del fluido
    specific_pres_energy = pres_energy ./ total_mass_pipe;      % [kJ/kg]

    %%

    tiledlayout(2,1)

    % Initialize Video
    myVideo = VideoWriter(videoname); %open video file
    myVideo.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
    open(myVideo)

    for i = 1:15:length(time)
        clf

        nexttile(1)
        
        yyaxis left
        pipe_energy = [int_energy_pipe(i,1) kin_energy(i,1) pres_energy(i,1)];
        hs_energy = [int_energy_hs(i,1) 0 0];
        data_to_plot_left = [pipe_energy; hs_energy; [0 0 0]];
        x_legend_left = categorical({'Channel Fluid', 'Heat Structure', 'Channel Fluid - specific'});
        x_legend_left = reordercats(x_legend_left, {'Channel Fluid', 'Heat Structure', 'Channel Fluid - specific'});
        bar(x_legend_left, data_to_plot_left, 0.3, 'stacked');
        
        left_colors = [[138 47 1]/255; [0 158 207]/255; [153 207 0]/255];
        colororder(left_colors);
        y_axis_left=gca;
        y_axis_left.YColor = 'black';
        
        ylabel('Total energy [kJ]');
        y_max_left = max(int_energy_hs);
        ylim([0 1.2*y_max_left]);  
        
        title('Heat structure and channel fluid energies');  
        grid on
        grid minor
        
        yyaxis right

        specific_pipe_energy = [specific_int_energy_pipe(i,1) specific_kin_energy(i,1) specific_pres_energy(i,1)];
        data_to_plot_right = [[0 0 0]; [0 0 0]; specific_pipe_energy];
        bar(data_to_plot_right, 0.2, 'stacked');
        
%         right_colors = [[228 47 1]/255; [0 248 207]/255; [243 207 0]/255];
        colororder(left_colors);
        y_axis_right=gca;
        y_axis_right.YColor = 'black';

        ylabel('Total specific energy [kJ/kg]');
        y_max_right = max(specific_int_energy_pipe);
        ylim([0 1.2*y_max_right]);  

        legend('Internal', 'Kinetic', 'Pressure')

    
        nexttile(2)
        hold on  
        plot(time(1:i), power_generated(1:i),'Color',[201 68 2]/255,'LineWidth',1.6);
        plot(time(1:i), power_exchanged(1:i),'Color',[84 167 255]/255,'LineWidth',1.6);
        plot(time(1:i), power_stored(1:i),'Color',[74 74 74]/255,'LineWidth',1.6);
        ymax=max([power_generated' power_exchanged' power_stored']);
        ymin=min([power_generated' power_exchanged' power_stored']);
        xmax=max(time);
        xmin=min(time);
        ylim([ymin 1.2*ymax]);
        xlim([xmin xmax]);
        ylabel('Power [kW]');
        xlabel('Time [s]');
        title('Power [kW]');
        grid on
        legend('Generated in rod','Exchanged to fluid','Stored in rod','Location','west');

        drawnow
        frame = getframe(gcf); %get frame
        writeVideo(myVideo, frame);
    end
    close(myVideo);
end