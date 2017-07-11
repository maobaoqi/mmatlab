% test wiener filter algorithm
imgSrc = zeros(5, 5);
imgSrc(1, 3) = 0.8;
imgSrc(3, 3) = 0.5;

% add nosie
noise_mean = 0;
noise_var = 0.0001;
imgNoise = imnoise(imgSrc, 'gaussian', noise_mean, noise_var);

% applay wiener
psf = (1/9)*[1 1 1; 1 1 1; 1 1 1];
imgWnr = deconvwnr(imgNoise, psf, 0);