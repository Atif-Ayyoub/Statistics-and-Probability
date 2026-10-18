% Q14 - Moments, moment ratios, kurtosis and Bowley's skewness (Lecture 14)
% Number of hours of video-game play per week for 10 students
clc; clear;
x = [3 4 5 6 6 7 8 10 13 18];
n = numel(x);  m = mean(x);

m2 = sum((x-m).^2)/n;                 % 2nd moment about mean (= variance)
m3 = sum((x-m).^3)/n;
m4 = sum((x-m).^4)/n;

b1 = m3^2 / m2^3;                     % moment ratio b1
g1 = sqrt(b1) * sign(m3);             % gamma1 (keeps the sign)
b2 = m4 / m2^2;                       % moment ratio b2 (kurtosis)
fprintf('mean=%.2f  m2=%.2f  m3=%.2f  m4=%.2f\n', m, m2, m3, m4);
fprintf('b1=%.4f  g1=%.4f  b2=%.4f\n', b1, g1, b2);
if b2 > 3, disp('Leptokurtic'); elseif b2 < 3, disp('Platykurtic'); else, disp('Mesokurtic'); end

Q1 = quart(x,0.25); Q2 = quart(x,0.5); Q3 = quart(x,0.75);
Bowley = (Q3 + Q1 - 2*Q2) / (Q3 - Q1);
fprintf('Q1=%.2f Q2=%.2f Q3=%.2f  Bowley skewness = %.4f\n', Q1, Q2, Q3, Bowley);

function q = quart(x, p)
    x = sort(x);  pos = (numel(x)+1) * p;
    lo = floor(pos);  fr = pos - lo;
    if lo >= numel(x), q = x(end); else, q = x(lo) + fr*(x(lo+1)-x(lo)); end
end
