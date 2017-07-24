% using gamma correction on fft spectrum
clear;

im = imread('D:\Desktop\10-03-58.000-1.tif');
% im = rgb2gray(im);
im = im2double(im);

% window
rows = size(im, 1);
cols = size(im, 2);

rowsNum = linspace(0, 1, rows);
colsNum = linspace(0, 1, cols);
[N, C] = meshgrid(rowsNum, colsNum);

imWindow = (0.5*(1 - cos(2*pi*(N)))) .* (0.5*(1 - cos(2*pi*(C))));
imWindow = imWindow';

im = im.*imWindow;
figure, imshow(im, []);

% padding
maxLength = max(rows, cols);
index = ceil(log2(maxLength));

deltaR = 2^index - rows;
deltaC = 2^index - cols;

imPadding = padarray(im, [deltaR, deltaC], 'post');

% fft
imMagnitude = log(abs(fft2(imPadding)) + 1e-3);
imMagnitude = fftshift(imMagnitude);

% gamma
% meanValue = mean(imMagnitude(:));
% ratio = meanValue / max(imMagnitude(:));

gamma = 1.2;
imMagnitude = imMagnitude.^gamma;

figure, imshow(imMagnitude, []);