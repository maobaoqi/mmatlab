% Tif image's FFT results enhance show.
img = imread('D:\Desktop\10-03-58.000-1.tif');
imgF = fft2(img);

imgM = log(abs(imgF) + 1);
imgM = fftshift(imgM);

figure, imshow(imgM, []);
title('Original FFT');

%imgHM = histeq(imgM);
%figure, imshow(imgHM, []);
%title('Enhance FFT');

meanValue = mean(imgM(:));
if imgM(:) > meanValue
    imgM(:) = 255;
end

figure, imshow(imgM, []);