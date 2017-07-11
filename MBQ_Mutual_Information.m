% Function: Mutual_Information.m
function mi = MBQ_Mutual_Information(a, b)

% Caculate mutual information of a and b in the region of the overlap part.

% Caculate the overlap.
[Ma, Na] = size(a);
[Mb, Nb] = size(b);

M = min(Ma, Mb);
N = min(Na, Nb);

% Initialize histogram array.
hab = zeros(256, 256);
ha = zeros(1, 256);
hb = zeros(1, 256);

% Normalize
imax = max(a(:));
imin = min(a(:));
if imax ~= imin
    a = double(a - imin) / double(imax - imin);
else
    a = zeros(M, N);
end

imax = max(b(:));
imin = min(b(:));
if imax ~= imin
    b = double(b - imin) / double(imax - imin);
else
    b = zeros(M, N);
end

a = int16(a * 255) + 1;
b = int16(b * 255) + 1;

% Histogram
for i = 1:M
    for j = 1:N
        index_x = a(i, j);
        index_y = b(i, j);
        hab(index_x, index_y) = hab(index_x, index_y) + 1;
        ha(index_x) = ha(index_x) + 1;
        hb(index_y) = hb(index_y) + 1;
    end
end

% Calcuate mutual information entropy.
hsum = sum(hab(:));
index = find(hab ~= 0);
p = hab / hsum;
Hab = sum(-p(index).*log(p(index)));

% Calcuate a information entropy.
hsum = sum(ha(:));
index = find(ha ~= 0);
p = ha / hsum;
Ha = sum(-p(index).*log(p(index)));

% Calcuate b information entropy.
hsum = sum(hb(:));
index = find(hb ~= 0);
p = hb / hsum;
Hb = sum(-p(index).*log(p(index)));

% The formula for mutual information entropy.
mi = Ha + Hb - Hab;
end