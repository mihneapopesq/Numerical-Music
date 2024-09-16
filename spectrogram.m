function [S f t] = spectrogram(signal, fs, window_size)
  % Initialize variables
  S = 0; % Spectrogram matrix
  f = 0; % Frequency vector
  t = 0; % Time vector
  
  % Calculate the length of the signal
  len = length(signal);
  
  % Calculate the number of windows
  num_windows = floor(len / window_size);
  
  % Initialize the spectrogram matrix, frequency vector, and time vector
  S = zeros(window_size, num_windows);
  f = zeros(window_size, 1);
  t = zeros(num_windows, 1);
  
  % Compute the spectrogram
  for i = 1:num_windows
    % Calculate the start and end indices of the current window
    start_sec = (i - 1) * window_size + 1;
    final_sec = start_sec + window_size - 1;
    
    % Extract the current window from the signal
    window = signal(start_sec:final_sec);
    
    % Apply the Hanning window to the current window
    window2 = window .* hanning(window_size);
    
    % Compute the FFT of the window
    window3 = fft(window2, window_size * 2);
    
    % Keep only the first half of the FFT (positive frequencies)
    window3 = window3(1:window_size);
    
    % Compute the magnitude of the FFT and store it in the spectrogram matrix
    S(:, i) = abs(window3);
  endfor
  
  % Compute the frequency vector
  for i = 1:window_size
    f(i) = (i - 1) * (fs / (2 * window_size));
  endfor
  
  % Compute the time vector
  for i = 1:num_windows
    t(i) = (i - 1) * (window_size / fs);
  endfor
endfunction
