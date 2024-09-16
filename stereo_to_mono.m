function mono = stereo_to_mono(stereo)
  mono = stereo;


  mono = mean(mono, 2);

  % M = mean(A,dim) returns the mean along dimension dim. For example, if A is a matrix,
  % then mean(A,2) returns a column vector containing the mean of each row.

  % Normalize
  mono = mono / max(abs(mono));
endfunction

