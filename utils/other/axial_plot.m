function [] = axial_plot(data, animate, title_string, xlable_string, xlim_value, videoname)
% La funzione richiede i seguenti input:
%
%   - data: array contenente i dati che si vogliono plottare.
%           Se è un'animazione richiede una matrice, se non 
%           lo è serve un'array monodimensionale
%
%   - animate: booleano che indica se si vuole l'animazione o no

if animate
    time = data(:,1);
    data = data(:,2:end);
    h = animatedline('LineWidth', 1.5, 'Color', 'r');
    grid on
    grid minor
    ylim([1/length(data) 1])
    xlim([0 xlim_value])
    xlabel(xlable_string)
    title(title_string)

    % Initialize Video
    myVideo = VideoWriter(videoname); %open video file
    myVideo.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
    open(myVideo)
    for i=2:10:length(time)
        clearpoints(h);
        addpoints(h, data(i,:), (1:length(data(i,:)))./length(data(i,:)));
        drawnow nocallbacks

        dim = [.5 .1 .1 .1];
        timestep = sprintf("%.1f", time(i));
        str = strcat('TIME:',{'  '}, timestep, ' s');
        annotation('textbox',dim,'String',str, 'FitBoxToText','on', 'BackgroundColor','w');
        
        %pause(0.1)
        frame = getframe(gcf); %get frame
        writeVideo(myVideo, frame);
    end
    close(myVideo);
else
    plot(data,(1:length(data))./length(data), 'LineWidth', 1.5, 'Color', 'r')
    ylim([1/length(data) 1])
    xlim([0 xlim_value])
    xlabel(xlable_string)
    title(title_string)
    grid on
    grid minor
end
end

