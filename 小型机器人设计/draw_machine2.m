function varargout = draw_machine2(varargin)
% DRAW_MACHINE2 MATLAB code for draw_machine2.fig
%      DRAW_MACHINE2, by itself, creates a new DRAW_MACHINE2 or raises the existing
%      singleton*.
%
%      H = DRAW_MACHINE2 returns the handle to a new DRAW_MACHINE2 or the handle to
%      the existing singleton*.
%
%      DRAW_MACHINE2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DRAW_MACHINE2.M with the given input arguments.
%
%      DRAW_MACHINE2('Property','Value',...) creates a new DRAW_MACHINE2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before draw_machine2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to draw_machine2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help draw_machine2

% Last Modified by GUIDE v2.5 07-Dec-2019 12:31:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @draw_machine2_OpeningFcn, ...
                   'gui_OutputFcn',  @draw_machine2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before draw_machine2 is made visible.
function draw_machine2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to draw_machine2 (see VARARGIN)

% Choose default command line output for draw_machine2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes draw_machine2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = draw_machine2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
clear all;
global a L1 L2;
L1=9;
L2=11;
a = arduino();

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%pen up
writePWMDutyCircle(a,11,0.09);
writePWMDutyCycle(a,9,0.05);%%Big arm
writePWMDutyCycle(a,10,0.09);%% Small arm


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=6:0.5:10;
y=0;
%pen down
writePWMDutyCircle(a,11,0.06)% <90

for(i=1:10)
  sita2=acos((x(i)*x(1)+y*y-L1*L1-L2*L2)/2/L1/L2);   
  %sita2=sita2-pi;
  sita1=atan2(y,x)-atan2(L2*sin(pi-sita2),L1+L2*cos(pi-sita2));
writePWMDutyCircle(a,9,(sita1/pi*10+2.5)/100);
writePWMDutyCircle(a,10,(sita2/pi*10+2.5)/100);
end
%pen up
writePWMDutyCircle(a,11,0.09);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%lin1
x=10:-0.5:6;
y=-2;
%pen down
writePWMDutyCircle(a,11,0.06)% <90
for i=1:10
  sita2=acos((x(i)*x(1)+y*y-L1*L1-L2*L2)/2/L1/L2);   
  %sita2=sita2-pi;
  sita1=atan2(y,x)-atan2(L2*sin(pi-sita2),L1+L2*cos(pi-sita2));
writePWMDutyCircle(a,9,(sita1/pi*10+2.5)/100);
writePWMDutyCircle(a,10,(sita2/pi*10+2.5)/100);
end
%pen up
writePWMDutyCircle(a,11,0.09);
pause(2);
%%lin2
x=6;
y=-2:0.5:2;
%pen down
writePWMDutyCircle(a,11,0.06)% <90
for i=1:10
  sita2=acos((x*x+y(i)*y(i)-L1*L1-L2*L2)/2/L1/L2);   
  %sita2=sita2-pi;
  sita1=atan2(y,x)-atan2(L2*sin(pi-sita2),L1+L2*cos(pi-sita2));
writePWMDutyCircle(a,9,(sita1/pi*10+2.5)/100);
writePWMDutyCircle(a,10,(sita2/pi*10+2.5)/100);
end
%pen up
writePWMDutyCircle(a,11,0.09);
pause(2);
%lin3
%pen down
writePWMDutyCircle(a,11,0.06)% <90
x=6:0.5:10;
y=2:-0.5:-2;

for i=1:10
  sita2=acos((x(i)*x(i)+y(i)*y(i)-L1*L1-L2*L2)/2/L1/L2);   
  %sita2=sita2-pi;
  sita1=atan2(y,x)-atan2(L2*sin(pi-sita2),L1+L2*cos(pi-sita2));
writePWMDutyCircle(a,9,(sita1/pi*10+2.5)/100);
writePWMDutyCircle(a,10,(sita2/pi*10+2.5)/100);
end
%pen up
writePWMDutyCircle(a,11,0.09);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function  MouseDraw(action)
% MouseDraw 本例展示如何以Handle Graphics来设定滑鼠事件
% (MouseDraw Events)的反应指令(Callbacks)

