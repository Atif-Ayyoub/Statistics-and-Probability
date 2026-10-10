%% Question 6: Stem-and-Leaf Display and Central Tendency
clc; clear; close all;

%% ---- MATLAB WORK ----
x = [12 15 17 18 19 21 21 23 24 24 25 26 27 28 28 29 31 32 34 35 36 38 41 43 47];

fprintf('Mean   = %.2f   (manual: 27.76)\n', mean(x));
fprintf('Median = %g     (manual: 27)\n', median(x));
fprintf('mode() = %g  (returns only the smallest mode)\n', mode(x));
[u,~,j] = unique(x); c = accumarray(j,1);
fprintf('All modes = %s (each appears %d times; manual: 21, 24, 28)\n', num2str(u(c==max(c))), max(c));

% Stem-and-leaf (MATLAB has no built-in): stem = tens digit, leaf = units digit
x = sort(x);
stems = floor(x/10); leaves = mod(x,10);
disp(' ');
disp('Stem-and-leaf display (Key: 2 | 1 = 21 seconds)');
for s = min(stems):max(stems)
    L = leaves(stems == s);
    fprintf('%2d | %s\n', s, sprintf('%d ', L));
end

% Boxplot + histogram
figure;
subplot(1,2,1);
boxplot(x); grid on; ylabel('Execution time (s)'); title('Boxplot of Execution Times');
subplot(1,2,2);
histogram(x, 10:10:50, 'FaceColor', [0.5 0.7 0.5]); grid on;
xlabel('Execution time (s)'); ylabel('Frequency'); title('Histogram of Execution Times');
% Comment: mean (27.76) is slightly above median (27), and the upper whisker/tail
% is a little longer, so the distribution is only mildly right-skewed.