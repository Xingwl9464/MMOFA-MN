load('MMF1.mat');

plot(PF1(:, 1), PF1(:, 2), 'y.');
hold on;
plot(PF(:, 1), PF(:, 2), 'k.');
hold off;
xlabel('1^{st} Objective');
ylabel('2^{nd} Objective');