function [] = flowreg_plot(data, animate, title_string, xlable_string, xlim_value, videoname, ECCS_flag, DNB_flag)
% La funzione richiede i seguenti input:
%
%   - data: array contenente i dati che si vogliono plottare.
%           Se è un'animazione richiede una matrice, se non 
%           lo è serve un'array monodimensionale. La prima colonna 
%           della matrice è quella del timestep
%
%   - animate: booleano che indica se si vuole l'animazione o no
%

ECCS_colors = [[255 52 41]; [99 214 71]]./255;
DNB_colors = [[99 214 71]; [255 52 41]]./255;

flow_colors = [[145 145 145]; [145 145 145]; [145 145 145]; [60 207 104]; [60 207 104]; [60 207 104]; [60 207 104]; [255 52 41]; [255 52 41]; [255 52 41]; [255 52 41]; [252 198 3]; [252 198 3]]./255;
flow_texts = ["1", "2", "3", "BUBBLY", "SLUG", "ANULAR", "MIST", "INV-ANULAR", "INV-SLUG", "MIST", "MIST-POST-CHF", "HST", "VST"];

if animate
    time = data(:,1);
    data = data(:,2:end);
    % Initialize Video
    myVideo = VideoWriter(videoname); %open video file
    myVideo.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
    open(myVideo)
    for i=2:5:length(time)
        clf
        patch([55 100 100 55], [0 0 1 1], [1 1 1])
        patch([0 45 45 0], [0 0 1 1], [1 1 1])
        hold on
        for j=1:length(data(i,:))
          patch([0 100 100 0], [j-1 j-1 j j]./length(data(i,:)), flow_colors(data(i,j),:), 'LineStyle', 'none')
          text(15,(j-0.5)/length(data(i,:)),flow_texts(data(i)), 'FontSize', 10, 'FontWeight','bold')
          text(65,(j-0.5)/length(data(i,:)),flow_texts(data(i)), 'FontSize', 10, 'FontWeight','bold')
        end
        hold off
        alpha(.75)
        patch([45 55 55 45], [0 0 1 1], [173 173 173]./255)
        patch([47 53 53 47], [0 0 1 1], 'k')
        title(title_string)
        set(gca,'XTickLabel',[]);

        dim = [.365 0 .1 .1];
        timestep = num2str(time(i));
        str = strcat('TIME:',{'  '}, timestep(1:4), ' s');
        annotation('textbox',dim,'String',str, 'FitBoxToText','on', 'BackgroundColor','w', 'FontSize', 14);

        dim = [0.13 0 .1 .1];
        str = strcat(' ECCS');
        annotation('textbox',dim,'string',str,'FitBoxToText','on','BackgroundColor',ECCS_colors(ECCS_flag(i)+1,:), 'FontSize', 14);

        dim = [0.73 0 .1 .1];
        str = strcat(' DNB');
        annotation('textbox',dim,'string',str,'FitBoxToText','on','BackgroundColor',DNB_colors(DNB_flag(i)+1,:), 'FontSize', 14);

        drawnow 
        frame = getframe(gcf); %get frame
        writeVideo(myVideo, frame);
    end
    close(myVideo);
else
    data = floor(data);
    hold on
    for i=1:length(data)
        patch([0 100 100 0], [i-1 i-1 i i]./length(data), flow_colors(data(i),:), 'LineStyle', 'none')
        text(15,(i-0.5)/length(data),flow_texts(data(i)), 'FontSize', 7, 'FontWeight','bold')
        text(65,(i-0.5)/length(data),flow_texts(data(i)), 'FontSize', 7, 'FontWeight','bold')
    end
    hold off
    alpha(.75)
    patch([45 55 55 45], [0 0 1 1], [173 173 173]./255)
    patch([47 53 53 47], [0 0 1 1], 'k')
    title(title_string)
end
end

