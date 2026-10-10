%% Question 1: Variables, Measurement Scales and Measurement Error
clc; clear; close all;

%% ---- MATLAB WORK ----
% NOTE: the assignment gives no raw data for the 12 projects, so the values
% below are ILLUSTRATIVE sample data. Replace them with your own if needed.
ProjectID  = (1:12)';
Language   = categorical({'Python';'Java';'C++';'Python';'Java';'Python';'C++';'Java';'Python';'C++';'Java';'Python'});
Developers = [5 8 12 4 9 6 15 7 5 10 8 6]';
Type       = categorical({'web';'mobile';'desktop';'web';'mobile';'web';'desktop';'mobile';'web';'desktop';'mobile';'web'});
DevTime    = [5.1 6.2 9.5 4.0 7.3 5.0 11.2 6.8 4.9 8.7 7.0 5.3]';   % months
Defects    = [14 22 35 9 25 12 41 20 11 30 23 15]';
Satisfaction = [8 7 6 9 7 8 5 7 9 6 7 8]';                          % 1-10
T = table(ProjectID, Language, Developers, Type, DevTime, Defects, Satisfaction);
disp('Project data table:'); disp(T);

% Measurement error for development-time observations
obs      = [5.1 5.0 5.3 4.9 5.2];
trueVal  = 5.0;
err      = obs - trueVal;          % signed error = observed - true
absErr   = abs(err);
MAE      = mean(absErr);
fprintf('\nObserved   : %s\n', num2str(obs));
fprintf('Error      : %s\n', num2str(err));
fprintf('|Error|    : %s\n', num2str(absErr));
fprintf('Mean absolute measurement error = %.2f months\n', MAE);
fprintf('Manual result: 0.14 months -> %s\n', ternary(abs(MAE-0.14)<1e-10,'AGREES','DISAGREES'));

% Plot: histogram of development time (continuous ratio-scale variable)
figure;
histogram(T.DevTime, 'BinWidth', 1, 'FaceColor', [0.2 0.5 0.8]);
xlabel('Development time (months)'); ylabel('Number of projects');
title('Histogram of Development Time (12 Projects)'); grid on;
% Why suitable: development time is continuous and quantitative, and a
% histogram shows its shape, centre and spread by grouping values into
% intervals (a bar chart would be for categories).

function out = ternary(c,a,b)
if c, out = a; else, out = b; end
end