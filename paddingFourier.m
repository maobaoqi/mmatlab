% Padding zeros into image and then fourier transform
% Different padding pattern about fft2.

img = zeros(200, 200);
%figure, imshow(img);

srcFFT = fft2(img);
srcM = log(abs(srcFFT) + 1);
srcM = fftshift(srcM);
figure, imshow(srcM, []);
title('source image spectrum')

[imgH, imgW] = size(img);

xOffsetPoint = (512 - 200) / 2;
yOffsetPoint = (512 - 200) / 2;

hPaddingLength = 512 - 200;
wPaddingLength = 512 - 200;

paddingImg = padarray(img, [256 256]);

%figure, imshow(paddingImg);

fftPaddingImg = fft2(paddingImg);
fftPM = log(abs(fftPaddingImg) + 1);
fftPM = fftshift(fftPM);

figure, imshow(fftPM, []);
title('around padding image spectrum');

paddingImg2 = padarray(img, [hPaddingLength, wPaddingLength], 'post');
%figure, imshow(paddingImg2);
pmFM = fft2(paddingImg2, 758, 812);
pmFM = log(abs(pmFM) + 1);
pmFM = fftshift(pmFM);

figure, imshow(pmFM, []);
title('post padding image spectrum');