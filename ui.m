function varargout = ui(varargin)
% UI MATLAB code for ui.fig
%      UI, by itself, creates a new UI or raises the existing
%      singleton*.
%
%      H = UI returns the handle to a new UI or the handle to
%      the existing singleton*.
%
%      UI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UI.M with the given input arguments.
%
%      UI('Property','Value',...) creates a new UI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ui

% Last Modified by GUIDE v2.5 23-Dec-2018 22:47:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ui_OpeningFcn, ...
                   'gui_OutputFcn',  @ui_OutputFcn, ...
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


% --- Executes just before ui is made visible.
function ui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ui (see VARARGIN)

% Create globel param
global param
param = params();

% Choose default command line output for ui
handles.output = hObject;
% ���ò���
handles.W0 = param.W0;
handles.J0 = param.J0;
handles.A1 = param.A1;
handles.B1 = param.B1;
handles.T = param.T;
handles.B2 = param.B2;
handles.J = param.J;
handles.Period = 20;
handles.H = param.H;
% ������Ҫ����ͼ��'WK','OTHER'
handles.PLOT = '���ر仯ͼ';
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes ui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% ��ʼ����
function edit1_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
% ����ı���ȷ��
output = CheckInput(hObject, handles.text23, 150, 50, 'red', [0.3, 0.75, 0.93], '��ʼ����');
% ��������ʽ��ȷ����ô��handles����ñ���
if output == true
    handles.W0 = str2double(get(hObject, 'string'));
else
    handles.W0 = false;
end
guidata(hObject, handles);


% ��ʼ����
function edit1_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
global param  % Get global param
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'string', num2str(param.W0));


% ��0����������
function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
output = CheckInput(hObject, handles.text23, 30000, 10000, 'red', [0.3, 0.75, 0.93], '��0����������');
% ��������ʽ��ȷ����ô��handles����ñ���
if output == true
    handles.J0 = str2double(get(hObject, 'string'));
else
    handles.J0 = false;
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
% Get global param
global param

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'string', num2str(param.J0))


% ����ת��ϵ��������ת��Ϊ����
function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
global param
% ���ڸñ���Ϊ�����������޷��ı�
set(hObject, 'string', num2str(param.A1, 4))
set(handles.text23, 'string', '����ת��ϵ��Ϊ�������޷��ı�')

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
% Get global param
global param

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'string', num2str(param.A1, 4))


% ������л����ϵ��
function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
output = CheckInput(hObject, handles.text23, 320, 200, 'red', [0.3, 0.75, 0.93], '������л����ϵ��');
% ��������ʽ��ȷ����ô��handles����ñ���
if output == true
    handles.B1 = str2double(get(hObject, 'string'));
else
    handles.B1 = false;
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
global param
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'string', num2str(param.B1));


% ÿ���˶�ʱ��
function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
output = CheckInput(hObject, handles.text23, 50, 1, 'red', [0.3, 0.75, 0.93], 'ÿ���˶�ʱ��');
% ��������ʽ��ȷ����ô��handles����ñ���
if output == true
    handles.T = str2double(get(hObject, 'string'));
else
    handles.T = false;
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
global param
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'string', num2str(param.T))


% �˶����Ĵ�лϵ��
function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
global param
set(hObject, 'string', num2str(param.B2));
set(handles.text23, 'string', '�˶����Ĵ�лϵ��Ϊ�������޷��ı�');


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
global param
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'string', num2str(param.B2))


% ��������������
function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
output = CheckInput(hObject, handles.text23, 1000, 1, 'red', [0.3, 0.75, 0.93], '��������������');
% ��������ʽ��ȷ����ô��handles����ñ���
if output == true
    handles.J = str2double(get(hObject, 'string'));
else
    handles.J = false;
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
global param
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'string', num2str(param.J))


