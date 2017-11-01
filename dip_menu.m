function varargout = dip_menu(varargin)
% DIP_MENU MATLAB code for dip_menu.fig
%      DIP_MENU, by itself, creates a new DIP_MENU or raises the existing
%      singleton*.
%
%      H = DIP_MENU returns the handle to a new DIP_MENU or the handle to
%      the existing singleton*.
%
%      DIP_MENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIP_MENU.M with the given input arguments.
%
%      DIP_MENU('Property','Value',...) creates a new DIP_MENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dip_menu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dip_menu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dip_menu

% Last Modified by GUIDE v2.5 01-Nov-2017 06:07:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dip_menu_OpeningFcn, ...
                   'gui_OutputFcn',  @dip_menu_OutputFcn, ...
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


% --- Executes just before dip_menu is made visible.
function dip_menu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dip_menu (see VARARGIN)

% Choose default command line output for dip_menu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dip_menu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dip_menu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
    global im;
    List = get(hObject, 'String');
    Val = get(hObject, 'Value');
    path = pwd;
    path = strcat(path, '\images\');
    name = List(Val);
    name = char(name);
    name = deblank(name);
    filename = strcat(path, name);
    im = imread(filename);

    axes(handles.axes1);
    imshow(im);


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
global im1;
f = fspecial('laplacian');
im1 = imfilter(im, f);
axes(handles.axes2);
imshow(im1);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
global im1;
global im2;
im2 = im - im1;
axes(handles.axes3);
imshow(im2);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
global im3;
im3 = edge(im, 'Sobel');
im3 = im2uint8(im3);
im3 = im - im3;
axes(handles.axes4);
imshow(im3);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im3;
global im4;
f = fspecial('average', 5);
im4 = imfilter(im3, f);
axes(handles.axes5);
imshow(im4);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im1;
global im4;
global im5;
im5 = imadd(im1, im4);
axes(handles.axes6);
imshow(im5);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
global im5;
global im6;
im6 = im + im5;
axes(handles.axes7);
imshow(im6);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im6;
global im7;
im7 = double(im6)/255;
im7 = im7.^0.65;
axes(handles.axes8);
imshow(im7);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global slider_value1;
slider_value1 = get(handles.slider1, 'value');
% slider_value1=floor(slider_value1);
data1=num2str(slider_value1);
set(handles.text10,'String',data1);

global im6;
global im7;
im7 = double(im6)/255;
im7 = im7.^slider_value1;
axes(handles.axes8);
imshow(im7);


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on key press with focus on slider1 and none of its controls.
function slider1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
