function [] = radial_plot_fuel(tt, animate, reactor_type, videoname, ECCS_flag, DNB_flag)
% La funzione richiede di indicare con quale modalità procedere
% inserendo una variabile booleana per il valore animate:
%
%   - animate: tt deve essere una matrice di valori di temperatura radiali
%              nel tempo
%
%   - fixed: tt deve essere un'array monodimensionale con i valori radiali
%            da rappresentare
%
%   
%   + reactor_type è una stringa ('pwr', 'bwr')


    % Cambio la grandezza della finestra per renderla grande
    set(gcf, 'Position',  [50, 50, 800, 500])
    
ECCS_colors = [[255 52 41]; [99 214 71]]./255;
DNB_colors = [[99 214 71]; [255 52 41]]./255;

    if strcmp(reactor_type, 'pwr')
        rr = [0 0.67817 1.35633 2.03450 2.71267 3.39083 4.06900 4.17860 4.4646 4.7506 5.7506];
    end
    if strcmp(reactor_type, 'bwr')
        rr = [0 0.8 1.6 2.4 3.2 4.0 4.8 4.89 5.245 5.6]
    end
    
        
    time = tt(:,12);

    if animate
        % Initialize Video
        myVideo = VideoWriter(videoname); %open video file
        myVideo.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
        open(myVideo)
        hold on
        patch([rr(1) rr(7) rr(7) rr(1)], [0 0 3000 3000], [89 89 89]./255, 'LineStyle', 'none')
        patch([rr(7) rr(8) rr(8) rr(7)], [0 0 3000 3000], [255 255 128]./255, 'LineStyle', 'none')
        patch([rr(8) rr(10) rr(10) rr(8)], [0 0 3000 3000], [166 166 166]./255, 'LineStyle', 'none')
        patch([rr(10) rr(11) rr(11) rr(10)], [0 0 3000 3000], [0 138 230]./255, 'LineStyle', 'none')
        hold off
        alpha(.85)
        h = animatedline('LineWidth', 2.5, 'Color', 'r');
        j = animatedline('LineWidth', 2.5, 'Color', 'r', 'LineStyle','--');
        
        ylim([0 2200])
        xlim([0 rr(11)])
        xlabel('Distanza dal centro (mm)') 
        ylabel('Temperatura (°C)')
        title('DISTRIBUZIONE DI TEMPERATURA NELLA BARRA')

        for i=2:10:length(time)
            clearpoints(h);
            addpoints(h, rr(1:10), tt(i,1:10));
            drawnow nocallbacks
            clearpoints(j);
            addpoints(j, [rr(10) rr(11)], [tt(i,11) tt(i,11)]);
            drawnow nocallbacks

            dim = [.2 0 .3 .3];
            timestep = sprintf("%.1f", time(i));
            str = strcat('TIME:',{'  '}, timestep, ' s');
            annotation('textbox',dim,'String',str, 'FitBoxToText','on', 'BackgroundColor','w', 'FontSize', 14);

            dim = [.8 .8 .1 .1];
            str = strcat(' ECCS');
            annotation('textbox',dim,'string',str,'FitBoxToText','on','BackgroundColor',ECCS_colors(ECCS_flag(i)+1,:), 'FontSize', 14);

            dim = [.8 .72 .1 .1];
            str = strcat(' DNB');
            annotation('textbox',dim,'string',str,'FitBoxToText','on','BackgroundColor',DNB_colors(DNB_flag(i)+1,:), 'FontSize', 14);

            frame = getframe(gcf); %get frame
            writeVideo(myVideo, frame);
        end
        close(myVideo);

    else
               
        hold on
        patch([rr(1) rr(7) rr(7) rr(1)], [0 0 3000 3000], [89 89 89]./255, 'LineStyle', 'none')
        patch([rr(7) rr(8) rr(8) rr(7)], [0 0 3000 3000], [255 255 128]./255, 'LineStyle', 'none')
        patch([rr(8) rr(10) rr(10) rr(8)], [0 0 3000 3000], [166 166 166]./255, 'LineStyle', 'none')
        patch([rr(10) rr(11) rr(11) rr(10)], [0 0 3000 3000], [0 138 230]./255, 'LineStyle', 'none')
        hold off
        alpha(.85)
        hold on
        line([0 rr(8)], [tt(8) tt(8)], 'LineWidth', 1.2, 'LineStyle', '--', 'Color', [1 1 1])
        line([0 rr(7)], [tt(7) tt(7)], 'LineWidth', 1.2, 'LineStyle', '--', 'Color', [1 1 1])
        plot(rr(1:10),tt(:,1:10), 'LineWidth', 2.5, 'Color', 'r')
        plot([rr(10) rr(11)], [tt(11) tt(11)], 'LineWidth', 2.5, 'LineStyle','--', 'Color', 'r')
        %errorbar(rr(2)/6, tt(1), 80, 80, 'LineWidth', 2.0, 'Color', [1 1 1])
        %errorbar(rr(2)/6, tt(1), 160, 160, 'LineWidth', 1.4, 'Color', [1 1 1])
        %errorbar(rr(2)/6, tt(1), 240, 240, 'LineWidth', 1.0, 'Color', [1 1 1])
        hold off
        ylim([0 1600])
        xlim([0 rr(11)])
        xlabel('Distanza dal centro (mm)') 
        ylabel('Temperatura (°C)')
        title('DISTRIBUZIONE DI TEMPERATURA NELLA BARRA')
        
    end

end