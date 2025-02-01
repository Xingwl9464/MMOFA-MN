load('MMF4.mat');

plot(PF1(:, 1), PF1(:, 2), 'y.');
hold on;
plot(PF2(:, 1), PF2(:, 2), 'c.');
plot(PF3(:, 1), PF3(:, 2), 'g.');
plot(PF(:, 1), PF(:, 2), 'k.');
hold off;
xlabel('1^{st} Objective');
ylabel('2^{nd} Objective');