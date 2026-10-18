% Q10 - Range, quartile deviation and their coefficients (Lecture 10)
% Daily number of customers of a small shop over 11 days
clc; clear;
x = sort([12 15 18 20 22 25 27 30 34 38 45]);

R    = max(x) - min(x);
coefR = (max(x) - min(x)) / (max(x) + min(x));

Q1 = quart(x, 0.25);  Q3 = quart(x, 0.75);
QD    = (Q3 - Q1) / 2;
coefQD = (Q3 - Q1) / (Q3 + Q1);

fprintf('Range = %d, Coefficient of range = %.4f\n', R, coefR);
fprintf('Q1 = %.1f, Q3 = %.1f\n', Q1, Q3);
fprintf('Quartile deviation = %.2f, Coefficient of QD = %.4f\n', QD, coefQD);

function q = quart(x, p)           % position = (n+1)*p  (as taught in lecture)
    x = sort(x);  pos = (numel(x)+1) * p;
    lo = floor(pos);  fr = pos - lo;
    if lo >= numel(x), q = x(end); else, q = x(lo) + fr*(x(lo+1)-x(lo)); end
end
