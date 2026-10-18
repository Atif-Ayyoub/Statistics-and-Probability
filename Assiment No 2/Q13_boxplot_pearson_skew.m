% Q13 - Box-and-whisker plot and Pearson's coefficient of skewness (Lecture 13)
% Monthly mobile data usage (GB) of 15 users
clc; clear; close all;
d = sort([2 3 3 4 5 5 5 6 7 8 9 10 12 14 30]);

Q1 = quart(d,0.25); Md = quart(d,0.5); Q3 = quart(d,0.75);
IQR = Q3 - Q1;
lowFence = Q1 - 1.5*IQR;  upFence = Q3 + 1.5*IQR;
outliers = d(d < lowFence | d > upFence);
fprintf('Q1=%.1f Median=%.1f Q3=%.1f IQR=%.1f\n', Q1, Md, Q3, IQR);
fprintf('Fences: %.1f to %.1f   Outliers: %s\n', lowFence, upFence, mat2str(outliers));

% Pearson's coefficients
m = mean(d);  s = std(d);  mo = mode(d);
Sk1 = (m - mo) / s;
Sk2 = 3 * (m - Md) / s;
fprintf('Mean=%.2f SD=%.3f Mode=%d\n', m, s, mo);
fprintf('Pearson Sk1 = %.3f, Sk2 = %.3f (positively skewed)\n', Sk1, Sk2);

% Box plot drawn by hand (no toolbox needed)
inside = d(d >= lowFence & d <= upFence);
figure; hold on;
rectangle('Position',[Q1 0.8 IQR 0.4]);          % box
plot([Md Md],[0.8 1.2],'r','LineWidth',2);       % median line
plot([min(inside) Q1],[1 1],'k'); plot([Q3 max(inside)],[1 1],'k');   % whiskers
plot(outliers, ones(size(outliers)), 'ro');      % outliers
ylim([0 2]); yticks([]); xlabel('Data usage (GB)'); title('Box-and-whisker plot');

function q = quart(x, p)
    x = sort(x);  pos = (numel(x)+1) * p;
    lo = floor(pos);  fr = pos - lo;
    if lo >= numel(x), q = x(end); else, q = x(lo) + fr*(x(lo+1)-x(lo)); end
end
