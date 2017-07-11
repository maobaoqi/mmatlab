% gray image fourier transform.

img = zeros(1024, 1024);
img(:, :) = 0.5;
figure, imshow(img, []);

imgF = fft2(img);
imgM = log(abs(imgF) + 1);
imgM = fftshift(imgM);
figure, imshow(imgM, []);
title('Result');