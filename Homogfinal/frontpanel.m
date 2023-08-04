function varargout = frontpanel(varargin)
% FRONTPANEL M-file for frontpanel.fig
%      FRONTPANEL, by itself, creates a new FRONTPANEL or raises the existing
%      singleton*.
%
%      H = FRONTPANEL returns the handle to a new FRONTPANEL or the handle to
%      the existing singleton*.
%
%      FRONTPANEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FRONTPANEL.M with the given input arguments.
%
%      FRONTPANEL('Property','Value',...) creates a new FRONTPANEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before frontpanel_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to frontpanel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help frontpanel

% Last Modified by GUIDE v2.5 17-Dec-2002 19:09:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @frontpanel_OpeningFcn, ...
                   'gui_OutputFcn',  @frontpanel_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before frontpanel is made visible.
function frontpanel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to frontpanel (see VARARGIN)

% Choose default command line output for frontpanel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes frontpanel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = frontpanel_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function wcg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wcg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function wcg_Callback(hObject, eventdata, handles)
% hObject    handle to wcg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wcg as text
%        str2double(get(hObject,'String')) returns contents of wcg as a double


% --- Executes during object creation, after setting all properties.
function wbg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wbg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function wbg_Callback(hObject, eventdata, handles)
% hObject    handle to wbg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wbg as text
%        str2double(get(hObject,'String')) returns contents of wbg as a double


% --- Executes during object creation, after setting all properties.
function wag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function wag_Callback(hObject, eventdata, handles)
% hObject    handle to wag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wag as text
%        str2double(get(hObject,'String')) returns contents of wag as a double


% --- Executes during object creation, after setting all properties.
function wagref_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wagref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function wagref_Callback(hObject, eventdata, handles)
% hObject    handle to wagref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wagref as text
%        str2double(get(hObject,'String')) returns contents of wagref as a double


% --- Executes during object creation, after setting all properties.
function Gcg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gcg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Gcg_Callback(hObject, eventdata, handles)
% hObject    handle to Gcg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Gcg as text
%        str2double(get(hObject,'String')) returns contents of Gcg as a double


% --- Executes during object creation, after setting all properties.
function Gbg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gbg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Gbg_Callback(hObject, eventdata, handles)
% hObject    handle to Gbg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Gbg as text
%        str2double(get(hObject,'String')) returns contents of Gbg as a double


% --- Executes during object creation, after setting all properties.
function Gag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Gag_Callback(hObject, eventdata, handles)
% hObject    handle to Gag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Gag as text
%        str2double(get(hObject,'String')) returns contents of Gag as a double


% --- Executes during object creation, after setting all properties.
function Gcb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gcb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Gcb_Callback(hObject, eventdata, handles)
% hObject    handle to Gcb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Gcb as text
%        str2double(get(hObject,'String')) returns contents of Gcb as a double


% --- Executes during object creation, after setting all properties.
function wagalt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wagalt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function wagalt_Callback(hObject, eventdata, handles)
% hObject    handle to wagalt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wagalt as text
%        str2double(get(hObject,'String')) returns contents of wagalt as a double


% --- Executes during object creation, after setting all properties.
function Gagref_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gagref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Gagref_Callback(hObject, eventdata, handles)
% hObject    handle to Gagref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Gagref as text
%        str2double(get(hObject,'String')) returns contents of Gagref as a double


% --- Executes during object creation, after setting all properties.
function Gagalt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gagalt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Gagalt_Callback(hObject, eventdata, handles)
% hObject    handle to Gagalt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Gagalt as text
%        str2double(get(hObject,'String')) returns contents of Gagalt as a double


% --- Executes during object creation, after setting all properties.
function ADIR1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ADIR1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ADIR1_Callback(hObject, eventdata, handles)
% hObject    handle to ADIR1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ADIR1 as text
%        str2double(get(hObject,'String')) returns contents of ADIR1 as a double


% --- Executes during object creation, after setting all properties.
function ADIR2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ADIR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ADIR2_Callback(hObject, eventdata, handles)
% hObject    handle to ADIR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ADIR2 as text
%        str2double(get(hObject,'String')) returns contents of ADIR2 as a double


