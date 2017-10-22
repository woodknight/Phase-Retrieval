function img = PhaseRetrieval(fourierImg, N)

% make a tukey constrain window
w = tukeywin2(size(fourierImg), round(min(size(fourierImg))/3));

% Hybrid Input-Ouput (HIO)
g = rand(size(fourierImg));
beta0 = 0.5;
beta = beta0;
for i = 1:N
    g2 = g;
    G = fft2(g);
    t = angle(G);
    G = fourierImg .* exp(1j*t);
    g = ifft2(G);   
    
    mask = (abs(imag(g)) > 0.01) | (real(g) < 0);
    beta = beta - beta0/N;
    g(mask) = g(mask) - beta*g2(mask);
    
    g = g .* w;
end

% Error-reduction
for i = 1:300
    G = fft2(g);
    t = angle(G);
    G = fourierImg.*exp(1j*t);
    g = ifft2(G);   
    
    mask = (abs(imag(g)) > 0.01) | (real(g) < 0);    
    g(mask) = 0;
    
    g = g .* w;  
end

img = real(g);

end
