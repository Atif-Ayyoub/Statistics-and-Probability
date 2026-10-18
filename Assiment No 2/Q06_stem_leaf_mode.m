% Q6 - Stem-and-leaf display and mode (Lecture 6)
% Marks of 25 students in a quiz
clc; clear;
marks = sort([45 52 58 61 63 63 67 70 71 72 72 72 75 76 78 79 81 83 84 85 88 90 92 95 66]);

stems  = floor(marks / 10);
leaves = mod(marks, 10);

disp('Stem | Leaves');
for s = unique(stems)
    L = leaves(stems == s);
    fprintf(' %d   | %s\n', s, sprintf('%d ', L));
end

% Mode = most frequent value
vals = unique(marks);
cnt  = arrayfun(@(v) sum(marks == v), vals);
[maxcnt, idx] = max(cnt);
fprintf('Mode = %d (occurs %d times)\n', vals(idx), maxcnt);
