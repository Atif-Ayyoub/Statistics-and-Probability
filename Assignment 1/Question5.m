%% Question 5: Frequency Curves and Data Presentation
clc; clear; close all;

%% ---- MATLAB WORK ----
sc = [42 55 61 67 72 74 81 69 58 63 77 85 91 48 52 66 71 73 79 82 88 93 57 62 68 75 80 84 87 90 ...
    45 50 59 64 70 76 78 83 86 89 94 96 54 60 65 72 74 81 85 92];
n = numel(sc);
edges = 40:10:100;                         % [40,50), ..., [90,100]
freq  = histcounts(sc, edges);
mid   = (edges(1:end-1) + edges(2:end)) / 2;
cumF  = cumsum(freq);
fprintf('n = %d\nFrequencies: %s\nCumulative : %s\n', n, num2str(freq), num2str(cumF));
fprintf('Manual: 3 7 10 12 12 6 / 3 10 20 32 44 50 -> %d\n', isequal(freq,[3 7 10 12 12 6]));

% Histogram
figure;
histogram(sc, edges, 'FaceColor', [0.4 0.6 0.9]); grid on;
xlabel('Test score'); ylabel('Frequency'); title('Histogram of Programming Test Scores');

% Frequency polygon: midpoints vs frequencies, closed with zero-frequency classes at both ends
figure;
xp = [mid(1)-10, mid, mid(end)+10];
yp = [0, freq, 0];
plot(xp, yp, '-o', 'LineWidth', 1.5); grid on;
xlabel('Class midpoint (score)'); ylabel('Frequency'); title('Frequency Polygon of Test Scores');
legend('Frequency polygon');

% Cumulative frequency curve (less-than ogive)
figure;
plot(edges, [0 cumF], '-s', 'LineWidth', 1.5); grid on;
xlabel('Upper class boundary (score)'); ylabel('Cumulative frequency');
title('Cumulative Frequency Curve (Ogive) of Test Scores');
legend('Less-than ogive','Location','southeast');

% Overlay: histogram + polygon for comparison with the manual drawing
figure;
histogram(sc, edges, 'FaceColor', [0.8 0.85 0.95]); hold on;
plot(xp, yp, '-or', 'LineWidth', 1.5); grid on;
xlabel('Test score'); ylabel('Frequency'); title('Histogram with Frequency Polygon');
legend('Histogram','Frequency polygon');