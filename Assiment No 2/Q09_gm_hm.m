% Q9 - Geometric mean and harmonic mean (Lecture 9)
clc; clear;

% (a) GM: average growth of an online shop's followers over 4 years
factor = [1.20 1.10 1.25 1.08];         % growth factors (20%, 10%, 25%, 8%)
GM = prod(factor)^(1/numel(factor));
AM = mean(factor);
HM = numel(factor) / sum(1 ./ factor);
fprintf('GM = %.4f -> average growth = %.2f%% per year\n', GM, (GM-1)*100);
fprintf('AM = %.4f, GM = %.4f, HM = %.4f\n', AM, GM, HM);
fprintf('AM >= GM >= HM ? %d\n', AM >= GM && GM >= HM);

% (b) HM: same distance to university at 40 km/h and 60 km/h
speeds = [40 60];
avgSpeed = numel(speeds) / sum(1 ./ speeds);
fprintf('Average speed for the round trip = %.1f km/h\n', avgSpeed);
