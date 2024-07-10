% Basic Signals and Signal Graphing

% Define the time range
t = -5:0.01:5;

% Unit Step Signal
u = @(t) (t >= 0);
subplot(3, 2, 1);
plot(t, u(t));
title('Unit Step Signal');
xlabel('Time');
ylabel('Amplitude');

% Rectangular Signal
rect = @(t, T) (u(t + T/2) - u(t - T/2));
subplot(3, 2, 2);
plot(t, rect(t, 2));
title('Rectangular Signal');
xlabel('Time');
ylabel('Amplitude');

% Standard Triangle Signal
tri = @(t, T) (1 - abs(t/T) .* (u(t + T) - u(t - T)));
subplot(3, 2, 3);
plot(t, tri(t, 2));
title('Standard Triangle Signal');
xlabel('Time');
ylabel('Amplitude');

% Sinusoidal Signal
A = 1; % Amplitude
f = 2; % Frequency (Hz)
phi = pi/4; % Phase shift
sinusoidal = A * sin(2 * pi * f * t + phi);
subplot(3, 2, 4);
plot(t, sinusoidal);
title('Sinusoidal Signal');
xlabel('Time');
ylabel('Amplitude');

% Exponential Signal
alpha = 0.5; % Decay constant
exp_signal = exp(alpha * t);
subplot(3, 2, 5);
plot(t, exp_signal);
title('Exponential Signal');
xlabel('Time');
ylabel('Amplitude');
