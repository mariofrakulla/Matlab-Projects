function paint_GUI()

    S.fig = figure('Name', 'Paint', 'menubar', 'none', 'resize', 'off', 'position', [500, 300, 400, 400]); 
    S.axes = axes('parent', S.fig, 'units', 'normalized', 'position', [0, 0, 1, 1], 'Xtick', [], 'Ytick', []);
    S.col = [0 0 1];
    S.lst = {[0 0 1], [1 0 0], [0 1 0], [1 1 0], [1 0 1]}; 
    set(S.axes, 'xlim', [0 1] , 'ylim', [0 1]);


    S.ucm = uicontextmenu;

    S.Colors_av = {'Blue', 'Red', 'Green', 'Yellow', 'Purple'};
    S.color(1) = uimenu(S.ucm, 'label', 'Color');

    for itcol = 2:length(S.Colors_av)+1
        S.color(itcol) = uimenu(S.color(1), 'label', S.Colors_av{itcol-1}); 
    end

    S.thick = 7.5; 
    S.thickvals = {5, 7.5, 10, 12.5};
    S.arrayVals = {'5 px' ,'7.5 px', '10 px', '12.5 px'};
    S.thickness(1) = uimenu(S.ucm, 'label', 'Size');

    for itsize = 2:length(S.arrayVals)+1
          S.thickness(itsize) = uimenu(S.thickness(1), 'label', S.arrayVals{itsize-1}); 
    end

    set(S.thickness(2:5), 'Callback', @thickness_call); 
    set(S.color(2:6), 'Callback', @color_call);
    set(S.axes, 'buttondownfcn', @axesbuttondwn, 'uicontextmenu', S.ucm); 
    set(S.fig, 'windowbuttonupfcn', @button_released); 

    S.savefig = uimenu(S.fig, 'label', 'Save Figure');
    S.formatFig(1) = uimenu(S.savefig, 'label', 'png');
    S.formatFig(2) = uimenu(S.savefig, 'label', 'jpg');
    set(S.formatFig(1:2), 'Callback', @SaveFig); 
    hold on

    function color_call(varargin)
        S.col = S.lst{varargin{2}.Source.Position};
    end

    function axesbuttondwn(varargin)
        
        if  strcmp(get(S.fig, 'selectiontype'), 'normal')
            set(S.fig, 'windowbuttonmotionfcn', @buttonmotion_call); 
        end 
    end


    function thickness_call(varargin)  
     S.thick = S.thickvals{varargin{2}.Source.Position};
        
    end

    function buttonmotion_call(varargin)
        currentPoint = get(S.axes, 'currentpoint');
        plot(currentPoint(1,1), currentPoint(1,2), '.', 'buttondownfcn', @axesbuttondwn,'Color', S.col, 'MarkerSize',S.thick );
        
    end

    function button_released(varargin)
        set(S.fig, 'windowbuttonmotionfcn', '');
    end

    function SaveFig(varargin)
        suff = varargin{2}.Source.Text;
        nameFile = inputdlg('Enter a File Name:', 'Filename');
        figuren = getframe(S.fig);
        imwrite(figuren.cdata, horzcat(nameFile{1}, '.', suff));
    end
end