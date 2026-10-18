% Q12 - Chebyshev's inequality, Empirical rule, five-number summary (Lecture 12)
% Commuting time (minutes) of 19 employees
clc; clear;
t = sort([22 25 27 28 30 30 31 32 33 34 35 36 38 40 41 43 45 48 52]);
n = numel(t);
mu = mean(t);  s = std(t);              % sample SD (n-1)
fprintf('Mean = %.2f, SD = %.3f\n', mu, s);

k = 2;
lo = mu - k*s;  hi = mu + k*s;
actual    = 100 * mean(t >= lo & t <= hi);
chebyshev = 100 * (1 - 1/k^2);
fprintf('Within %.2f and %.2f (k=2):\n', lo, hi);
fprintf('  Actual = %.1f%%, Chebyshev bound = %.0f%% (at least), Empirical rule = 95%%\n', ...
        actual, chebyshev);

% Five-number summary
Q1 = quart(t,0.25); Q2 = quart(t,0.5); Q3 = quart(t,0.75);
fprintf('Five-number summary: min=%d  Q1=%.1f  median=%.1f  Q3=%.1f  max=%d\n', ...
        min(t), Q1, Q2, Q3, max(t));

function q = quart(x, p)
    x = sort(x);  pos = (numel(x)+1) * p;
    lo = floor(pos);  fr = pos - lo;
    if lo >= numel(x), q = x(end); else, q = x(lo) + fr*(x(lo+1)-x(lo)); end
end
