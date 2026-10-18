% Q11 - Mean deviation, standard deviation, variance and CV (Lecture 11)
% Travel time (minutes) to university on two bus routes over 8 days
clc; clear;
A = [30 32 35 31 33 34 36 29];
B = [20 40 25 45 15 50 30 35];

routes = {A, B};  names = {'Route A','Route B'};
for k = 1:2
    x  = routes{k};
    m  = mean(x);
    MD = mean(abs(x - m));              % mean deviation
    V  = mean((x - m).^2);              % variance (divide by n)
    S  = sqrt(V);                       % standard deviation
    CV = S / m * 100;                   % coefficient of variation (%)
    fprintf('%s: mean=%.2f  MD=%.2f  var=%.2f  SD=%.3f  CV=%.2f%%\n', ...
            names{k}, m, MD, V, S, CV);
end
fprintf('Smaller CV = more consistent route.\n');
