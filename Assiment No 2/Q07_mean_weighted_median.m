% Q7 - Arithmetic mean, weighted mean and median (Lecture 7)
clc; clear;

% (a) Weighted mean: semester GPA (grade points weighted by credit hours)
gp = [4.00 3.67 3.00 3.33 2.67];      % grade points
ch = [3 3 4 2 3];                     % credit hours (weights)
simpleMean = mean(gp);
weighted   = sum(gp .* ch) / sum(ch);
fprintf('Simple mean of grade points = %.3f\n', simpleMean);
fprintf('Weighted mean (GPA)         = %.3f\n', weighted);

% (b) Median of daily expenses (Rs) over 7 days
exp7 = [420 380 510 450 390 610 470];
s = sort(exp7);  n = numel(s);
if mod(n,2) == 1
    med = s((n+1)/2);                 % odd n: middle value
else
    med = (s(n/2) + s(n/2+1)) / 2;    % even n: average of two middle values
end
fprintf('Sorted expenses: %s\n', mat2str(s));
fprintf('Mean = %.2f, Median = %.1f\n', mean(exp7), med);
