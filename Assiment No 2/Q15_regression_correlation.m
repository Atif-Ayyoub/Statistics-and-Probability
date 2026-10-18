% Q15 - Simple linear regression, standard error of estimate, correlation (Lecture 15)
% X = study hours per day, Y = exam score of 8 students
clc; clear; close all;
X = [2 3 4 5 6 7 8 9];
Y = [50 55 62 64 70 74 82 85];
n = numel(X);

% Least-squares line Y = a + bX
b = (n*sum(X.*Y) - sum(X)*sum(Y)) / (n*sum(X.^2) - sum(X)^2);
a = mean(Y) - b*mean(X);
fprintf('Regression line: Y = %.3f + %.3f X\n', a, b);

% Correlation coefficient
r = (n*sum(X.*Y) - sum(X)*sum(Y)) / ...
    sqrt((n*sum(X.^2) - sum(X)^2) * (n*sum(Y.^2) - sum(Y)^2));
fprintf('r = %.4f, r^2 = %.4f\n', r, r^2);

% Standard error of estimate
Yhat = a + b*X;
Syx  = sqrt(sum((Y - Yhat).^2) / (n - 2));
fprintf('Standard error of estimate = %.3f\n', Syx);

% Prediction for 6.5 hours
fprintf('Predicted score for 6.5 h = %.2f\n', a + b*6.5);

scatter(X, Y, 'filled'); hold on; plot(X, Yhat, 'r', 'LineWidth', 1.5);
xlabel('Study hours per day'); ylabel('Exam score'); title('Regression of score on study hours');
