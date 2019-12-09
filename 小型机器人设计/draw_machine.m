function varargout = draw_machine(varargin)
% DRAW_MACHINE MATLAB code for draw_machine.fig
%      DRAW_MACHINE, by itself, creates a new DRAW_MACHINE or raises the existing
%      singleton*.
%
%      H = DRAW_MACHINE returns the handle to a new DRAW_MACHINE or the handle to
%      the existing singleton*.
%
%      DRAW_MACHINE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DRAW_MACHINE.M with the given input arguments.
%
%      DRAW_MACHINE('Property','Value',...) creates a new DRAW_MACHINE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before draw_machine_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to draw_machine_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help draw_machine

% Last Modified by GUIDE v2.5 05-Dec-2019 23:19:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @draw_machine_OpeningFcn, ...
                   'gui_OutputFcn',  @draw_machine_OutputFcn, ...
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


% --- Executes just before draw_machine is made visible.
function draw_machine_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to draw_machine (see VARARGIN)

% Choose default command line output for draw_machine
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes draw_machine wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = draw_machine_OutputFcn(hObject, eventdata, handles) 
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
global a
x=6:10;
y=0;
for(i=6:10)
  sita2=acos((x*x+y*y-L1*L1-L2*L2)/2/L1/L2);   
  sita2=sita2-pi;
  sita1=2*atan(y/x)-atan2(y,x)-atan2(L2*sin(sita2+pi),L1+L2*cos(sita2+pi));
writePWMDutyCircle(a,9,)
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
writePWMDutyCycle(a,9,0.05);%%Big arm
writePWMDutyCycle(a,10,0.09);%% Small arm


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton5.
function pushbutton5_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
