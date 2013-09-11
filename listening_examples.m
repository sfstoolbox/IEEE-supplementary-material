clear all

% === Toolbox settings ===
conf.xref = [0 -2 0]; % / m
conf.fs = 44100; % / Hz
conf.c = 343; % / m/s
conf.phase = 0; % / rad
conf.usenormalisation = true;
conf.plot.useplot = false;
conf.showprogress = true;
conf.debug = 0;
conf.tmpdir = '';
conf.usebandpass = false;
conf.bandpassflow = 10; % / Hz
conf.bandpassfhigh = 20000; % / Hz
conf.usefracdelay = false; % boolean
conf.fracdelay_method = 'resample';
conf.N = 4096;
conf.driving_functions = 'default';
conf.dimension = '2.5D';
conf.usetapwin = true;
conf.tapwinlen = 0.3;
conf.wfs.usehpre = true;
conf.wfs.hpretype = 'FIR';
conf.wfs.hpreflow = 50; % / Hz
conf.ir.useoriglength = false;
conf.ir.useinterpolation = true;
conf.ir.usehcomp = true; % boolean
conf.ir.hcompfile = 'QU_KEMAR_AKGK601_hcomp.wav';
conf.ir.speechfile = '';
conf.ir.cellofile = '';
conf.ir.castanetsfile = '';
conf.ir.noisefile = '';
conf.ir.pinknoisefile = '';
conf.nfchoa.order = [];


% === secondary sources ===
conf.secondary_sources.geometry = 'circle';
conf.secondary_sources.center = [0 0 0];
conf.secondary_sources.size = 3;
conf.secondary_sources.x0 = [];

% === Audio material ===
sig_noise = wavread('pink_noise.wav');

% === HRTFs ===
irs = read_irs('QU_KEMAR_anechoic_3m.mat',conf);

% === Center positon ===
X = [0 0 0];
phi = pi/2;
xs = [0 2.5 0];
src = 'ps';
ir = ir_point_source(X,phi,xs,irs,conf);
wavwrite(auralize_ir(ir,sig_noise,1,conf),conf.fs,16,'listening_examples/real_source_X0_Y0.wav');
conf.secondary_sources.number = 1000;
conf.wfs.hprefhigh = aliasing_frequency(secondary_source_positions(conf),conf);
ir = ir_wfs(X,phi,xs,src,irs,conf);
wavwrite(auralize_ir(ir,sig_noise,1,conf),conf.fs,16,'listening_examples/WFS_X0_Y0_nls1000.wav');
conf.secondary_sources.number = 56;
conf.wfs.hprefhigh = aliasing_frequency(secondary_source_positions(conf),conf);
wavwrite(auralize_ir(ir_wfs(X,phi,xs,src,irs,conf),sig_noise,1,conf), ...
    conf.fs,16,'listening_examples/WFS_X0_Y0_nls56.wav');
wavwrite(auralize_ir(ir_nfchoa(X,phi,xs,src,irs,conf),sig_noise,1,conf), ...
    conf.fs,16,'listening_examples/NFC-HOA_X0_Y0_nls56.wav');

% === Side position ===
X = [1 0 0];
phi = pi/2;
xs = [0 2.5 0];
src = 'ps';
ir = ir_point_source(X,phi,xs,irs,conf);
wavwrite(auralize_ir(ir,sig_noise,1,conf),conf.fs,16,'listening_examples/real_source_X1_Y0.wav');
conf.secondary_sources.number = 1000;
conf.wfs.hprefhigh = aliasing_frequency(secondary_source_positions(conf),conf);
wavwrite(auralize_ir(ir_wfs(X,phi,xs,src,irs,conf),sig_noise,1,conf), ...
    conf.fs,16,'listening_examples/WFS_X1_Y0_nls1000.wav');
conf.secondary_sources.number = 56;
conf.wfs.hprefhigh = aliasing_frequency(secondary_source_positions(conf),conf);
wavwrite(auralize_ir(ir_wfs(X,phi,xs,src,irs,conf),sig_noise,1,conf), ...
    conf.fs,16,'listening_examples/WFS_X1_Y0_nls56.wav');
wavwrite(auralize_ir(ir_nfchoa(X,phi,xs,src,irs,conf),sig_noise,1,conf), ...
    conf.fs,16,'listening_examples/NFC-HOA_X1_Y0_nls56.wav');

% === Frontal position ===
X = [0 1 0];
phi = pi/2;
xs = [0 2.5 0];
src = 'ps';
ir = ir_point_source(X,phi,xs,irs,conf);
wavwrite(auralize_ir(ir,sig_noise,1,conf),conf.fs,16,'listening_examples/real_source_X0_Y1.wav');
conf.secondary_sources.number = 1000;
conf.wfs.hprefhigh = aliasing_frequency(secondary_source_positions(conf),conf);
wavwrite(auralize_ir(ir_wfs(X,phi,xs,src,irs,conf),sig_noise,1,conf), ...
    conf.fs,16,'listening_examples/WFS_X0_Y1_nls1000.wav');
conf.secondary_sources.number = 56;
conf.wfs.hprefhigh = aliasing_frequency(secondary_source_positions(conf),conf);
wavwrite(auralize_ir(ir_wfs(X,phi,xs,src,irs,conf),sig_noise,1,conf), ...
    conf.fs,16,'listening_examples/WFS_X0_Y1_nls56.wav');
wavwrite(auralize_ir(ir_nfchoa(X,phi,xs,src,irs,conf),sig_noise,1,conf), ...
    conf.fs,16,'listening_examples/NFC-HOA_X0_Y1_nls56.wav');

