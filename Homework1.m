close all
clc
clearvars

[audio, fs] = audioread('array_recordings.wav');

% Normalise the audio to have equal volumes by dividing by the maximum
% absolute value
audio = audio / max(abs(audio(:)));

theta_range = -90:90;
num_mics = size(audio, 2); %number of mics
d = 45e-2 / (num_mics-1); % distance btw 2 mics
c = 343; % speed of sound in m/s


omega_max = ( pi * c ) / d;
freq_max = min(fs/2, omega_max/(2*pi)); % choose the frequency for which no aliasing is created

% compute STFT for the multichannel audio file
window_length = 1024;
overlap = 512;
nfft = 1024;
[audio_stft, frequencies, times] = multichannel_stft(audio, fs, window_length, overlap, nfft);

% compute pseudo-spectrum
p = compute_pseudospectrum(frequencies, num_mics, d, c, times, audio_stft, theta_range);

% compute DOAs
[~, idx_DOAs] = max(p, [], 1);
DOAs = theta_range(idx_DOAs);

my_plots(DOAs, p, times);

my_videos(DOAs);





