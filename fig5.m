clear all

% Listening area
X = [-2 2]; % / m
Y = [-2 2]; % / m
Z = 0;
% virtual source position
xs = [0 1 0]; % / m
% virtual source type
src = 'pw';


% === Toolbox settings ===
conf.resolution = 1000; % / samples
conf.xref = [0 0 0]; % / m
conf.fs = 44100; % / Hz
conf.c = 343; % / m/s
conf.N = 1024;
conf.driving_functions = 'default';
conf.dimension = '2.5D';
conf.usetapwin = true;
conf.tapwinlen = 0.3;
conf.phase = 0; % / rad
conf.usenormalisation = true;
conf.plot.useplot = false;
conf.showprogress = false;
conf.debug = 0;
conf.tmpdir = '';
conf.usebandpass = false;
conf.bandpassflow = 10; % / Hz
conf.bandpassfhigh = 20000; % / Hz
conf.usefracdelay = false;
conf.fracdelay_method = 'resample';
conf.nfchoa.order = [];
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
conf.secondary_sources.number = 56;
conf.secondary_sources.x0 = [];


% === single speaker at virtual source position ==========================
conf.plot.usedb = false;
conf.plot.caxis = [-1 1];
conf.plot.colormap = blueblack(256);
sound_field_mono_nfchoa(X,Y,Z,xs,src,1000,conf);
sound_field_mono_nfchoa(X,Y,Z,xs,src,2000,conf);
conf.plot.usedb = true;
conf.plot.caxis = [-45 0];
conf.plot.colormap = whitered(256);
sound_field_imp_nfchoa(X,Y,Z,xs,src,193,conf);
