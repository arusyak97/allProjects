function [theta] = adam(x, y, theta, mom_m, mom_v, alpha, epsilon, beta1, beta2, beta1_exp, beta2_exp, num_iters)

%Initialize some useful values
m = length(y); % number of training examples
n = size(x,2); % number of features
X = [ ones(m,1) x]; % Add a column of ones to x
data = [X, y];

for i = 1:num_iters
%     data = data(randperm(size(data,2)),:); % data can be shuffled
    for j = 1 : m
        % j - example number
        hypothesis = (data(j,1:2)*theta)*ones(1,n);
        loss = data(j,1:2);
        y_new = data(j,3)*ones(1,n);
        gradient = 1/m * ((hypothesis - y_new).*loss).';
        
        mom_m = beta1 * mom_m + (1.0 - beta1) * gradient;
        mom_v = beta2 * mom_v + (1.0 - beta2) * dot(gradient,gradient);
        beta1_exp = beta1_exp * beta1;
        beta2_exp = beta2_exp * beta2;
        theta = theta - alpha * (mom_m / (1.0 - beta1_exp)) / (sqrt(mom_v / (1.0 - beta2_exp)) + epsilon);
        
   
    end
    
end

end


