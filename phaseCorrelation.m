% Phase correlation
clear; 
imgRef = zeros(512, 512);
imgRef(:, :) = 1;
imgRef(30, 20) = 10;
imgRef(30, 21) = 10;

imgRef = padarray(imgRef, [512, 512], 'post');

 %figure, imshow(imgRef, []);
 

imgSrc = zeros(512, 512);
imgSrc(:, :) = 1;
imgSrc(300, 20) = 10;
imgSrc(300, 21) = 10;
imgSrc = padarray(imgSrc, [512, 512], 'post');
    
srcFFT = fft2(imgSrc);
refFFT = fft2(imgRef);

imgDst = srcFFT.*conj(refFFT);
imgDst = imgDst./abs(imgDst + 1e-5);

imgDst = ifft2(imgDst);
% imgDst = abs(imgDst);

[peak, idx] = max(imgDst(:));
[row, col] = ind2sub(size(imgDst), idx);

% r1 = abs(row - 512);
% r2 = row;
% 
% if r1 < row / 2
%     r = r1 + 1;
% else
%     r = r2 - 1;
% end

if row > size(imgDst, 1) / 2
    shiftR = row - 512 - 1;
else
    shiftR = row - 1;
end