% --- Executes during object creation, after setting all properties.
function ADRam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ADRam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ADRam_Callback(hObject, eventdata, handles)
% hObject    handle to ADRam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ADRam as text
%        str2double(get(hObject,'String')) returns contents of ADRam as a double


% --- Executes during object creation, after setting all properties.
function ACARSref_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ACARSref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ACARSref_Callback(hObject, eventdata, handles)
% hObject    handle to ACARSref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ACARSref as text
%        str2double(get(hObject,'String')) returns contents of ACARSref as a double


% --- Executes during object creation, after setting all properties.
function ACARSalt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ACARSalt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ACARSalt_Callback(hObject, eventdata, handles)
% hObject    handle to ACARSalt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ACARSalt as text
%        str2double(get(hObject,'String')) returns contents of ACARSalt as a double


% --- Executes during object creation, after setting all properties.
function ASIVE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ASIVE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ASIVE_Callback(hObject, eventdata, handles)
% hObject    handle to ASIVE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ASIVE as text
%        str2double(get(hObject,'String')) returns contents of ASIVE as a double


% --- Executes during object creation, after setting all properties.
function sigw1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigw1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function sigw1_Callback(hObject, eventdata, handles)
% hObject    handle to sigw1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigw1 as text
%        str2double(get(hObject,'String')) returns contents of sigw1 as a double


% --- Executes during object creation, after setting all properties.
function sigw2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigw2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function sigw2_Callback(hObject, eventdata, handles)
% hObject    handle to sigw2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigw2 as text
%        str2double(get(hObject,'String')) returns contents of sigw2 as a double


% --- Executes during object creation, after setting all properties.
function sigw3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigw3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function sigw3_Callback(hObject, eventdata, handles)
% hObject    handle to sigw3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigw3 as text
%        str2double(get(hObject,'String')) returns contents of sigw3 as a double


% --- Executes during object creation, after setting all properties.
function T21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function T21_Callback(hObject, eventdata, handles)
% hObject    handle to T21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of T21 as text
%        str2double(get(hObject,'String')) returns contents of T21 as a double


% --- Executes during object creation, after setting all properties.
function T32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function T32_Callback(hObject, eventdata, handles)
% hObject    handle to T32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of T32 as text
%        str2double(get(hObject,'String')) returns contents of T32 as a double


% --- Executes during object creation, after setting all properties.
function Abg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Abg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Abg_Callback(hObject, eventdata, handles)
% hObject    handle to Abg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Abg as text
%        str2double(get(hObject,'String')) returns contents of Abg as a double


% --- Executes during object creation, after setting all properties.
function samnirfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samnirfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function samnirfile_Callback(hObject, eventdata, handles)
% hObject    handle to samnirfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samnirfile as text
%        str2double(get(hObject,'String')) returns contents of samnirfile as a double


% --- Executes during object creation, after setting all properties.
function samemfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samemfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function samemfile_Callback(hObject, eventdata, handles)
% hObject    handle to samemfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samemfile as text
%        str2double(get(hObject,'String')) returns contents of samemfile as a double


% --- Executes during object creation, after setting all properties.
function outfilepre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outfilepre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function outfilepre_Callback(hObject, eventdata, handles)
% hObject    handle to outfilepre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outfilepre as text
%        str2double(get(hObject,'String')) returns contents of outfilepre as a double


% --- Executes during object creation, after setting all properties.
function Nsam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Nsam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Nsam_Callback(hObject, eventdata, handles)
% hObject    handle to Nsam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Nsam as text
%        str2double(get(hObject,'String')) returns contents of Nsam as a double


% --- Executes during object creation, after setting all properties.
function Nbg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Nbg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Nbg_Callback(hObject, eventdata, handles)
% hObject    handle to Nbg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Nbg as text
%        str2double(get(hObject,'String')) returns contents of Nbg as a double


% --- Executes during object creation, after setting all properties.
function w1beg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w1beg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function w1beg_Callback(hObject, eventdata, handles)
% hObject    handle to w1beg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w1beg as text
%        str2double(get(hObject,'String')) returns contents of w1beg as a double


% --- Executes during object creation, after setting all properties.
function w1end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w1end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function w1end_Callback(hObject, eventdata, handles)
% hObject    handle to w1end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w1end as text
%        str2double(get(hObject,'String')) returns contents of w1end as a double


