% Q1 - Types of variables and measurement scales (Lecture 1)
% Survey of one student: classify each variable
clc; clear; close all;

variables = {'Hostel resident (Yes/No)'; 'Number of siblings'; 'Height (cm)'; ...
             'Satisfaction rating (Poor..Excellent)'; 'Temperature of hostel room (deg C)'; ...
             'Weight (kg)'};
type  = {'Qualitative'; 'Quantitative - Discrete'; 'Quantitative - Continuous'; ...
         'Qualitative'; 'Quantitative - Continuous'; 'Quantitative - Continuous'};
scale = {'Nominal'; 'Ratio'; 'Ratio'; 'Ordinal'; 'Interval'; 'Ratio'};

T = table(variables, type, scale);
disp(T);

% Count how many variables fall in each measurement scale
scales = {'Nominal','Ordinal','Interval','Ratio'};
counts = zeros(1,4);
for k = 1:4
    counts(k) = sum(strcmp(scale, scales{k}));
end
bar(counts); set(gca,'XTickLabel',scales);
ylabel('Number of variables'); title('Variables by measurement scale');