% �ָ�Ĭ��
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ��Ϣ��������
set(handles.text23, 'string', '');
% �ð�ť���ڰ���֮��Ϳ��Իָ�Ĭ�ϲ�����������г�ʼ����
global param
set(handles.edit1, 'string', num2str(param.W0));
set(handles.edit1, 'backgroundcolor', [0.3, 0.75, 0.93])
set(handles.edit2, 'string', num2str(param.J0));
set(handles.edit2, 'backgroundcolor', [0.3, 0.75, 0.93])
set(handles.edit3, 'string', num2str(param.A1));
set(handles.edit3, 'backgroundcolor', [0.3, 0.75, 0.93])
set(handles.edit4, 'string', num2str(param.B1));
set(handles.edit4, 'backgroundcolor', [0.3, 0.75, 0.93])
set(handles.edit5, 'string', num2str(param.T));
set(handles.edit5, 'backgroundcolor', [0.3, 0.75, 0.93])
set(handles.edit6, 'string', num2str(param.B2));
set(handles.edit6, 'backgroundcolor', [0.3, 0.75, 0.93])
set(handles.edit7, 'string', num2str(param.J));
set(handles.edit7, 'backgroundcolor', [0.3, 0.75, 0.93])
% ����Ϣ�����ÿ�
set(handles.text23, 'string', '')
% �ָ�Ĭ�ϲ���
handles.W0 = param.W0;
handles.J0 = param.J0;
handles.A1 = param.A1;
handles.B1 = param.B1;
handles.T = param.T;
handles.B2 = param.B2;
handles.J = param.J;
% Update handles structure
guidata(hObject, handles);



% תΪkJ����
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text23, 'string', '��ʱ������');

% ����ʽ�˵�
% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
% �����Ϣ����
set(handles.text23, 'string', '')
contents = cellstr(get(hObject, 'string'));
contents = contents{get(hObject, 'value')};
handles.PLOT = contents;
if strcmpi(contents, '���ر仯ͼ')
    set(handles.edit8, 'visible', 'off');
    set(handles.text26, 'visible', 'off');
    set(handles.text27, 'visible', 'off');
elseif strcmpi(contents, 'BMIָ��')
    set(handles.edit8, 'visible', 'on');
    set(handles.text26, 'visible', 'on');
    set(handles.text27, 'visible', 'on');
end
guidata(hObject, handles);

% ����ʽ�˵�
% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% ����
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% param
global param
% ��֤��ȷ��
if CanSimulation(handles)
    set(handles.text20, 'string', handles.PLOT);
    if strcmpi(handles.PLOT, '���ر仯ͼ')
        % ��ͼ
        axes(handles.axes1);
        cla;
        % �����������
        [y, dw, dh] = Simulate(handles.W0, handles.T, handles.A1, param.A2, handles.B1,...
                       handles.B2, handles.J, handles.J0, handles.Period);
        handles.WK = y;  % �������ر仯
        x = 0:(length(y)-1);
        % ���������������
        plot(x, y, 'b');
        grid on;
        xlabel('�ܴ�'),ylabel('����/kg');
        set(handles.axes1, 'XLim', [0 length(y)], 'YLim', [0 200]);
        % ���������仯ͼ
        % �������ر仯ͼ
        axes(handles.axes5);
        cla;
        x = 1:(length(dw));
        % ��������
        plot([0 x], linspace(-1.5, -1.5, length(x)+1), 'r');
        hold on;
        plot(x, dw, 'g');
        grid on;
        xlabel('�ܴ�'),ylabel('����/kg');
        
        axes(handles.axes6);
        cla;
        x = 1:(length(dh));
        plot(x, dh, 'y');
        grid on;
        xlabel('�ܴ�'),ylabel('����/kcal');
    elseif strcmpi(handles.PLOT, 'BMIָ��')
        % ������
        if handles.H == false
            set(handles.text23, 'string', '��߲��������⣬���飡');
        else
            % ��ͼ
            axes(handles.axes1);
            cla;
            [y, dw, dh] = Simulate(handles.W0, handles.T, handles.A1, param.A2, handles.B1,...
                       handles.B2, handles.J, handles.J0, handles.Period);
            x = 0:(length(y)-1);
            handles.WK = y;
            % ����BMIָ��
            y = y / (handles.H * handles.H);
            % ������������
            backx = [0:0.01:(length(y)-1) (length(y)-1):-0.01:0];
            backy = [linspace(18.5, 18.5, length(backx)/2) zeros(1, length(backx)/2)];
            patch(backx, backy, [1 1 0]);
            
            hold on
            backx = [0:0.01:(length(y)-1) (length(y)-1):-0.01:0];
            backy = [linspace(24, 24, length(backx)/2) linspace(18.5, 18.5, length(backx)/2)];
            patch(backx, backy, [0 1 0]);
            
            hold on
            backx = [0:0.01:(length(y)-1) (length(y)-1):-0.01:0];
            backy = [linspace(29, 29, length(backx)/2) linspace(24, 24, length(backx)/2)];
            patch(backx, backy, [1 0 1]);
            
            hold on
            backx = [0:0.01:(length(y)-1) (length(y)-1):-0.01:0];
            backy = [linspace(50, 50, length(backx)/2) linspace(29, 29, length(backx)/2)];
            patch(backx, backy, [1 0 0]);
            
            hold on
            plot(x, y, 'b');
            grid on;
            xlabel('�ܴ�'), ylabel('BMI');
            set(handles.axes1, 'XLim', [0 length(y)], 'YLim', [0, 50]);
            % ���������仯ͼ
            % �������ر仯ͼ
            axes(handles.axes5);
            cla;
            x = 1:(length(dw));
            % ��������
            plot([0 x], linspace(-1.5, -1.5, length(x)+1), 'r');
            hold on;
            plot(x, dw, 'g');
            grid on;
            xlabel('�ܴ�'),ylabel('����/kg');

            axes(handles.axes6);
            cla;
            x = 1:(length(dh));
            plot(x, dh, 'y');
            grid on;
            xlabel('�ܴ�'),ylabel('����/kcal');
        end
    end
