function [] = energy_balance (int_energy_pipe, kin_energy, pres_energy, int_energy_hs, time, power_generated, power_exchanged)
    % ricevo in input vettori colonna di n-righe per ogni dt contenenti le energie [J] totali di
    % pipe e heat structure, il tempo [s] e le potenze in gioco nel mio
    % sistema [W]
    
    tiledlayout(2,1)

    % convert from [J] to [kJ], [W] to [kW]
    int_energy_pipe=int_energy_pipe/1000;
    int_energy_hs=int_energy_hs/1000;
    kin_energy=kin_energy/1000;
    pres_energy=pres_energy/1000;
    power_generated=power_generated/1000;
    power_exchanged=power_exchanged/1000;
    power_stored = power_generated - power_exchanged;

    for i = 1:15:length(time)
        nexttile(1)

        pipe_energy = [int_energy_pipe(i,1) kin_energy(i,1) pres_energy(i,1)];
        hs_energy = [int_energy_hs(i,1) 0 0];
        data_to_plot = [pipe_energy ; hs_energy];
        x_legend = categorical({'Pipe total energy','Heat structure total energy'});
        bar(x_legend, data_to_plot ,'stacked');
        
        ylabel('Total energy [kJ]');
        title('Heat structure and pipe energies during time');
        y_max = max(int_energy_hs);
        ylim([0 1.2*y_max]);   
        legend('internal energy', 'kinetic energy', 'pressure energy')  
        grid on
    
        nexttile(2)
        hold on
        if i==1   
            plot(time(i), power_generated(i),'-o','Color','r','MarkerSize',6,'MarkerFaceColor','r');
            plot(time(i), power_exchanged(i),'-*','Color','b','MarkerSize',6,'MarkerFaceColor','b');
            plot(time(i), power_stored(i),'-^','Color','g','MarkerSize',6,'MarkerFaceColor','g');
            legend('power generated','power exchanged','power stored');
            ymax=max([power_generated' power_exchanged' power_stored']);
            ymin=min([power_generated' power_exchanged' power_stored']);
            xmax=max(time);
            xmin=min(time);
            ylim([ymin 1.2*ymax]);
            xlim([xmin xmax]);
            ylabel('Power [kW]');
            xlabel('Time [s]');
            title('Power during time');
            grid on
        else
            plot(time(i-1:i), power_generated(i-1:i),'-o','Color','r','MarkerSize',6,'MarkerFaceColor','r');
            plot(time(i-1:i), power_exchanged(i-1:i),'-*','Color','b','MarkerSize',6,'MarkerFaceColor','b');
            plot(time(i-1:i), power_stored(i-1:i),'-^','Color','g','MarkerSize',6,'MarkerFaceColor','g');
            legend('power generated','power exchanged','power stored');
        end
      
        pause(0.8)

    end

end