clear;
clc;

% Define parameters
A = 2;      % Amplitude of the rectangular pulse
tau = 4;    % Duration of the rectangular pulse in seconds
t_step = 0.001; % Time step in seconds
t_range = -10:t_step:10; % Time range from -10 to 10 seconds

% 1. Generating rectangular pulse in the time domain
rect_pulse = A * ((abs(t_range) < tau/2)); 

% 2. Transforming the signal from the time domain into the frequency domain
N = length(t_range); % Number of points in the signal
f_signal = fft(rect_pulse, N); % Compute the FFT of the signal
f_signal = fftshift(f_signal); % Shift the zero frequency component to the center
f_range = (-N/2:N/2-1)*(1/(t_step*N)); % Frequency range

% 3. Plot the signal in the time domain
figure;
subplot(2,1,1);
plot(t_range, rect_pulse);
title('Rectangular Pulse in Time Domain');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot the magnitude of the signal in the frequency domain 
subplot(2,1,2);
plot(f_range, abs(f_signal)/N); % Normalized magnitude
title('Rectangular Pulse in Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;
