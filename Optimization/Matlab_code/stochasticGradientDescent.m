function [theta] = stochasticGradientDescent(x, y, theta, alpha, num_iters)

%Initialize some useful values
m = length(y); % number of training examples
n = size(x,2); % number of features
X = [ ones(m,1) x]; % Add a column of ones to x
data = [X, y];

for i = 1:num_iters
%     data = data(randperm(size(data,2)),:); % data can be shuffled;
    for j = 1 : m
        % j - example number
        hypothesis = (data(j,1:2)*theta)*ones(1,n);
        loss = data(j,1:2);
        y_new = data(j,3)*ones(1,n);
        gradient = 1/m * ((hypothesis - y_new).*loss).';
        theta = theta - alpha * gradient;      
    end
    
end

end


