% Q2 - Simple random and systematic sampling (Lecture 2)
% A class has N = 60 students (roll numbers 1..60). Select n = 6 students.
clc; clear;
rng(7);                 % fixed seed so the result can be repeated
N = 60;  n = 6;

% (a) Simple random sampling (without replacement)
srs = sort(randperm(N, n));
fprintf('Simple random sample (roll nos): %s\n', mat2str(srs));

% (b) Systematic sampling: k = N/n, random start between 1 and k
k = N / n;                         % sampling interval
start = randi(k);                  % random start
sys = start : k : N;               % every k-th student
fprintf('Sampling interval k = %d, random start = %d\n', k, start);
fprintf('Systematic sample (roll nos):   %s\n', mat2str(sys));
