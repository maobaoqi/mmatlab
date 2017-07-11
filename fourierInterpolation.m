% Enlarge image by fourier interpolation
clear;
close all;
im = imread('cameraman.tif');
imF = fft2(im);

% Assign to a large image's fourier spectrum
factor = 4;
largeImF = zeros(size(imF, 1)*factor, size(imF, 2)*factor);

largeImF(1:128, 1:128) = imF(1:128, 1:128);
largeImF(1:128, end-128:end) = imF(1:128, 128:256);
%largeImF(end-128:end, 1:128) = imF(128:256, 1:128);
%largeImF(end-128:end, end-128:end) = imF(128:256, 128:256);

largeIm = ifft2(largeImF);
figure, imshow(largeIm, []);

%h = fspecial('gaussian');
%largeImg = imfilter(largeIm, h);
%figure, imshow(largeImg, []);