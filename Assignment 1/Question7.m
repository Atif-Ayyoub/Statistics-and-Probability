%% ================= QUESTION 7 =================
disp('=== Q7 ===');
marks   = [78 84 91 76];
weights = [0.30 0.25 0.25 0.20];
simpleMean   = mean(marks)               % 82.25
weightedMean = sum(marks.*weights)/sum(weights)   % 82.35
coding = [62 70 74 74 79 81 85 88 90 95];
med = median(coding)                     % 80
moc = mode(coding)                       % 74
 
figure(7);
bar(marks); grid on
set(gca,'XTickLabel',{'Programming','Statistics','Soft. Eng.','Database'});
xlabel('Course'); ylabel('Marks'); title('Q7: Course marks');
hold on
h1 = yline(simpleMean,'g--','LineWidth',1.5);
h2 = yline(weightedMean,'r-.','LineWidth',1.5);
hold off
legend([h1 h2],{sprintf('Simple mean = %.2f',simpleMean), ...
                sprintf('Weighted mean = %.2f',weightedMean)}, ...
       'Location','southoutside','Orientation','horizontal');
ylim([0 100])
set(findall(gcf,'Type','axes'),'FontSize',12); set(gcf,'Position',[100 100 1100 450]);
exportgraphics(gcf,'Q7_barchart.png','BackgroundColor','white');
 