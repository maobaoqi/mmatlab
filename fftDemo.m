% fft demo
img = zeros(131, 131);
img(:, :) = 11;
imgF = fft2(img, 140, 140);
imgM = log(abs(imgF) + 1);
imgM = fftshift(imgM);

%figure, imshow(imgM, []);

imgSrc = imread('coins.png');
imgSrcF = fft2(imgSrc, 512, 512);
imgSrcM = log(abs(imgSrcF) + 1);
imgSrcM = fftshift(imgSrcM);

figure, imshow(imgSrcM, []);

figure, imshow(imgSrc, []);
proc = imresize(imgSrc, [512 512]);
figure, imshow(proc, []);
pF = fft2(proc, 512, 512);
pM = log(abs(pF) + 1);
pM = fftshift(pM);
figure, imshow(pM, []);