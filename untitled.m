%c1709305 coursework

%In this equaliser, to see changes applied, move the volume slider every
%time you change something in the equalisation settings.


function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 11-Apr-2019 15:47:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, ~, handles, varargin)
    global hhandles;
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose inital command line output for untitled
handles.output = hObject;
hhandles = handles;
% Update handles structure
guidata(hObject, handles);
set(handles.axes3,'YLim',[-1 1]);
set(handles.axes5,'YLim',[-1 1]);
set(gcf,'Units','Normalized')
hold on;

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get inital command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load.
function load_Callback(~, ~, handles) %#ok<*DEFNU>
    global ybase;
    global player;
    global Fs;
   
    [file, pathname] = uigetfile({'*.wav;*.mp3;*.flac;*.aac;*.mp4'; '*.*'}, 'File choice');
    
    handles.fullpath = strcat(pathname, file);
    set (handles.path, 'String', handles.fullpath)
    
    music = get(handles.path, 'String');
    [ybase, Fs] = audioread(music);
    ybase = ybase * 0.25; 
    player = audioplayer(ybase, Fs);
    update_base_plot(ybase, handles)
   
%    cla;
    % axes equal;

    %guide(hObject,handles)
    %player = audioplayer(y, Fs);
    %display(player);


%[filename, filepath] = uigetfile({'*.wav'; '*.mp3'; '*.*'}, 'Pick an audio file');
%if ~ischar(filename); return; end    %user canceled

%fullname = fullfile(filepath, filename);
    %try
       %[y, Fs] = audioread(fullname);
      % PO=audioplayer(y,Fs);
       % Play audio
     %  playblocking(PO)
    %catch ME
    %  uiwait(msgbox('Could not open that file with audioread'));
   % end
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function path_Callback(hObject, ~, handles)

   % x = handles.path
    
    ExPath = music;
    set(handles.path,'String',ExPath);
    guidata(hObject, handles);
    
   
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path as text
%        str2double(get(hObject,'String')) returns contents of path as a double


% --- Executes during object creation, after setting all properties.
function path_CreateFcn(hObject, ~, ~)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pathfinder.
%function pathfinder_Callback(~, ~, ~)
% hObject    handle to pathfinder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in result.
function result_Callback(~, ~, ~)
    global ybase;
    global Fs;
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y_out = calc_music(ybase);
% newplayer = audioplayer(y, Fs);
audiowrite("output.wav",y_out,Fs);


% --- Executes on button press in inital.
function inital_Callback(hObject, ~, handles)
    global eq;
    set(handles.slider2,'Value', 0.5);
    set(handles.slider3, 'Value', 0.5);
    set(handles.slider4,'Value', 0.5);
    set(handles.slider5, 'Value', 0.5);
    set(handles.slider6,'Value', 0.5);
    set(handles.slider7, 'Value', 0.5);
    set(handles.slider8,'Value', 0.5);
    set(handles.slider9, 'Value', 0.5);
    set(handles.slider10,'Value', 0.5);
    set(handles.slider11, 'Value', 0.5);
    eq = [1; 1; 1; 1; 1; 1; 1; 1; 1; 1];
