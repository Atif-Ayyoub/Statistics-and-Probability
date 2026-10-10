%% Question 3: Frequency Distribution of a Discrete Variable
clc; clear; close all;

%% ---- MATLAB WORK ----
defects = [2 4 3 5 2 6 4 3 5 7 4 2 3 6 5 4 3 8 2 5 6 4 3 5 7 4 2 6 5 3];
n = numel(defects);

[vals, ~, idx] = unique(defects);
freq    = accumarray(idx, 1)';            % same as histcounts(defects, [vals max(vals)+1])
relFreq = freq / n;
cumFreq = cumsum(freq);
cumRel  = cumsum(relFreq);

T = table(vals', freq', relFreq', cumFreq', cumRel', ...
    'VariableNames', {'Defects','Frequency','RelFreq','CumFreq','CumRelFreq'});
disp(T);

% Cross-check using histcounts
f2 = histcounts(defects, min(defects)-0.5 : max(defects)+0.5);
fprintf('histcounts agrees with unique/accumarray: %d\n', isequal(f2, freq));

% Mode(s): there can be more than one
modes = vals(freq == max(freq));
fprintf('Mode(s) = %s (each occurs %d times)\n', num2str(modes), max(freq));
fprintf('MATLAB mode() returns only the smallest: %d\n', mode(defects));

% Manual table for comparison
manualFreq = [5 6 6 6 4 2 1];             % defects 2..8
fprintf('Matches manual table: %d\n', isequal(freq, manualFreq));

figure;
bar(vals, freq, 'FaceColor', [0.2 0.6 0.5]); grid on;
xlabel('Number of defects per module'); ylabel('Frequency (number of modules)');
title('Frequency Distribution of Defects (30 Modules)');
for i = 1:numel(vals), text(vals(i), freq(i)+0.15, num2str(freq(i)), 'HorizontalAlignment','center'); end