function [audio_stft] = my_stft(audio, fs, window_length, overlap, nfft)

    % Initialize output variables
    audio_stft = zeros(nfft/2+1, floor((length(audio)-window_length)/(window_length-overlap)) + 1);

    % Initialize window
    window = hann(window_length);

    % Loop over time segments
    for i = 1:size(audio_stft, 2)
        % Extract current segment
        segment = audio( (i-1)*(window_length-overlap)+1 : i*(window_length-overlap) + overlap );

        % Apply window
        segment = segment .* window;

        % Compute FFT
        segment_fft = fft(segment, nfft);

        % Store the first half of the FFT
        audio_stft(:, i) = segment_fft(1:nfft/2+1);
    end
end
