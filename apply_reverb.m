function signal = apply_reverb(signal, impulse_response)
  % signal = 0;
  if size(impulse_response, 2) > 1
    impulse_response = stereo_to_mono(impulse_response);
  endif
  % Convolve the signal with the impulse response
  % Using fftconv from the signal processing toolbox
  signal = fftconv(signal, impulse_response);

  % Normalize the resulting signal
  signal = signal / max(abs(signal));
endfunction

