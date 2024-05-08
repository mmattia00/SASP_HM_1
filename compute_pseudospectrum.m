function p = compute_pseudospectrum(frequencies, num_mics, d, c, times, audio_stft, theta_range)


p = zeros(length(theta_range), length(frequencies), length(times));
     
    for i_freq = 1:length(frequencies)
        for i_deg = theta_range
            omega_c = 2 * pi * frequencies(i_freq);
            omega_s = omega_c * d* sind(i_deg)/c;
                
            a = zeros(num_mics - 1, 1); % initialize the propagation vector (a column of zeros, one for each mic)
                for i_mics = 1:num_mics
                    a(i_mics, 1) = exp(-1i * (i_mics - 1) * omega_s); % define the propagation vector (determined by the spatial frequency)
                end


            for i_time = 1:length(times)
               
                R_hat = squeeze(audio_stft(i_freq, i_time, :)) * (squeeze(audio_stft(i_freq, i_time, :)))';
                p(i_deg + 91, i_freq, i_time) = (a' * R_hat * a)/num_mics^2; % changing theta range from [-90, 90] to [1, 181] for index problem

            end
        end
    end
    
    p = mean(p, 2); % averaging among the frequencies
    p = squeeze(p); % removing the frequency dimension (we want only time on x-axis and theta on y-axis)
end


        
         
  