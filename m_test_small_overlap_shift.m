% test two small overlap images shift vector
im = imread('cameraman.tif');

% input simulate shift value sr and sc
sr = 100;
sc = 0;

start_r = 1;
start_c = 1;

im1 = im(start_r:(start_r+128), start_c:(start_c+128));
im1 = padarray(im1, [size(im1, 1), size(im1, 2)], 0, 'post');
figure;
subplot(1, 2, 1);
imshow(im1);
title('image 1');

im2 = im((sr+start_r):(sr+start_r+128), (sc+start_c):(sc+start_c+128));
im2 = padarray(im2, [size(im2, 1), size(im2, 2)], 0, 'post');
subplot(1, 2, 2);
imshow(im2);
title('image 2');

% fft
im1_f = fft2(im1);
im2_f = fft2(im2);
phase_map = im1_f.*conj(im2_f);
phase_map = phase_map ./ (abs(phase_map) + 1e-5);

% ifft
delta = ifft2(phase_map);

% find max
[value, idx] = max(delta(:));

% tanslate position
[r, c] = ind2sub(size(delta), idx);

if r > (size(delta, 1) / 2)
    shift_r = r - size(delta, 1) - 1;
else
    shift_r = r - 1;
end

if c > (size(delta, 2) / 2)
    shift_c = c - size(delta, 2) - 1;
else
    shift_c = c - 1;
end
      