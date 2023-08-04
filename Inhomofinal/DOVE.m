function varargout = DOVE(varargin)
% DOVE M-file for DOVE.fig
%      DOVE, by itself, creates a new DOVE or raises the existing
%      singleton*.
%
%      H = DOVE returns the handle to a new DOVE or the handle to
%      the existing singleton*.
%
%      DOVE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DOVE.M with the given input arguments.
%
%      DOVE('Property','Value',...) creates a new DOVE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DOVE_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DOVE_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DOVE

% Last Modified by GUIDE v2.5 09-Aug-2021 16:38:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DOVE_OpeningFcn, ...
                   'gui_OutputFcn',  @DOVE_OutputFcn, ...
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


% --- Executes just before DOVE is made visible.
function DOVE_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DOVE (see VARARGIN)

% Choose default command line output for DOVE
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DOVE wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DOVE_OutputFcn(hObject, eventdata, handles)
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
function Nyq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Nyq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Nyq_Callback(hObject, eventdata, handles)
% hObject    handle to Nyq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Nyq as text
%        str2double(get(hObject,'String')) returns contents of Nyq as a double


% --- Executes during object creation, after setting all properties.
function res_CreateFcn(hObject, eventdata, handles)
% hObject    handle to res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function res_Callback(hObject, eventdata, handles)
% hObject    handle to res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of res as text
%        str2double(get(hObject,'String')) returns contents of res as a double


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


% --- Executes during object creation, after setting all properties.
function datafile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to datafile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function datafile_Callback(hObject, eventdata, handles)
% hObject    handle to datafile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of datafile as text
%        str2double(get(hObject,'String')) returns contents of datafile as a double


% --- Executes on button press in leastsquareson.
function leastsquareson_Callback(hObject, eventdata, handles)
% hObject    handle to leastsquareson (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of leastsquareson


% --- Executes during object creation, after setting all properties.
function etaab_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etaab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function etaab_Callback(hObject, eventdata, handles)
% hObject    handle to etaab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etaab as text
%        str2double(get(hObject,'String')) returns contents of etaab as a double


% --- Executes during object creation, after setting all properties.
function lambdabg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lambdabg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function lambdabg_Callback(hObject, eventdata, handles)
% hObject    handle to lambdabg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lambdabg as text
%        str2double(get(hObject,'String')) returns contents of lambdabg as a double


% --- Executes during object creation, after setting all properties.
function lambdaag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lambdaag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function lambdaag_Callback(hObject, eventdata, handles)
% hObject    handle to lambdaag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lambdaag as text
%        str2double(get(hObject,'String')) returns contents of lambdaag as a double


% --- Executes during object creation, after setting all properties.
function kappaag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kappaag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function kappaag_Callback(hObject, eventdata, handles)
% hObject    handle to kappaag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kappaag as text
%        str2double(get(hObject,'String')) returns contents of kappaag as a double


% --- Executes during object creation, after setting all properties.
function kappabg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kappabg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function kappabg_Callback(hObject, eventdata, handles)
% hObject    handle to kappabg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kappabg as text
%        str2double(get(hObject,'String')) returns contents of kappabg as a double


% --- Executes during object creation, after setting all properties.
function edit74_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit74 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit74_Callback(hObject, eventdata, handles)
% hObject    handle to edit74 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit74 as text
%        str2double(get(hObject,'String')) returns contents of edit74 as a double


% --- Executes during object creation, after setting all properties.
function fwhm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fwhm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function fwhm_Callback(hObject, eventdata, handles)
% hObject    handle to fwhm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fwhm as text
%        str2double(get(hObject,'String')) returns contents of fwhm as a double


% --- Executes during object creation, after setting all properties.
function lambda_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function lambda_Callback(hObject, eventdata, handles)
% hObject    handle to lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lambda as text
%        str2double(get(hObject,'String')) returns contents of lambda as a double


% --- Executes during object creation, after setting all properties.
function path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function path_Callback(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path as text
%        str2double(get(hObject,'String')) returns contents of path as a double


% --- Executes during object creation, after setting all properties.
function kappa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kappa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function kappa_Callback(hObject, eventdata, handles)
% hObject    handle to kappa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kappa as text
%        str2double(get(hObject,'String')) returns contents of kappa as a double


% --- Executes during object creation, after setting all properties.
function delta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to delta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function delta_Callback(hObject, eventdata, handles)
% hObject    handle to delta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of delta as text
%        str2double(get(hObject,'String')) returns contents of delta as a double


% --- Executes during object creation, after setting all properties.
function gamstar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function gamstar_Callback(hObject, eventdata, handles)
% hObject    handle to pure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pure as text
%        str2double(get(hObject,'String')) returns contents of pure as a double


% --- Executes during object creation, after setting all properties.
function gam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function gam_Callback(hObject, eventdata, handles)
% hObject    handle to pure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pure as text
%        str2double(get(hObject,'String')) returns contents of pure as a double


% --- Executes during object creation, after setting all properties.
function pure_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function pure_Callback(hObject, eventdata, handles)
% hObject    handle to pure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pure as text
%        str2double(get(hObject,'String')) returns contents of pure as a double


% --- Executes during object creation, after setting all properties.
function FWHM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FWHM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function FWHM_Callback(hObject, eventdata, handles)
% hObject    handle to FWHM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FWHM as text
%        str2double(get(hObject,'String')) returns contents of FWHM as a double


% --- Executes on button press in E2flag0.
function E2flag0_Callback(hObject, eventdata, handles)
% hObject    handle to E2flag0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of E2flag0


% --- Executes on button press in E1flag0.
function E1flag0_Callback(hObject, eventdata, handles)
% hObject    handle to E1flag0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of E1flag0



function edit83_Callback(hObject, eventdata, handles)
% hObject    handle to edit83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit83 as text
%        str2double(get(hObject,'String')) returns contents of edit83 as a double


% --- Executes during object creation, after setting all properties.
function edit83_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
