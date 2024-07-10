close all;
clear all;

% Define constants
fs = 8000;          % Sampling frequency
fm = 20;            % Message signal frequency
fc = 500;           % Carrier frequency
Am = 1;             % Message amplitude
Ac = 1;             % Carrier amplitude
t = [0:0.1*fs]/fs;  % Time duration

% Message signal
m = Am * cos(2 * pi * fm * t);

% Carrier signal
c = Ac * cos(2 * pi * fc * t);

% Modulation index
ka = 0.5;

% Modulation depth
u = ka * Am;

% AM signals
s1 = Ac * (1 + u * cos(2 * pi * fm * t)) .* cos(2 * pi * fc * t);
subplot(4, 3, 1:3);
plot(t, m);
title('Modulating or Message signal (fm = 20 Hz)');

subplot(4, 3, 4:6);
plot(t, c);
title('Carrier signal (fc = 500 Hz)');

subplot(4, 3, 7);
plot(t, s1);
title('Under Mod signal');

Am = 2;
u = ka * Am;
s2 = Ac * (1 + u * cos(2 * pi * fm * t)) .* cos(2 * pi * fc * t);
subplot(4, 3, 8);
plot(t, s2);
title('Exact Mod signal');

Am = 5;
u = ka * Am;
s3 = Ac * (1 + u * cos(2 * pi * fm * t)) .* cos(2 * pi * fc * t);
subplot(4, 3, 9);
plot(t, s3);
title('Over Mod signal');

% Demodulation
[b, a] = butter(1, 0.01);

r1 = abs(s1); % Rectify the signal
mr1 = filter(b, a, r1); % Apply Butterworth filter
subplot(4, 3, 10);
plot(t, mr1);
title('Demodulated signal (under mod)');

r2 = abs(s2); % Rectify the signal
mr2 = filter(b, a, r2); % Apply Butterworth filter
subplot(4, 3, 11);
plot(t, mr2);
title('Demodulated signal (exact mod)');

r3 = abs(s3); % Rectify the signal
mr3 = filter(b, a, r3); % Apply Butterworth filter
subplot(4, 3, 12);
plot(t, mr3);
title('Demodulated signal (over mod)');
