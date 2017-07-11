% register
fixed = imread('cameraman.tif');

theta = 20;
S = 2.3;
tform = affine2d([S.*cosd(theta) -S.*sind(theta) 0;
                  S.*sind(theta)  S.*cosd(theta) 0;
                  0               0              1]);
moving = imwarp(fixed, tform);
moving = moving + uint8(10*rand(size(moving)));

imshowpair(fixed, moving, 'montage');