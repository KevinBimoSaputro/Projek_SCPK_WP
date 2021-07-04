function varargout = masuk(varargin)
% MASUK MATLAB code for masuk.fig
%      MASUK, by itself, creates a new MASUK or raises the existing
%      singleton*.
%
%      H = MASUK returns the handle to a new MASUK or the handle to
%      the existing singleton*.
%
%      MASUK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MASUK.M with the given input arguments.
%
%      MASUK('Property','Value',...) creates a new MASUK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before masuk_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to masuk_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help masuk

% Last Modified by GUIDE v2.5 25-Jun-2021 11:57:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @masuk_OpeningFcn, ...
                   'gui_OutputFcn',  @masuk_OutputFcn, ...
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


% --- Executes just before masuk is made visible.
function masuk_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to masuk (see VARARGIN)

% Choose default command line output for masuk
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes masuk wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = masuk_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


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


% --- Executes on button press in tampil.
function tampil_Callback(hObject, eventdata, handles)
% hObject    handle to tampil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = [100, 7, 1000, 10000000, 40; 
     300, 4, 300, 11000000, 50;
     400, 5, 400, 8000000, 70; 
     560, 6, 600, 7000000, 60;
     1000, 8, 550, 8000000, 80;
     650, 10, 660, 10000000, 40;
     250, 9, 700, 9000000, 85;
     95, 7, 800, 7700000, 30;
     700, 8, 900, 9900000, 70;
     220, 6, 880, 6000000, 100;];
 set(handles.uitable1,'data',x);


% --- Executes on button press in execute.
function execute_Callback(hObject, eventdata, handles)
% hObject    handle to execute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i1=get(handles.C1,'string');
i2=get(handles.C2,'string');
i3=get(handles.C3,'string');
i4=get(handles.C4,'string');
i5=get(handles.C5,'string');

b1=str2double(i1);
b2=str2double(i2);
b3=str2double(i3);
b4=str2double(i4);
b5=str2double(i5);
 
if(b1<=5)&&(b2<=5)&&(b3<=5)&&(b4<=5)
x =  [100, 7, 1000, 10000000, 40; 
     300, 4, 300, 11000000, 50;
     400, 5, 400, 8000000, 70; 
     560, 6, 600, 7000000, 60;
     1000, 8, 550, 8000000, 80;
     650, 10, 660, 10000000, 40;
     250, 9, 700, 9000000, 85;
     95, 7, 800, 7700000, 30;
     700, 8, 900, 9900000, 70;
     220, 6, 880, 6000000, 100;];%data rating kecocokan dari masing-masing alternatif
k = [0 1 1 0 1];%atribut tiap-tiap kriteria, dimana nilai 1=atrribut keuntungan, dan  0= atribut biaya
w=[b1 b2 b3 b4 b5];%Nilai bobot tiap kriteria (1= sangat buruk, 2=buruk, 3= cukup, 4= tinggi, 5= sangat tinggi) 
 [m, n]=size (x);%inisialisasi ukuran x
w=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot
%perhitungan vektor(S) per baris (alternatif)
for j = 1:n,
    if k(j)==0, w(j)=-1*w(j);
    end
end
for i=1:m,
    S(i)=prod(x(i,:).^w); 
end
V = S/sum(S); % proses perangkingan
set(handles.listbox1,'string',V);
    
 %output hasil
if V(1)==max(V)
    set(handles.hasil,'string',('Malang'));
elseif V(2)==max(V)
    set(handles.hasil,'string',('Jogja'));
elseif V(3)==max(V) 
    set(handles.hasil,'string',('Padang'));
elseif V(4)==max(V)
    set(handles.hasil,'string',('Lampung'));
elseif V(5)==max(V)
    set(handles.hasil,'string',('Semarang'));
elseif V(6)==max(V)
    set(handles.hasil,'string',('Tanggerang'));
elseif V(7)==max(V)
    set(handles.hasil,'string',('Solo'));
elseif V(8)==max(V)
    set(handles.hasil,'string',('Bintaro'));
elseif V(9)==max(V)
    set(handles.hasil,'string',('Surabaya'));
elseif V(10)==max(V)
    set(handles.hasil,'string',('Magelang'));
end
else
    f=errordlg('Bobot terlalu tinggi','Patuhi Aturan');
end



function C1_Callback(hObject, eventdata, handles)
% hObject    handle to C1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C1 as text
%        str2double(get(hObject,'String')) returns contents of C1 as a double


% --- Executes during object creation, after setting all properties.
function C1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C2_Callback(hObject, eventdata, handles)
% hObject    handle to C2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C2 as text
%        str2double(get(hObject,'String')) returns contents of C2 as a double


% --- Executes during object creation, after setting all properties.
function C2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C3_Callback(hObject, eventdata, handles)
% hObject    handle to C3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C3 as text
%        str2double(get(hObject,'String')) returns contents of C3 as a double


% --- Executes during object creation, after setting all properties.
function C3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C4_Callback(hObject, eventdata, handles)
% hObject    handle to C4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C4 as text
%        str2double(get(hObject,'String')) returns contents of C4 as a double


% --- Executes during object creation, after setting all properties.
function C4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C5_Callback(hObject, eventdata, handles)
% hObject    handle to C5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C5 as text
%        str2double(get(hObject,'String')) returns contents of C5 as a double


% --- Executes during object creation, after setting all properties.
function C5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
