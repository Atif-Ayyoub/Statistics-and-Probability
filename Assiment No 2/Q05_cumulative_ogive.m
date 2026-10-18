% Q5 - Cumulative frequency distribution and ogive (Lecture 5)
% Waiting time (minutes) of 40 customers at a bank counter
clc; clear; close all;
edges = [0 5 10 15 20 25];
f     = [6 14 12 5 3];
n     = sum(f);

cf  = cumsum(f);                 % "less than" cumulative frequency
pct = 100 * cf / n;              % cumulative percentage

fprintf('%-12s %-6s %-6s %-8s\n','Class','f','CF','Cum %');
for i = 1:numel(f)
    fprintf('%2d - %2d      %-6d %-6d %-8.1f\n', edges(i), edges(i+1), f(i), cf(i), pct(i));
end

% Ogive: plot upper class boundaries against cumulative frequency
plot([0 edges(2:end)], [0 cf], '-o', 'LineWidth', 1.5); grid on;
xlabel('Waiting time (minutes)'); ylabel('Cumulative frequency');
title('Less-than ogive');

% Customers who waited less than 15 minutes
fprintf('Customers waiting < 15 min: %d (%.1f%%)\n', cf(3), pct(3));
