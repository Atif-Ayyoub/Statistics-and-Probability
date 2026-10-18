% Q3 - Frequency distribution of a discrete variable (Lecture 3)
% Number of library visits in a week by 30 students
clc; clear; close all;
visits = [2 3 1 4 2 3 0 5 2 3 1 2 4 3 2 1 3 2 0 4 2 3 5 1 2 3 2 4 1 3];

x = unique(visits);                 % distinct values
f = zeros(size(x));
for i = 1:numel(x)
    f(i) = sum(visits == x(i));     % tally
end
rf  = f / sum(f);                   % relative frequency
pct = 100 * rf;                     % percentage

T = table(x', f', rf', pct', 'VariableNames', ...
          {'Visits','Frequency','RelFreq','Percent'});
disp(T);
fprintf('Total = %d students\n', sum(f));

bar(x, f); xlabel('Library visits per week'); ylabel('Number of students');
title('Frequency distribution (discrete variable)');
