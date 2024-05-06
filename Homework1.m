close all
clc
clear vars

[audio, fs] = audioread('array_recordings.wav');

% Normalizza l'audio per avere i volumi uguali dividendo per il massimo
% valore assoluto
audio = audio / max(abs(audio(:)));

theta_range = -90:90;
num_mics = size(audio, 2); %number of mics
d = 45e-2 / (num_mics-1); % distance btw 2 mics
c = 343; % speed of sound in m/s


omega_max = ( pi * c ) / d;
freq_max = min(fs/2, omega_max/(2*pi)); %scelgo la frequenza per cui non si crea aliasing

% block for STFT
window_length = 1024;
overlap = 512;
nfft = 1024;
%[audio_stft, frequencies, times] = my_STFT(audio, fs, window_length, overlap, nfft);

[audio_stft, frequencies, times] = stft(audio, fs, Window= hann(window_length),OverlapLength= overlap, FFTLength=nfft,FrequencyRange="onesided");


audio_length = size(audio, 1);
p = compute_pseudospectrum(frequencies, num_mics, d, c, int64(times), audio_stft, theta_range);

plots = my_plots(p);

% compute DOAs
[~, idx_DOAs] = max(p, [], 1);

DOAs = theta_range(idx_DOAs);

video = my_videos();




