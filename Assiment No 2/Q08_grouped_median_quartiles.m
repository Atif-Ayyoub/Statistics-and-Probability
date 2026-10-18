% Q8 - Median and quantiles for grouped data (Lecture 8)
% Monthly pocket money (Rs) of 50 students
clc; clear;
lower = [1000 2000 3000 4000 5000];     % lower class boundaries
h     = 1000;                           % class width
f     = [5 12 18 10 5];
n     = sum(f);
cf    = cumsum(f);

p = [0.25 0.50 0.75 0.90];
names = {'Q1','Median','Q3','P90'};
for j = 1:numel(p)
    pos = n * p(j);                     % position = n*p
    i   = find(cf >= pos, 1);           % quantile class
    if i == 1, F = 0; else, F = cf(i-1); end
    value = lower(i) + (h / f(i)) * (pos - F);
    fprintf('%-6s = %8.2f  (class %d-%d)\n', names{j}, value, lower(i), lower(i)+h);
end
