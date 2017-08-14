% Subpixel move
f = im2double(imread('cameraman.tif'));

delta_r = -5.48574;
delta_c = -18.73837;
phase = 2;

[nr, nc] = size(f);
Nr = ifftshift((-fix(nr / 2) : ceil(nr / 2) - 1));
Nc = ifftshift((-fix(nc / 2) : ceil(nc / 2) - 1));

[Nc, Nr] = meshgrid(Nc, Nr);
%g = ifft2(fft2(f) .* exp(1i*2*pi*(delta_r*Nr/nr + delta_c*Nc/nc))).*exp(-1i*phase);
g = ifft2(fft2(f) .* exp(1i*2*pi*(delta_r*Nr/nr + delta_c*Nc/nc)));

figure(1);

subplot(1, 2, 1);
imshow(abs(f));
title('Reference image, f(x, y)');

subplot(1, 2, 2);
imshow(abs(g));
title('Shifted image, g(x, y)');

% find move vector
fFFT = fft2(f);
%fMag = log(abs(fFFT) + 1e-3);

gFFT = fft2(g);
%gMag = log(abs(gFFT) + 1e-3);

ccFFT = (fFFT .* conj(g)) / (abs(fFFT .* conj(g)) + 1e-4);

cc = ifft2(ccFFT);

[peak, idx] = max(cc(:));
[row, col] = ind2sub(size(cc), idx);

if row > size(cc, 1) / 2
    shiftR = row - 256 - 1;
else
    shiftR = row - 1;
end


