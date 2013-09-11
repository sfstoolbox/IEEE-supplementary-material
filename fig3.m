clear all

% Listening area
X = [-2 2]; % / m
Y = [-2 2]; % / m
Z = 0;
% virtual source position
xs = [0 -1.5 0]; % / m
% virtual source type
src = 'ps';
% frequency (for mono-frequent plots)
f = 1000; % / Hz
% time (for impulse response plots)
t = 193; % / samples


% === Toolbox settings ===
conf.resolution = 1000; % / samples
conf.xref = [0 0 0]; % / m
conf.fs = 44100; % / Hz
conf.c = 343; % / m/s
conf.phase = 0; % / rad
conf.usenormalisation = true;
conf.plot.useplot = false;
conf.showprogress = false;
conf.debug = 0;
conf.tmpdir = '';
conf.usebandpass = false;
conf.bandpassflow = 10; % / Hz
conf.bandpassfhigh = 20000; % / Hz
conf.plot.useplot = false; % boolean
conf.plot.mode = 'monitor';
conf.plot.loudspeakers = true; % boolean
conf.plot.realloudspeakers = true; % boolean
conf.plot.lssize = 0.16; % m
conf.plot.size_unit = 'px'; % 'px','cm','inches'
conf.plot.size = [540 404];
conf.plot.resolution = 150; % / dpi
conf.plot.cmd = '';
conf.plot.usefile = 0;
conf.plot.file = '';
conf.plot.usegnuplot = false; % boolean



% get all six loudspeakers
conf.secondary_sources.size = 3; % / m
conf.secondary_sources.center = [0 0 0]; % / m
conf.secondary_sources.geometry = 'circle';
conf.secondary_sources.number = 6;
conf.secondary_sources.x0 = [];
x0 = secondary_source_positions(conf);


% === single speaker at virtual source position ==========================
conf.plot.usedb = false;
conf.plot.caxis = [-1 1];
conf.plot.colormap = blueblack(256);
sound_field_mono(X,Y,Z,[xs 0 1 0 1],'ps',1,f,conf);
conf.plot.usedb = true;
conf.plot.caxis = [-45 0];
conf.plot.colormap = whitered(256);
sound_field_imp(X,Y,Z,[xs 0 1 0 1],'ps',1,t,conf);

% === pairwise amplitude panning  ========================================
conf.plot.usedb = false;
conf.plot.caxis = [-1 1];
conf.plot.colormap = blueblack(256);
sound_field_mono(X,Y,Z,x0(5:6,:),'ps',[1 1],f,conf);
conf.plot.usedb = true;
conf.plot.caxis = [-45 0];
conf.plot.colormap = whitered(256);
sound_field_imp(X,Y,Z,x0(5:6,:),'ps',[1 1],t,conf);

% === second-order ambisonics amplitude panning ==========================
N = 2;
[phi,theta,r] = cart2sph(x0(:,4),x0(:,5),x0(:,6));
Yc = circular_harmonics(N,phi); % secondary sources
Y0 = circular_harmonics(N,pi/2); % virtual source
D = (Yc'*Y0*2*pi/size(x0,1))';
conf.plot.usedb = false;
conf.plot.caxis = [-1 1];
conf.plot.colormap = blueblack(256);
sound_field_mono(X,Y,Z,x0,'ps',D,f,conf);
conf.plot.usedb = true;
conf.plot.caxis = [-45 0];
conf.plot.colormap = whitered(256);
sound_field_imp(X,Y,Z,x0,'ps',D,t,conf);
