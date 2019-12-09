function  MouseDraw(action)
global InitialX InitialY FigHandle
global x y sita1 sita2 x_cor y_cor
clear all
b=arduino('COM20');
s1=servo(b,'D9');
s2=servo(b,'D10')

imSize = 200;
L1=9;
L2=11;

if nargin == 0, action = 'start';   end

switch(action)

    case 'start'
        FigHandle = figure('WindowButtonDownFcn','MouseDraw down');
        axis([1 imSize 1 imSize]);   
%         axis off;
        grid on;
        box on;     
        title('手写体输入窗');

dlmwrite('IXT.txt', -10, 'delimiter', '\t', 'precision', 6);
        dlmwrite('IYT.txt', -10, 'delimiter', '\t', 'precision', 6);

    case 'down'
        if strcmp(get(FigHandle, 'SelectionType'), 'normal') 
            set(FigHandle,'pointer','hand');     
            CurPiont = get(gca, 'CurrentPoint');
            InitialX = CurPiont(1,1);
            InitialY = CurPiont(1,2);
            dlmwrite('IXT.txt', InitialX, '-append', 'delimiter', '\t', 'precision', 6);
            dlmwrite('IYT.txt', InitialY, '-append', 'delimiter', '\t', 'precision', 6);
  
            set(gcf, 'WindowButtonMotionFcn', 'MouseDraw move');
            set(gcf, 'WindowButtonUpFcn', 'MouseDraw up');
        elseif strcmp(get(FigHandle, 'SelectionType'), 'alt')   
            set(FigHandle, 'Pointer', 'arrow');
            set( FigHandle, 'WindowButtonMotionFcn', '')
            set(FigHandle, 'WindowButtonUpFcn', '')
            fprintf('MouseDraw right button down!\n');
            ImageX = importdata('IXT.txt');
            ImageY = importdata('IYT.txt');
            InputImage = ones(imSize);
            roundX = round(ImageX);
            roundY = round(ImageY);
            for k = 1:size(ImageX,1)
                if 0<roundX(k) && roundX(k)<imSize && 0<roundY(k) && roundY(k)<imSize
                    InputImage(roundX(k)-1:roundX(k)+2, roundY(k)-1:roundY(k)+2) = 0;
                end
            end
            InputImage = imrotate(InputImage,90);       
            figure(2);
            imshow(InputImage);

        end

    case 'move'
        CurPiont = get(gca, 'CurrentPoint');
        X = CurPiont(1,1);
        Y = CurPiont(1,2);
       
        x_gap = 0.1;    % 定义x方向增量
        y_gap = 0.1;    % 定义y方向增量
        if X > InitialX
            step_x = x_gap;
        else
            step_x = -x_gap;
        end
        if Y > InitialY
            step_y = y_gap;
        else
            step_y = -y_gap;
        end 
        % 定义x,y的变化范围和步长
        if abs(X-InitialX) < 0.01        % 线平行于y轴，即斜率不存在时
            iy = InitialY:step_y:Y;
            ix = X.*ones(1,size(iy,2));
        else
            ix = InitialX:step_x:X ;    % 定义x的变化范围和步长
            % 当斜率存在，即k = (Y-InitialY)/(X-InitialX) ~= 0
            iy = (Y-InitialY)/(X-InitialX).*(ix-InitialX)+InitialY;  
        end
        ImageX = [ix, X];
        ImageY = cat(2, iy, Y);
        line(ImageX,ImageY, 'marker', '.', 'markerSize',28, ...
            'LineStyle', '-', 'LineWidth', 4, 'Color', 'Red');
        dlmwrite('IXT.txt', ImageX, '-append', 'delimiter', '\t', 'precision', 6);
        dlmwrite('IYT.txt', ImageY, '-append', 'delimiter', '\t', 'precision', 6);
        InitialX = X;       %记住当前点坐标
        InitialY = Y;       %记住当前点坐标
        x=4+8*InitialX/200;
        y=-10+20*InitialY/200;
       % h = animatedline;
       % addpoints(h,x,y);
        %drawnow
        (x*x+y*y-L1*L1-L2*L2)/2/L1/L2;
        sita2=acos((x*x+y*y-L1*L1-L2*L2)/2/L1/L2);
        %L1+L2*cos(sita2+pi)
        sita1=atan2(y,x)+acos((x*x+y*y+L1*L1-L2*L2)/(2*L1*sqrt(x*x+y*y)));  
         writePosition(s2,sita2/pi);
         writePositon(s1,sita1/pi);
         %x_cor=[x_cor L1*cos(sita1)+L2*(cos(sita1)*cos(sita2+pi))-L2*sin(sita1)*sin(sita2+pi)]
         %y_cor=[y_cor L1*sin(sita1)+L2*(sin(sita1)*cos(sita2+pi)+cos(sita1)*sin(sita2+pi))]
         


    case 'up'
        % 清除滑鼠移动时的反应指令
        set(gcf, 'WindowButtonMotionFcn', '');
        % 清除滑鼠按钮被释放时的反应指令
        set(gcf, 'WindowButtonUpFcn', '');
end