
function [audio_stft, frequencies, times] = my_STFT(audio, fs, window_size, overlap, nfft)
%STFT_EXTERNAL External function for STFT with given parameters
%
% This function performs the Short-Time Fourier Transform (STFT) on the input audio signal
% with the specified parameters and returns the STFT, frequencies, and times.
%
% Input:
%   audio - Input audio signal as a 1-D array
%   fs - Sampling frequency of the audio signal
%   window_size - Size of the analysis window
%   overlap - Number of samples to overlap between windows
%   nfft - Number of points in the FFT
%
% Output:
%   channels_stft - The STFT of the input audio signal
%   frequencies - The frequencies corresponding to each column of the STFT
%   times - The times corresponding to each row of the STFT

    % Create a Hann window of the specified size
    window = hann(window_size, 'periodic');

    % Initialize the STFT matrix
    audio_stft = zeros(size(audio, 1) - window_size + 1, nfft / 2 + 1);

    % Initialize the time vector
    times = (0:overlap:size(audio, 1) - window_size) * 1 / fs;

    % Loop through each window and compute the FFT
    for i = 1:size(audio_stft, 1)
        % Get the current window of the audio signal
        window_data = audio(i:i + window_size - 1);

        % Compute the FFT of the current window
        fft_data = abs(fft(window_data, nfft));

        % Store the FFT data in the STFT matrix
        audio_stft(i, :) = fft_data(1:nfft/2+1);
    end

    % Compute the frequencies corresponding to each column of the STFT
    frequencies = (0:nfft/2) * fs / nfft;

end
