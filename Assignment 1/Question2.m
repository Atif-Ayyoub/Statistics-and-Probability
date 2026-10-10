%% Question 2: Data Collection and Sampling
clc; clear; close all;
rng(1);                              % reproducible results (change seed for a new sample)

%% ---- MATLAB WORK ----
sections = [60 50 70 60];            % A B C D
N = sum(sections);                   % 240
n = 24;

% Proportional allocation: n_h = n * N_h / N
nh = n * sections / N;
fprintf('Proportional sample sizes (A,B,C,D): %s  (total = %d)\n', num2str(nh), sum(nh));
fprintf('Manual result: 6 5 7 6\n\n');

% 1) Simple random sample of 24 IDs from 1..240
srs = sort(randperm(N, n));
disp('Simple random sample IDs:'); disp(srs);

% 2) Stratified sample: IDs A=1-60, B=61-110, C=111-180, D=181-240
last  = cumsum(sections);
first = [1, last(1:end-1)+1];
names = 'ABCD';
strat = [];
for s = 1:4
    ids = first(s):last(s);
    pick = sort(ids(randperm(numel(ids), nh(s))));
    fprintf('Section %c (IDs %d-%d), select %d: %s\n', names(s), first(s), last(s), nh(s), num2str(pick));
    strat = [strat pick]; %#ok<AGROW>
end
fprintf('Total stratified sample size = %d\n\n', numel(strat));

% 3) Systematic sample: k = N/n = 10, random start in 1..k
k = N/n;
start = randi(k);
sys = start:k:N;
fprintf('Systematic sample (k = %d, start = %d):\n', k, start); disp(sys);