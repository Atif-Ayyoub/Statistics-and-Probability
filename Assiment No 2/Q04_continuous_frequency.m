% Q4 - Frequency distribution of a continuous variable (Lecture 4)
% Monthly electricity bills (hundreds of Rs) of 30 households
clc; clear; close all;
bill = [42 55 38 61 47 52 69 44 58 36 50 63 48 57 41 ...
        66 53 45 59 39 51 62 46 54 40 68 49 56 43 60];

edges = 36:6:72;                       % class limits 36-42, 42-48, ...
nc = numel(edges) - 1;
f = zeros(1, nc);  mid = zeros(1, nc);
for i = 1:nc
    f(i)   = sum(bill >= edges(i) & bill < edges(i+1));
    mid(i) = (edges(i) + edges(i+1)) / 2;
end

fprintf('Range = %d - %d = %d\n', max(bill), min(bill), max(bill)-min(bill));
fprintf('%-10s %-8s %-10s\n', 'Class', 'Mid', 'Freq');
for i = 1:nc
    fprintf('%2d - %2d    %-8.1f %-10d\n', edges(i), edges(i+1), mid(i), f(i));
end
fprintf('Total frequency = %d\n', sum(f));

histogram(bill, edges); xlabel('Bill (hundreds of Rs)'); ylabel('Households');
title('Histogram of electricity bills');
