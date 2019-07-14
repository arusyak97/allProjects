%% Initialization
clear ; close all; clc

%% ======================= Part 1: Data Info & Import =======================
% Info
% data is taken for population and profit problem
% x refers to the population size in 10,000s
% y refers to the profit in $10,000s

data = load('ex_data.txt');
x = data(:, 1); 
y = data(:, 2);

%% ======================= Part 2: Plotting =======================
fprintf('Plotting Data ...\n')

% Plot Data
plotData(x, y);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Part 3.1: Gradient descent ===================
fprintf('Running Gradient Descent ...\n')

theta_gradient = zeros(2, 1); % initialize fitting parameters

% Some gradient descent settings
iterations = 1500;
alpha = 0.01;

% compute and display initial cost
m = length(y);
X = [ones(m, 1), data(:,1)];% Add a column of ones to x
computeCost(X, y, theta_gradient)

% run gradient descent
theta_gradient = gradientDescent(x, y, theta_gradient, alpha, iterations);

% print theta to screen
fprintf('Theta found by gradient descent: ');
fprintf('%f %f \n', theta_gradient(1), theta_gradient(2));

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta_gradient, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, 3.5] *theta_gradient;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta_gradient;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============= Part 3.2: Stochastic gradient descent ===================
fprintf('Running Stochastic Gradient Descent ...\n')

theta_stochastic = zeros(2, 1); % initialize fitting parameters

% Some stochastic gradient descent settings
iterations = 1500;
alpha = 0.01;

% compute and display initial cost
m = length(y);
X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
computeCost(X, y, theta_stochastic)

% run stochastic gradient descent
theta_stochastic = stochasticGradientDescent(x, y, theta_stochastic, alpha, iterations);

% print theta to screen
fprintf('Theta found by stochastic gradient descent: ');
fprintf('%f %f \n', theta_stochastic(1), theta_stochastic(2));

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta_stochastic, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, 3.5] *theta_stochastic;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta_stochastic;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000);

fprintf('Program paused. Press enter to continue.\n');
pause;
%% ============= Part 3.3: Nasterov ===================

fprintf('Running Nasterov ...\n')

theta_nesterov = zeros(2, 1); % initialize fitting parameters

% Some nesterov settings
iterations = 1500;
alpha = 0.01;
velocity = zeros(2, 1);
m = length(y);
gamma = 0.9;

% compute and display initial cost
X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
computeCost(X, y, theta_nesterov)

% run nesterov gradient descent
theta_nesterov = nesterov(x, y, theta_nesterov, velocity , alpha, gamma, iterations);

% print theta to screen
fprintf('Theta found by nesterov: ');
fprintf('%f %f \n', theta_nesterov(1), theta_nesterov(2));

% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, 3.5] *theta_nesterov;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta_nesterov;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============= Part 3.4: Adagrad ===================

fprintf('Running Adagrad ...\n')

theta_adagrad = zeros(2, 1); % initialize fitting parameters

% Some stochastic gradient descent settings
iterations = 1500;
alpha = 0.01;

% compute and display initial cost
m = length(y);
X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
computeCost(X, y, theta_adagrad)
grad_sum_square = 0;
epsilon = 0.0000001;

% run stochastic gradient descent
theta_adagrad = adagrad(x, y, theta_adagrad, grad_sum_square , alpha, epsilon, iterations);

% print theta to screen
fprintf('Theta found by adagrad: ');
fprintf('%f %f \n', theta_adagrad(1), theta_adagrad(2));

% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, 3.5] *theta_adagrad;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta_adagrad;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============= Part 3.5: RMSprop ===================
fprintf('Running RMS_prop ...\n')

theta_RMS_prop = zeros(2, 1); % initialize fitting parameters

% Some RMS_prop settings
iterations = 1500;
alpha = 0.001;

% compute and display initial cost
m = length(y);
X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
computeCost(X, y, theta_RMS_prop);
gamma = 0.9;
grad_expect = 0;
epsilon = 0.00000001;
% run stochastic gradient descent
theta_RMS_prop = rms_prop(x, y, theta_RMS_prop, grad_expect, alpha, gamma, epsilon, iterations);

% print theta to screen
fprintf('Theta found by RMSprop: ');
fprintf('%f %f \n', theta_RMS_prop(1), theta_RMS_prop(2));

% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, 3.5] *theta_RMS_prop;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta_RMS_prop;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============= Part 3.6: Adam ===================
fprintf('Running RMS_prop ...\n')

theta_adam = zeros(2, 1); % initialize fitting parameters

% Some Adam settings
iterations = 1500;
alpha = 0.001;

% compute and display initial cost
m = length(y);
X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
computeCost(X, y, theta_adam);
mom_m = 0;
mom_v = 0;
epsilon = 0.00000001;
beta1 = 0.9;
beta2 = 0.999;
beta1_exp = 1.0;
beta2_exp = 1.0;
% run Adam
theta_adam = adam(x, y, theta_adam, mom_m, mom_v, alpha, epsilon, beta1, beta2, beta1_exp, beta2_exp, iterations);

% print theta to screen
fprintf('Theta found by Adam: ');
fprintf('%f %f \n', theta_adam(1), theta_adam(2));

% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, 3.5] *theta_adam;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta_adam;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============= Part 4: Preperation for Visualizing J(theta_0, theta_1) =============

% Grid over which we will calculate J
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);

% initialize J_vals to a matrix of 0's
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];    
	  J_vals(i,j) = computeCost(X, y, t);
    end
end

% Because of the way meshgrids work in the surf command, we need to 
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';

%% Surface plot
fprintf('Visualizing J(theta_0, theta_1) ...\n')

figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

%% Contour plot
fprintf('Visualizing J(theta_0, theta_1) ...\n')

figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;

% plot(theta_gradient(1), theta_gradient(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
% title('Gradient Descent');

% plot(theta_stochastic(1), theta_stochastic(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
% title('Stochastic Gradient Descent');

% plot(theta_nesterov(1), theta_nesterov(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
% title('Nesterov');

% plot(theta_adagrad(1), theta_adagrad(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
% title('Adagrad');

% plot(theta_RMS_prop(1), theta_RMS_prop(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
% title('RMSprop');

% plot(theta_adam(1), theta_adam(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
% title('Adam');

x = [theta_gradient(1) theta_stochastic(1) theta_nesterov(1) theta_adagrad(1) theta_RMS_prop(1) theta_adam(1)];
y = [theta_gradient(2) theta_stochastic(2) theta_nesterov(2) theta_adagrad(2) theta_RMS_prop(2) theta_adam(2)];
colors = ['r', 'g','r', 'g','r', 'g'];
for i=1:6
    scatter(x(i), y(i),'LineWidth',10,'MarkerFaceColor',colors(i));
end
title('All methods together');
% GD - dark_blue, SGD - red, nasterov - orange,
% adagrad - pink, rmsprop - green, adam - light_blue