% 本程序在鼠标移动非常快时，不会造成画“断线”
% global不能传矩阵
global InitialX InitialY FigHandle
global x y sita11 sita22 x_store y_store

imSize = 200;
L1=9;
L2=11;

if nargin == 0, action = 'start';   end

switch(action)
    %%开启图形视窗
    case 'start'
        FigHandle = figure('WindowButtonDownFcn','MouseDraw down');
        axis([1 imSize 1 imSize]);    % 设定图轴范围
%         axis off;
        grid on;
        box on;     % 将图轴加上图框
        title('手写体输入窗');
% %         fprintf('start');
        %%设定滑鼠按钮被按下时的反应指令为「MouseDraw down」
        % set(gcf, 'WindowButtonDownFcn', 'MouseDraw down'); 
dlmwrite('IXT.txt', -10, 'delimiter', '\t', 'precision', 6);
        dlmwrite('IYT.txt', -10, 'delimiter', '\t', 'precision', 6);
        %%滑鼠按钮被按下时的反应指令
    case 'down'
        if strcmp(get(FigHandle, 'SelectionType'), 'normal')    %如果是左键
            set(FigHandle,'pointer','hand');     
            CurPiont = get(gca, 'CurrentPoint');
            InitialX = CurPiont(1,1);
            InitialY = CurPiont(1,2);
            dlmwrite('IXT.txt', InitialX, '-append', 'delimiter', '\t', 'precision', 6);
            dlmwrite('IYT.txt', InitialY, '-append', 'delimiter', '\t', 'precision', 6);
            % 列印「MouseDraw down!」讯息
% %             fprintf('MouseDraw down!\n');
            % 设定滑鼠移动时的反应指令为「MouseDraw move」
            set(gcf, 'WindowButtonMotionFcn', 'MouseDraw move');
            set(gcf, 'WindowButtonUpFcn', 'MouseDraw up');
        elseif strcmp(get(FigHandle, 'SelectionType'), 'alt')   % 如果是右键
            
            %pen down
            writePWMDutyCircle(a,11,0.06)% <90
            for i=1:length(x_store)
                sita22=[sita22 acos((x(i)*x(i)+y(i)*y(i)-L1*L1-L2*L2)/2/L1/L2)-pi];
                sita11=atan2(y(i),x(i))-atan2(L2*sin(-sita22),L1+L2*cos(-sita22));
                writePWMDutyCircle(a,9,(sita11/pi*10+2.5)/100);
                writePWMDutyCircle(a,10,(sita22/pi*10+2.5)/100);
                pause(0.1)
                
            end
            writePWMDutyCircle(a,11,0.09);
            


        end
    %%滑鼠移动时的反应指令
    case 'move'
        CurPiont = get(gca, 'CurrentPoint');
        X = CurPiont(1,1);
        Y = CurPiont(1,2);
        % 当鼠标移动较快时，不会出现离散点。
        % 利用y=kx+b直线方程实现。
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
        x_store=[x_store x];
        y_store=[y_store y];
        

        % 列印「MouseDraw is moving!」及滑鼠现在位置
        % fprintf('MouseDraw is moving! Current location = (%g, %g)\n', ...
          % CurPiont(1,1), CurPiont(1,2));
% %         fprintf('MouseDraw move!\n');
        % 设定滑鼠按钮被释放时的反应指令为「MouseDraw up」
        % set(gcf, 'WindowButtonUpFcn', 'MouseDraw up');
    %%滑鼠按钮被释放时的反应指令
    case 'up'
        % 清除滑鼠移动时的反应指令
        set(gcf, 'WindowButtonMotionFcn', '');
        % 清除滑鼠按钮被释放时的反应指令
        set(gcf, 'WindowButtonUpFcn', '');
        


        % 列印「MouseDraw up!」
% %         fprintf('MouseDraw up!\n');
end
        


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gdata(imread('img1.jpj'));
[hang, lie]=find(gdata>250);
if(hang(floor(length(hang)/2))/3968<0.5)
    x_loc=1
else
    x_loc=0
end
if(lie(floor(length(lie)/2))/2240<0.5)
    y_loc=2
else
    y_loc=4
end
if2
