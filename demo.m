%% calculate the amplitude of the Fourier transform.
img = imread('data/x.tif');
figure, imshow(img,[]);
title('Sample image');

fourierImg = abs(fftshift(fft2(ifftshift(img))));
figure, imshow(fourierImg,[]);
title('Fourier transform image');

%% Reconstruct the image using phase retrieval
if gpuDeviceCount % use GPU if available
    fourierImg = gpuArray(fourierImg);
end

reconImg = PhaseRetrieval(fourierImg, 800);
figure, imshow(reconImg, []);
title('Reconstructed image');

