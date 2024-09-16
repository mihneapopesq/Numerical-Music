function x = oscillator(freq, fs, dur, A, D, S, R)
    x = 0;  % Initialize the output signal
    
    N = round(dur * fs);  % Calculate the number of samples
    t = (0:N-1) / fs;  % Generate the time vector
    
    sine_wave = sin(2 * pi * freq * t);  % Generate the sine wave
    
    nA = int64(floor(A * fs));  % Calculate the number of samples for the attack phase
    nD = int64(floor(D * fs));  % Calculate the number of samples for the decay phase
    nR = int64(floor(R * fs));  % Calculate the number of samples for the release phase
    nS = max(0, N - nA - nD - nR);  % Calculate the number of samples for the sustain phase
    
    envA = linspace(0, 1, double(nA));  % Generate the envelope for the attack phase
    envD = linspace(1, S, double(nD));  % Generate the envelope for the decay phase
    envS = S * ones(1, nS);  % Generate the envelope for the sustain phase
    envR = linspace(S, 0, double(nR));  % Generate the envelope for the release phase
    
    envelope = [envA envD envS envR];  % Concatenate the envelopes
    
    % Adjust the length of the envelope to match the number of samples
    if length(envelope) > N
        envelope = envelope(1:N);
    elseif length(envelope) < N
        envelope = [envelope zeros(1, N - length(envelope))];
    end
    
    % Apply the envelope to the sine wave
    x = sine_wave .* envelope;
    x = x(:);  % Convert the output signal to a column vector
end