% --- Executes during object creation, after setting all properties.
function w2beg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w2beg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function w2beg_Callback(hObject, eventdata, handles)
% hObject    handle to w2beg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w2beg as text
%        str2double(get(hObject,'String')) returns contents of w2beg as a double


% --- Executes during object creation, after setting all properties.
function ls_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ls (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ls_Callback(hObject, eventdata, handles)
% hObject    handle to ls (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ls as text
%        str2double(get(hObject,'String')) returns contents of ls as a double


% --- Executes during object creation, after setting all properties.
function theta31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function theta31_Callback(hObject, eventdata, handles)
% hObject    handle to theta31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta31 as text
%        str2double(get(hObject,'String')) returns contents of theta31 as a double


% --- Executes during object creation, after setting all properties.
function theta21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function theta21_Callback(hObject, eventdata, handles)
% hObject    handle to theta21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta21 as text
%        str2double(get(hObject,'String')) returns contents of theta21 as a double


% --- Executes during object creation, after setting all properties.
function lfw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lfw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function lfw_Callback(hObject, eventdata, handles)
% hObject    handle to lfw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lfw as text
%        str2double(get(hObject,'String')) returns contents of lfw as a double


% --- Executes during object creation, after setting all properties.
function Afw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Afw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Afw_Callback(hObject, eventdata, handles)
% hObject    handle to Afw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Afw as text
%        str2double(get(hObject,'String')) returns contents of Afw as a double


% --- Executes during object creation, after setting all properties.
function lbw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lbw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function lbw_Callback(hObject, eventdata, handles)
% hObject    handle to lbw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lbw as text
%        str2double(get(hObject,'String')) returns contents of lbw as a double


% --- Executes during object creation, after setting all properties.
function Abw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Abw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Abw_Callback(hObject, eventdata, handles)
% hObject    handle to Abw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Abw as text
%        str2double(get(hObject,'String')) returns contents of Abw as a double


% --- Executes during object creation, after setting all properties.
function nsamoff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nsamoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function nsamoff_Callback(hObject, eventdata, handles)
% hObject    handle to nsamoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nsamoff as text
%        str2double(get(hObject,'String')) returns contents of nsamoff as a double


% --- Executes during object creation, after setting all properties.
function xintbg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xintbg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function xintbg_Callback(hObject, eventdata, handles)
% hObject    handle to xintbg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xintbg as text
%        str2double(get(hObject,'String')) returns contents of xintbg as a double


% --- Executes during object creation, after setting all properties.
function samnvisfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samnvisfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function samnvisfile_Callback(hObject, eventdata, handles)
% hObject    handle to samnvisfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samnvisfile as text
%        str2double(get(hObject,'String')) returns contents of samnvisfile as a double


% --- Executes during object creation, after setting all properties.
function fwnvisfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fwnvisfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function fwnvisfile_Callback(hObject, eventdata, handles)
% hObject    handle to fwnvisfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fwnvisfile as text
%        str2double(get(hObject,'String')) returns contents of fwnvisfile as a double


% --- Executes during object creation, after setting all properties.
function fwnirfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fwnirfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function fwnirfile_Callback(hObject, eventdata, handles)
% hObject    handle to fwnirfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fwnirfile as text
%        str2double(get(hObject,'String')) returns contents of fwnirfile as a double


% --- Executes during object creation, after setting all properties.
function fwemfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fwemfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function fwemfile_Callback(hObject, eventdata, handles)
% hObject    handle to fwemfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fwemfile as text
%        str2double(get(hObject,'String')) returns contents of fwemfile as a double


% --- Executes during object creation, after setting all properties.
function bwnvisfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bwnvisfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function bwnvisfile_Callback(hObject, eventdata, handles)
% hObject    handle to bwnvisfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bwnvisfile as text
%        str2double(get(hObject,'String')) returns contents of bwnvisfile as a double


% --- Executes during object creation, after setting all properties.
function bwnirfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bwnirfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function bwnirfile_Callback(hObject, eventdata, handles)
% hObject    handle to bwnirfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bwnirfile as text
%        str2double(get(hObject,'String')) returns contents of bwnirfile as a double


% --- Executes during object creation, after setting all properties.
function bwemfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bwemfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function bwemfile_Callback(hObject, eventdata, handles)
% hObject    handle to bwemfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bwemfile as text
%        str2double(get(hObject,'String')) returns contents of bwemfile as a double


% --- Executes during object creation, after setting all properties.
function Ttot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ttot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Ttot_Callback(hObject, eventdata, handles)
% hObject    handle to Ttot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ttot as text
%        str2double(get(hObject,'String')) returns contents of Ttot as a double


% --- Executes during object creation, after setting all properties.
function dt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function dt_Callback(hObject, eventdata, handles)
% hObject    handle to dt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dt as text
%        str2double(get(hObject,'String')) returns contents of dt as a double


% --- Executes during object creation, after setting all properties.
function dtf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dtf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function dtf_Callback(hObject, eventdata, handles)
% hObject    handle to dtf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dtf as text
%        str2double(get(hObject,'String')) returns contents of dtf as a double


% --- Executes on button press in comput.
function comput_Callback(hObject, eventdata, handles)
% hObject    handle to comput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function PMTqefile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PMTqefile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function PMTqefile_Callback(hObject, eventdata, handles)
% hObject    handle to PMTqefile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PMTqefile as text
%        str2double(get(hObject,'String')) returns contents of PMTqefile as a double


% --- Executes during object creation, after setting all properties.
function Nref_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Nref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Nref_Callback(hObject, eventdata, handles)
% hObject    handle to Nref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Nref as text
%        str2double(get(hObject,'String')) returns contents of Nref as a double


% --- Executes during object creation, after setting all properties.
function w2end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w2end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function w2end_Callback(hObject, eventdata, handles)
% hObject    handle to w2end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w2end as text
%        str2double(get(hObject,'String')) returns contents of w2end as a double


% --- Executes during object creation, after setting all properties.
function w2sp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w2sp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function w2sp_Callback(hObject, eventdata, handles)
% hObject    handle to w2sp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w2sp as text
%        str2double(get(hObject,'String')) returns contents of w2sp as a double


% --- Executes during object creation, after setting all properties.
function offset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to offset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function offset_Callback(hObject, eventdata, handles)
% hObject    handle to offset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of offset as text
%        str2double(get(hObject,'String')) returns contents of offset as a double


% --- Executes during object creation, after setting all properties.
function ACARS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ACARS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ACARS_Callback(hObject, eventdata, handles)
% hObject    handle to ACARS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ACARS as text
%        str2double(get(hObject,'String')) returns contents of ACARS as a double


% --- Executes during object creation, after setting all properties.
function anharmw1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to anharmw1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function anharmw1_Callback(hObject, eventdata, handles)
% hObject    handle to anharmw1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of anharmw1 as text
%        str2double(get(hObject,'String')) returns contents of anharmw1 as a double


% --- Executes during object creation, after setting all properties.
function anharmw2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to anharmw2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function anharmw2_Callback(hObject, eventdata, handles)
% hObject    handle to anharmw2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of anharmw2 as text
%        str2double(get(hObject,'String')) returns contents of anharmw2 as a double


% --- Executes during object creation, after setting all properties.
function Ratio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Ratio_Callback(hObject, eventdata, handles)
% hObject    handle to Ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ratio as text
%        str2double(get(hObject,'String')) returns contents of Ratio as a double


% --- Executes during object creation, after setting all properties.
function Nalt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Nalt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Nalt_Callback(hObject, eventdata, handles)
% hObject    handle to Nalt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Nalt as text
%        str2double(get(hObject,'String')) returns contents of Nalt as a double


% --- Executes on button press in saveparams.
function saveparams_Callback(hObject, eventdata, handles)
% hObject    handle to saveparams (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of saveparams


% --- Executes during object creation, after setting all properties.
function w3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function w3_Callback(hObject, eventdata, handles)
% hObject    handle to w3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w3 as text
%        str2double(get(hObject,'String')) returns contents of w3 as a double


% --- Executes during object creation, after setting all properties.
function loadparams_CreateFcn(hObject, eventdata, handles)
% hObject    handle to loadparams (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function loadparams_Callback(hObject, eventdata, handles)
% hObject    handle to loadparams (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of loadparams as text
%        str2double(get(hObject,'String')) returns contents of loadparams as a double


% --- Executes on button press in toggleload.
function toggleload_Callback(hObject, eventdata, handles)
% hObject    handle to toggleload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


