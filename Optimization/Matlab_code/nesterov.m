function [theta] = nesterov_m(x, y, theta, velocity , alpha,gamma, num_iters)

%Initialize some useful values
m = length(y); % number of training examples
n = size(x,2); % number of features
X = [ ones(m,1) x]; % Add a column of ones to x
data = [X, y];

for i = 1:num_iters
%     data = data(randperm(size(data,2)),:); % data can be shuffled
    for j = 1 : m
        % j - example number
        theta = theta - gamma * velocity;
        hypothesis = (data(j,1:2)*theta)*ones(1,n);
        loss = data(j,1:2);
        y_new = data(j,3)*ones(1,n);
        gradient = 1/m * ((hypothesis - y_new).*loss).';
        velocity = gamma * velocity + alpha * gradient; 
        theta = theta - velocity;     
    end
 
end

end


