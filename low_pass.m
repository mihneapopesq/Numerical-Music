function filtered_signal = low_pass(signal, fs, cutoff_freq)
    % Compute the Fourier Transform of the signal
    signal_fft = fft(signal);

    % Compute all possible frequencies of the signal
    signal_length = length(signal);
    frequencies = (0:signal_length-1) * (fs / signal_length);

    % Create a vector mask for frequencies lower than the cutoff frequency
    mask = frequencies <= cutoff_freq;

    % Apply the Hadamard product between the Fourier Transform and the mask
    filtered_fft = signal_fft .* mask';

    % Compute the inverse Fourier Transform to get the filtered signal
    filtered_signal = ifft(filtered_fft);

    % Normalize the filtered signal
    filtered_signal = filtered_signal / max(abs(filtered_signal));
end