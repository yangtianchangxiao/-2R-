function  MouseDraw(action)
% MouseDraw ����չʾ�����Handle Graphics���趨�����¼�
% (MouseDraw Events)�ķ�Ӧָ��(Callbacks)

% ������������ƶ��ǳ���ʱ��������ɻ������ߡ�
% global���ܴ�����
global InitialX InitialY FigHandle
global x y sita1 sita2 x_cor y_cor

imSize = 200;
L1=9;
L2=11;

if nargin == 0, action = 'start';   end

switch(action)
    %%����ͼ���Ӵ�
    case 'start'
        FigHandle = figure('WindowButtonDownFcn','MouseDraw down');
        axis([1 imSize 1 imSize]);    % �趨ͼ�᷶Χ
%         axis off;
        grid on;
        box on;     % ��ͼ�����ͼ��
        title('��д�����봰');
% %         fprintf('start');
        %%�趨����ť������ʱ�ķ�Ӧָ��Ϊ��MouseDraw down��
        % set(gcf, 'WindowButtonDownFcn', 'MouseDraw down'); 
dlmwrite('IXT.txt', -10, 'delimiter', '\t', 'precision', 6);
        dlmwrite('IYT.txt', -10, 'delimiter', '\t', 'precision', 6);
        %%����ť������ʱ�ķ�Ӧָ��
    case 'down'
        if strcmp(get(FigHandle, 'SelectionType'), 'normal')    %��������
            set(FigHandle,'pointer','hand');     
            CurPiont = get(gca, 'CurrentPoint');
            InitialX = CurPiont(1,1);
            InitialY = CurPiont(1,2);
            dlmwrite('IXT.txt', InitialX, '-append', 'delimiter', '\t', 'precision', 6);
            dlmwrite('IYT.txt', InitialY, '-append', 'delimiter', '\t', 'precision', 6);
            % ��ӡ��MouseDraw down!��ѶϢ
% %             fprintf('MouseDraw down!\n');
            % �趨�����ƶ�ʱ�ķ�Ӧָ��Ϊ��MouseDraw move��
            set(gcf, 'WindowButtonMotionFcn', 'MouseDraw move');
            set(gcf, 'WindowButtonUpFcn', 'MouseDraw up');
        elseif strcmp(get(FigHandle, 'SelectionType'), 'alt')   % ������Ҽ�
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
            InputImage = imrotate(InputImage,90);       % ͼ����ת90
            figure(2);
            imshow(InputImage);
            x_cor;
            y_cor;

        end
    %%�����ƶ�ʱ�ķ�Ӧָ��
    case 'move'
        CurPiont = get(gca, 'CurrentPoint');
        X = CurPiont(1,1);
        Y = CurPiont(1,2);
        % ������ƶ��Ͽ�ʱ�����������ɢ�㡣
        % ����y=kx+bֱ�߷���ʵ�֡�
        x_gap = 0.1;    % ����x��������
        y_gap = 0.1;    % ����y��������
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
        % ����x,y�ı仯��Χ�Ͳ���
        if abs(X-InitialX) < 0.01        % ��ƽ����y�ᣬ��б�ʲ�����ʱ
            iy = InitialY:step_y:Y;
            ix = X.*ones(1,size(iy,2));
        else
            ix = InitialX:step_x:X ;    % ����x�ı仯��Χ�Ͳ���
            % ��б�ʴ��ڣ���k = (Y-InitialY)/(X-InitialX) ~= 0
            iy = (Y-InitialY)/(X-InitialX).*(ix-InitialX)+InitialY;  
        end
        ImageX = [ix, X];
        ImageY = cat(2, iy, Y);
        line(ImageX,ImageY, 'marker', '.', 'markerSize',28, ...
            'LineStyle', '-', 'LineWidth', 4, 'Color', 'Red');
        dlmwrite('IXT.txt', ImageX, '-append', 'delimiter', '\t', 'precision', 6);
        dlmwrite('IYT.txt', ImageY, '-append', 'delimiter', '\t', 'precision', 6);
        InitialX = X;       %��ס��ǰ������
        InitialY = Y;       %��ס��ǰ������
        x=4+8*InitialX/200;
        y=-10+20*InitialY/200;
       % h = animatedline;
       % addpoints(h,x,y);
        %drawnow
        (x*x+y*y-L1*L1-L2*L2)/2/L1/L2;
        sita2=acos((x*x+y*y-L1*L1-L2*L2)/2/L1/L2);
        sita2=sita2-pi;
        sita1=atan2(y,x)-atan2(L2*sin(-sita2),L1+L2*cos(-sita2));
         %%x_cor=[x_cor L1*cos(sita1)+L2*(cos(sita1)*cos(sita2+pi))-L2*sin(sita1)*sin(sita2+pi)];
         %%y_cor=[y_cor L1*sin(sita1)+L2*(sin(sita1)*cos(sita2+pi)+cos(sita1)*sin(sita2+pi))];
        % ��ӡ��MouseDraw is moving!������������λ��
        % fprintf('MouseDraw is moving! Current location = (%g, %g)\n', ...
          % CurPiont(1,1), CurPiont(1,2));
% %         fprintf('MouseDraw move!\n');
        % �趨����ť���ͷ�ʱ�ķ�Ӧָ��Ϊ��MouseDraw up��
        % set(gcf, 'WindowButtonUpFcn', 'MouseDraw up');
    %%����ť���ͷ�ʱ�ķ�Ӧָ��
    case 'up'
        % ��������ƶ�ʱ�ķ�Ӧָ��
        set(gcf, 'WindowButtonMotionFcn', '');
        % �������ť���ͷ�ʱ�ķ�Ӧָ��
        set(gcf, 'WindowButtonUpFcn', '');
        


        % ��ӡ��MouseDraw up!��
% %         fprintf('MouseDraw up!\n');
end