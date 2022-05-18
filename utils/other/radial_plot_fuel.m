function [] = radial_plot_fuel(tt, animate, reactor_type, videoname)
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
        h = animatedline('LineWidth', 1.5, 'Color', 'r');
        j = animatedline('LineWidth', 1.5, 'Color', 'r', 'LineStyle','--');
        
        ylim([0 3000])
        xlim([0 rr(11)])
        xlabel('Distance from center [mm]') 
        ylabel('Temperature [°C]')
        title('Temperature Distribution in Fuel Rod')

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
            annotation('textbox',dim,'String',str, 'FitBoxToText','on', 'BackgroundColor','w');
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
        plot(rr(1:10),tt(:,1:10), 'LineWidth', 1.5, 'Color', 'r')
        plot([rr(10) rr(11)], [tt(11) tt(11)], 'LineWidth', 1.5, 'LineStyle','--', 'Color', 'r')
        hold off
        ylim([0 3000])
        xlim([0 rr(11)])
        xlabel('Distance from center [mm]') 
        ylabel('Temperature [°C]')
        title('Temperature Distribution in Fuel Rod')
    end

end