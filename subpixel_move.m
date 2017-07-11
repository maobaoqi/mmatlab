% Subpixel move
f = im2double(imread('cameraman.tif'));

delta_r = -5.48574;
delta_c = -18.73837;
phase = 2;

[nr, nc] = size(f);
Nr = ifftshift((-fix(nr / 2) : ceil(nr / 2) - 1));
Nc = ifftshift((-fix(nc / 2) : ceil(nc / 2) - 1));

[Nc, Nr] = meshgrid(Nc, Nr);
g = ifft2(fft2(f) .* exp(1i*2*pi*(delta_r*Nr/nr + delta_c*Nc/nc))).*exp(-1i*phase);

figure(1);

subplot(1, 2, 1);
imshow(abs(f));
title('Reference image, f(x, y)');

subplot(1, 2, 2);
imshow(abs(g));
title('Shifted image, g(x, y)');