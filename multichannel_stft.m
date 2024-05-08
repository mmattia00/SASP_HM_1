function [audio_multichannel_stft, frequencies, times] = multichannel_stft(audio_multichannel, fs, window_length, overlap, nfft)
    
    num_channels = size(audio_multichannel, 2);
    
    % Initialize output variables
    frequencies = 0:fs/nfft:fs/2;
    times = (0:(window_length-overlap):size(audio_multichannel, 1)-window_length)' / fs;
    audio_multichannel_stft = zeros(length(frequencies), length(times), num_channels);

    for i = 1:num_channels
        audio_singlechannel = (audio_multichannel(:, i));
        % using the stft function implemented by us
        [audio_singlechannel_stft] = my_STFT(audio_singlechannel, fs, window_length, overlap, nfft);
        audio_multichannel_stft(:, :, i) = audio_singlechannel_stft;
    end
end