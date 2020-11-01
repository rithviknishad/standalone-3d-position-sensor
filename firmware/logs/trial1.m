
% Load the log file generated by SerialPlot.
d = xlsread('test_1.csv');

ylabels = [
    "Acceleration (cm/s^2)"
    "Velocity (cm/s)"
    "Position (cm)"
];

titles = [
    "World Frame of Ref. Acceleration"
    "Estimated velocity"
    "Estimated position"
];

axesLabels = ['Y', 'X'];

font = 'LG Display-Regular';

for i = 1 : 6
    myTitle = strcat(titles(int8(i/2)), {' on '}, axesLabels(mod(i, 2) + 1), ' axis');

    figure(i)
    plot(1 : length(d( : , i)), d( : , i));
    hold on
    plot(1 : length(d( : , i)), d( : , i) * 0);
    legend('Estimated', 'Actual');
    
    grid on

    xlabel  ('Samples', 'FontName', font);
    ylabel  (ylabels(int8(i/2)),  'FontName', font);
    title   (myTitle, 'FontName', font);

    saveas(figure(i), strcat('test1_graphs\', myTitle, '.png'));
end