% hObject    handle to inital (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider1_Callback(hObject, ~, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global voldb;    
global volmag;
global ybase;
global player;

voldb = (get(hObject,'Value') - 0.5) * 24;
volmag = db2mag(voldb);

is_playing = player.isplaying();

if is_playing
    pause(player);
end
cur_sam = player.CurrentSample;
update_player(ybase, handles);
play(player, cur_sam);

%if ~is_playing
%    pause(player)
%end

function slider1_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in reversed.
function reversed_Callback(~, ~, handles)
    global ybase;
    ybase = flip(ybase);
    update_base_plot(ybase, handles)
    
  
% hObject    handle to reversed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of reversed

%function magv_Callback(~, ~, ~)
% hObject    handle to magv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDAT
% Hints: get(hObject,'String') returns contents of magv as text
%        str2double(get(hObject,'String')) returns contents of magv as a double

% --- Executes during object creation, after setting all properties.
%function magv_CreateFcn(hObject, ~, ~)
% hObject    handle to magv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
%if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%    set(hObject,'BackgroundColor','white');
%end


%function fval_Callback(~, ~, ~)
% hObject    handle to fval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fval as text
%        str2double(get(hObject,'String')) returns contents of fval as a double


% --- Executes during object creation, after setting all properties.
%function fval_CreateFcn(hObject, ~, ~)
% hObject    handle to fval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
%if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%    set(hObject,'BackgroundColor','white');
%end

% Hints: get(hObject,'String') returns contents of volv as text
%        str2double(get(hObject,'String')) returns contents of volv as a double


%function volv_CreateFcn(hObject, ~, ~)
%if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%    set(hObject,'BackgroundColor','white');
%end

function set_eq_from_slider(pos, val)
    global eq
    kdB = 24 * (val) - 12;
    kmag = db2mag(kdB);
    eq(pos) = kmag;
    %global ybase
    %global hhandles
    %ybase = calc_music(ybase);
    %update_base_plot(ybase, hhandles)

    
function slider2_Callback(hObject, ~, ~)
    set_eq_from_slider(1, get(hObject, 'Value'));
    
function slider2_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider3_Callback(hObject, ~, ~)
    set_eq_from_slider(2, get(hObject, 'Value'));

function slider3_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider4_Callback(hObject, ~, ~)
    set_eq_from_slider(3, get(hObject, 'Value'));

function slider4_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider5_Callback(hObject, ~, ~)
    set_eq_from_slider(4, get(hObject, 'Value'));

function slider5_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider6_Callback(hObject, ~, ~)
    set_eq_from_slider(5, get(hObject, 'Value'));

function slider6_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider7_Callback(hObject, ~, ~)
    set_eq_from_slider(6, get(hObject, 'Value'));
    
function slider7_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider8_Callback(hObject, ~, ~)
    set_eq_from_slider(7, get(hObject, 'Value'));

function slider8_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider9_Callback(hObject, ~, ~)
    set_eq_from_slider(8, get(hObject, 'Value'));

function slider9_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider10_Callback(hObject, ~, ~)
    set_eq_from_slider(9, get(hObject, 'Value'));

function slider10_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider11_Callback(hObject, ~, ~)
    set_eq_from_slider(10, get(hObject, 'Value'));


function slider11_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function eq_v = calculate_equalized(source)
global Fs;
global eq;

total_samples = length(source);
eq_val = [32,64,125,250,500,1000,2000,4000,8000,16000];
z = fft(source, total_samples);

for i=1:10
  if eq_val(i)<Fs/2 
    Feq = eq_val(i);
    Feq1 = Feq - 1/4*Feq;
    Feq2 = Feq + 1/4*Feq;

    Pos1 = round(Feq1*total_samples/Fs);
    Pos2 = round(Feq2*total_samples/Fs);
    Pos3 = total_samples-Pos2;
    Pos4 = total_samples-Pos1;

    z(Pos1:Pos2) = z(Pos1:Pos2)* eq(i);
    z(Pos3:Pos4) = z(Pos3:Pos4)* eq(i);
  end
end

eq_v = ifft(z, total_samples);
%norm = real(max(eq_v));
%eq_v = eq_v./norm(1);

function res = calc_music(audio_source)
    global volmag;
    res = calculate_equalized(audio_source);
    res = res * volmag;

function update_player(audio_source, handles)
    global Fs;
    global player;
    v = calc_music(audio_source);
    player = audioplayer(v, Fs);
    update_base_plot(v, handles)
    
function update_base_plot(data, handles)
    cla;
    axis(handles.axes3, [0.5 length(data) -1 1]);
    plot(handles.axes3, real(data),'b');
    %hold on;
    
function Play_Callback(~, ~, handles)
    global ybase;
    global player;
    update_player(ybase, handles);
    play(player);
   % x = handles.path
   % music = get(handles.path, 'String');
   % [y,Fs] = audioread(music);
   % player = audioplayer(y, Fs);
% hObject    handle to Play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pause.
function pause_Callback(~, ~, ~)
   global player;
   pause(player);
   
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in stop.
function stop_Callback(~, ~, ~)
    global player;
    stop(player);
   
function resume_Callback(~, ~, ~)
    global player;
    resume(player);
   
function safedef_Callback(~, ~, handles)
    safedef(handles)

function safedef(handles)
    state.sl1 = get(handles.slider2, 'Value');
    state.sl2 = get(handles.slider3, 'Value');
    state.sl3 = get(handles.slider4, 'Value');
    state.sl4 = get(handles.slider5, 'Value');
    state.sl5 = get(handles.slider6, 'Value');
    state.sl6 = get(handles.slider7, 'Value');
    state.sl7 = get(handles.slider8, 'Value');
    state.sl8 = get(handles.slider9, 'Value');
    state.sl9 = get(handles.slider10, 'Value');
    state.sl10 = get(handles.slider11, 'Value');
    save defaults.mat state

function loaddef_Callback(~, ~, handles)
    loaddef(handles)

function loaddef(handles)
    load 'defaults.mat' state
    set(handles.slider2,'Value', state.sl1);
    set(handles.slider3, 'Value', state.sl2);
    set(handles.slider4,'Value', state.sl3);
    set(handles.slider5, 'Value', state.sl4);
    set(handles.slider6,'Value', state.sl5);
    set(handles.slider7, 'Value', state.sl6);
    set(handles.slider8,'Value', state.sl7);
    set(handles.slider9, 'Value', state.sl8);
    set(handles.slider10,'Value', state.sl9);
    set(handles.slider11, 'Value', state.sl10);
    

%based on https://uk.mathworks.com/matlabcentral/fileexchange/66200-cross-synthesis-example-with-matlab-implementation
function [z, Fs] = envelope_audio(x, fsx, y, fsy)
x = x(:, 1);
y = y(:, 1);

Fs = max(fsx,fsy);
if fsx < Fs
    x = resample(x, Fs, fsx);
else
    y = resample(y, Fs, fsy);
end

lenx = size(x,1);
leny = size(y,1);

Ns = min(lenx,leny);
x = x(1:Ns);
y = y(1:Ns);

delta_t = 2048;
step_t = 256;

num_f = fix(delta_t/2);
num_t = fix((Ns - delta_t)/step_t);

% short-time Fourier
win = hamming(delta_t, 'periodic');

for ii = 1:num_t
    xw = x((ii-1)*step_t+1:(ii-1)*step_t+delta_t).*win;
    X = fft(xw,delta_t);
    Xstft(:,ii) = X(1:num_f);

    yw = y((ii-1)*step_t+1:(ii-1)*step_t+delta_t).*win;
    Y = fft(yw,delta_t);
    Ystft(:,ii) = Y(1:num_f);
end

fvec = (0:num_f-1)*Fs/delta_t;
delta_f = fvec(2)-fvec(1);

% extracting spectral envelopes

Xstft_amp = abs(Xstft);
Ystft_amp = abs(Ystft);

for kk = 1:num_t
    [Xpeaks,pkpos] = findpeaks(Xstft_amp(:,kk));
    f_pks = pkpos * delta_f;
    X_envel(:,kk) = interp1(f_pks, Xpeaks,fvec,'pchip');
%    X_envel(:,kk) = smooth(X_envel(:,kk));         %!!!!!!!!!!!!!!!!!!!!!!
end

for kk = 1:num_t
    [Ypeaks,pkpos] = findpeaks(Ystft_amp(:,kk));
    f_pks = pkpos * delta_f;
    Y_envel(:,kk) = interp1(f_pks, Ypeaks,fvec,'pchip');
%    Y_envel(:,kk) = smooth(Y_envel(:,kk));
end

% cross synthesis

% flattened spectrum
FSP = Xstft./X_envel;

%apply spectrum envelope
Zstft = FSP.*Y_envel;
%Zstft = Xstft.*Y_envel;

% inverse STFT
z_len = num_t*step_t + delta_t;
z = zeros(1,z_len);

for ii = 1:num_t
    ZZ = Zstft(:,ii);
    ZZ = [ZZ;conj(ZZ(end:-1:1))];
    Zistft = real(ifft(ZZ));
    z((ii-1)*step_t+1:(ii-1)*step_t+delta_t) = z((ii-1)*step_t+1:(ii-1)*step_t+delta_t) + (Zistft.*win)';
end

% scale the signal
Sq = sum(win.^2);
z = z.*step_t/Sq;


% --- Executes on button press in envelope.
function envelope_Callback(~, ~, ~)
global m_module;
global Fs_module;
global m_carrier;
global Fs_carrier;
global sync_player;
[z Fs] = envelope_audio(m_carrier, Fs_carrier, m_module, Fs_module);
sync_player = audioplayer(z, Fs);
play(sync_player)

    


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, ~, handles)
 %set(axes3,'YLim',[0 1]);
 %hold on;

% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3


% --- Executes on button press in load_carrier.
function load_carrier_Callback(hObject, eventdata, handles)
    global m_carrier;
    %global player;
    %global sync_player;
    global Fs_carrier;
   
    [file, pathname] = uigetfile({'*.wav;*.mp3;*.flac;*.aac;*.mp4'; '*.*'}, 'File choice');

    music = strcat(pathname, file);
    [m_carrier, Fs_carrier] = audioread(music);
    update_sync_plot(m_carrier, handles)
    
function update_sync_plot(data, handles)
    %ax = handles.axes5;
    %ax.YLimMode = 'manual';
    %ax.YLim = [-1 1];
    cla(handles.axes5);
    axis(handles.axes5, [0.5 length(data) -1 1]);
    plot(handles.axes5, data,'b');
    

% --- Executes on button press in load_mod.
function load_mod_Callback(hObject, eventdata, handles)
global m_module;
global Fs_module;
   
    [file, pathname] = uigetfile({'*.wav;*.mp3;*.flac;*.aac;*.mp4'; '*.*'}, 'File choice');
    
    music = strcat(pathname, file);
    [m_module, Fs_module] = audioread(music);
    update_sync_plot(m_module, handles)


% --- Executes on button press in voiceset.
function voiceset_Callback(hObject, eventdata, handles)
    global eq;
    set(handles.slider2,'Value', mag2db(0.27)/24 +0.5);
    set(handles.slider3,'Value', mag2db(0.35)/24 + 0.5);
    set(handles.slider4,'Value', mag2db(1)/24 + 0.5);
    set(handles.slider5,'Value', mag2db(3)/24 + 0.5);
    set(handles.slider6,'Value', mag2db(3.9)/24 + 0.5);
    set(handles.slider7,'Value', mag2db(3.5)/24 + 0.5);
    set(handles.slider8,'Value', mag2db(0.7)/24 + 0.5);
    set(handles.slider9,'Value', mag2db(0.5)/24 + 0.5);
    set(handles.slider10,'Value', mag2db(0.3)/24 + 0.5);
    set(handles.slider11,'Value', mag2db(0.27)/24 + 0.5);
    
    eq = [0.27 0.35 1 3 3.9 3.5 0.7 0.5 0.3 0.27];


% --- Executes on button press in discoset.
function discoset_Callback(hObject, eventdata, handles)
    global eq;
    set(handles.slider2,'Value', mag2db(3)/24 +0.5);
    set(handles.slider3,'Value', mag2db(3.9)/24 + 0.5);
    set(handles.slider4,'Value', mag2db(3)/24 + 0.5);
    set(handles.slider5,'Value', mag2db(1)/24 + 0.5);
    set(handles.slider6,'Value', mag2db(0.5)/24 + 0.5);
    set(handles.slider7,'Value', mag2db(1)/24 + 0.5);
    set(handles.slider8,'Value', mag2db(1.5)/24 + 0.5);
    set(handles.slider9,'Value', mag2db(3)/24 + 0.5);
    set(handles.slider10,'Value', mag2db(3.9)/24 + 0.5);
    set(handles.slider11,'Value', mag2db(3.9)/24 + 0.5);
    eq = [3 3.9 3 1 0.5 1 1.5 3 3.9 3.9];
% hObject    handle to discoset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in rockset.
function rockset_Callback(hObject, eventdata, handles)
    global eq;
    set(handles.slider2,'Value', mag2db(3)/24 +0.5);
    set(handles.slider3,'Value', mag2db(3.9)/24 + 0.5);
    set(handles.slider4,'Value', mag2db(1)/24 + 0.5);
    set(handles.slider5,'Value', mag2db(0.3)/24 + 0.5);
    set(handles.slider6,'Value', mag2db(3.9)/24 + 0.5);
    set(handles.slider7,'Value', mag2db(3.9)/24 + 0.5);
    set(handles.slider8,'Value', mag2db(0.3)/24 + 0.5);
    set(handles.slider9,'Value', mag2db(0.3)/24 + 0.5);
    set(handles.slider10,'Value', mag2db(3.9)/24 + 0.5);
    set(handles.slider11,'Value', mag2db(3.9)/24 + 0.5);
   
    eq = [3 3.9 1 0.3 3.9 3.9 0.3 0.3 3.9 3.9];
% hObject    handle to rockset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit9_Callback(hObject, eventdata, handles)
global eq_val;
value = get(hObject, 'String');
eq_val(1) = str2num(value);

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
global eq_val;
value = get(hObject, 'String');
eq_val(2) = str2num(value);

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
global eq_val;
value = get(hObject, 'String');
eq_val(3) = str2num(value);

% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
global eq_val;
value = get(hObject, 'String');
eq_val(4) = str2num(value);



% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
global eq_val;
value = get(hObject, 'String');
eq_val(5) = str2num(value);


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
global eq_val;
value = get(hObject, 'String');
eq_val(6) = str2num(value);

% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
global eq_val;
value = get(hObject, 'String');
eq_val(7) = str2num(value);


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
global eq_val;
value = get(hObject, 'String');
eq_val(8) = str2num(value);


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
global eq_val;
value = get(hObject, 'String');
eq_val(9) = str2num(value);

% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
global eq_val;
value = get(hObject, 'String');
eq_val(10) = str2num(value);


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
