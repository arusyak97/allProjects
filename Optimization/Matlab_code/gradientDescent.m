function [theta] = gradientDescent(x, y, theta, alpha, num_iters)

% Initialize some useful values
m = length(y); % number of training examples
X = [ones(m,1) x]; % Add a column of ones to x

for i = 1:num_iters
    hypothesis = X * theta;
    loss = hypothesis - y;
    gradient = (transpose(X) * loss) / m;
    temp = theta - alpha * gradient;
    theta = [temp(1); temp(2)];
    
end

end
