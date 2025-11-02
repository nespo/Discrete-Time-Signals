% -------------------------------------------------------------
% discrete_signals.m  (fixed sinc + two-sided exponential)
% -------------------------------------------------------------
clear; close all; clc;

outdir = fullfile(pwd,'figures'); if ~exist(outdir,'dir'), mkdir(outdir); end

n_short = -10:10;      % index for basic signals
n_sinc  = -30:30;      % wider window for sinc

%% ----- Basic signals -----

% Unit impulse δ[n]
delta = (n_short == 0);

% Unit step u[n]
u = (n_short >= 0);

% Unit ramp r[n] = n·u[n]
r = n_short .* u;

% *** Two-sided exponential  x[n] = alpha^n  (decays to the right) ***
alpha = 0.85;                  % 0<alpha<1
xexp = alpha .^ n_short;       % no u[n]; defined for all n

% Signum sgn[n]
sgn = zeros(size(n_short)); sgn(n_short>0)=1; sgn(n_short<0)=-1;

% *** Discrete-time sinc: ideal LPF impulse response ***
% h[n] = sin(wc n)/(pi n),  h[0] = wc/pi, choose 0<wc<pi
wc = 0.4*pi;                   % cutoff (adjust if you want narrower/wider main lobe)
sincn = zeros(size(n_sinc));
sincn(n_sinc==0) = wc/pi;      % limit at n=0
ii = (n_sinc~=0);
sincn(ii) = sin(wc*n_sinc(ii))./(pi*n_sinc(ii));

%% ----- Figure 1: five basics -----
figure('Name','Figure 1','Position',[100 100 900 650]);

subplot(3,2,1);
stem(n_short, delta, 'filled'); grid on;
title('Discrete time unit impulse signal');
xlabel('discrete time n ---->'); ylabel('amplitude ---->');

subplot(3,2,2);
stem(n_short, u, 'filled'); grid on;
title('Unit step sequence');
xlabel('discrete time n ---->'); ylabel('amplitude ---->');

subplot(3,2,3);
stem(n_short, r, 'filled'); grid on;
title('Unit ramp sequence');
xlabel('discrete time n ---->'); ylabel('amplitude ---->');

subplot(3,2,4);
stem(n_short, xexp, 'filled'); grid on;
title('discrete time exponential signal  (two-sided)');
xlabel('discrete time n ---->'); ylabel('amplitude ---->');

subplot(3,1,3);
stem(n_short, sgn, 'filled'); grid on;
title('discrete time signum function');
xlabel('discrete time n ---->'); ylabel('amplitude ---->');

saveas(gcf, fullfile(outdir,'figure1_discrete_basics.png'));

%% ----- Figure 2: sinc -----
figure('Name','Figure 2','Position',[100 100 900 650]);
stem(n_sinc, sincn, 'filled'); grid on;
title('discrete time sinc (ideal LPF impulse response)');
xlabel('discrete time n ---->'); ylabel('amplitude ---->');

saveas(gcf, fullfile(outdir,'figure2_sinc.png'));
fprintf('Saved plots to: %s\n', outdir);
