function [] = energy_balance (int_energy_pipe, kin_energy, pres_energy, int_energy_hs, time, power_generated, power_exchanged, videoname)
    % ricevo in input vettori colonna di n-righe per ogni dt contenenti le energie [J] totali di
    % pipe e heat structure, il tempo [s] e le potenze in gioco nel mio
    % sistema [W]
    
    tiledlayout(2,1)

    % Convert from [J] to [kJ], [W] to [kW]
    int_energy_pipe=int_energy_pipe/1000;
    int_energy_hs=int_energy_hs/1000;
    kin_energy=kin_energy/1000;
    pres_energy=pres_energy/1000;
    power_generated=power_generated/1000;
    power_stored = power_generated - power_exchanged;

    % Initialize Video
    myVideo = VideoWriter(videoname); %open video file
    myVideo.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
    open(myVideo)

    for i = 1:15:length(time)
        clf
        nexttile(1)

        pipe_energy = [int_energy_pipe(i,1) kin_energy(i,1) pres_energy(i,1)];
        hs_energy = [int_energy_hs(i,1) 0 0];
        data_to_plot = [pipe_energy ; hs_energy];
        x_legend = categorical({'Channel Fluid','Heat Structure'});
        bar(x_legend, data_to_plot, 0.2, 'stacked');
        
        ylabel('Total energy [kJ]');
        title('Heat structure and channel fluid energies [kJ]');
        y_max = max(int_energy_hs);
        ylim([0 1.2*y_max]);   
        legend('Internal', 'Kinetic', 'Pressure')  
        grid on
        grid minor
    
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