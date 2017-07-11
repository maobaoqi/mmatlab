% Calcuate two images mutual information.
test = imread('cameraman.tif');

se1 = translate(strel(1), [10, 10]);
se2 = translate(strel(1), [50, 50]);

img1 = imdilate(test, se1);
img2 = imdilate(test, se2);

m1 = MBQ_Mutual_Information(test, img1);
m2 = MBQ_Mutual_Information(test, img2);

%figure, imshow(img1, []);