else
    set(handles.text23, 'string', '�޷����棬��ǰ��������������')
end
guidata(hObject, handles);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
value = get(hObject, 'value');
set(handles.text23, 'string', sprintf('����ʱ�䳤��Ϊ%d��', round(value)));
handles.Period = round(value);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
set(hObject, 'value', 20);

function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double
output = CheckInput(hObject, handles.text23, 2.20, 1.40, 'red', [0.3, 0.75, 0.93], '���');
% ��������ʽ��ȷ����ô��handles����ñ���
if output == true
    handles.H = str2double(get(hObject, 'string'));
else
    handles.H = false;
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
global param

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.H = param.H;
set(hObject, 'string', num2str(param.H));
guidata(hObject, handles);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles, 'WK') && (length(handles.WK) == handles.Period + 1)
    axes(handles.axes8);
    t = get(handles.slider2, 'value');
    t = round(t * (handles.Period-1) / 100)+1;
    BMI = handles.WK(t) / (handles.H * handles.H);
    set(handles.text31, 'string', sprintf('%skg',num2str(handles.WK(t))));
    set(handles.text33, 'string', sprintf('%sm',num2str(handles.H)));
    set(handles.text35, 'string', sprintf('%s',num2str(BMI)));
    set(handles.text37, 'string', sprintf('%s',num2str(t)));
    if BMI < 18.5
        set(handles.text23, 'string', '��ǰ�������ع��ᣬ�벻Ҫ��ʳӴ��');
        PaintPerson(handles.axes8, t, handles.WK, 'y');
    elseif (BMI >= 18.5) && (BMI <= 24)
        set(handles.text23, 'string', '��ϲ����ǰ����BMI������������ʣ�');
        PaintPerson(handles.axes8, t, handles.WK, 'g');
    elseif (BMI > 24) && (BMI < 29)
        set(handles.text23, 'string', '����������΢ƫ�أ������ʵ���ǿ�˶���');
        PaintPerson(handles.axes8, t, handles.WK, 'm');
    else
        set(handles.text23, 'string', '�ܱ�Ǹ������������ƫ�֣��������˶���');
        PaintPerson(handles.axes8, t, handles.WK, 'r');
    end
else
    set(handles.text23, 'string', '���Ƚ��з��棬Ȼ���ٽ���������棡');
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);