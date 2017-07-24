true_w = [-2; 3];
Nsizes = [20:20:1000];

for j = 1:length(Nsizes)
    N = Nsizes(j);
    N_data = 10000;
    x = rand(N, 1);
    X = [x.^0 x.^1];
    noisevar = 0.5^2;
    for i = 1:N_data
        t = X*true_w + randn(N, 1)*sqrt(noisevar);
        w = (X'*X)\X'*t;
        ss = (1/N)*(t'*t - t'*X*w);
        all_ss(j, i) = ss;
    end
end

figure(1), hold off
plot(Nsizes, mean(all_ss, 2), 'ko', 'markersize', 10, 'linewidth', 2);
hold on
plot(Nsizes,noisevar*(1-2./Nsizes),'r','linewidth',2);
legend('Empirical','Theoretical','location','Southeast');
xlabel('Dataset size');
ylabel('Variance');