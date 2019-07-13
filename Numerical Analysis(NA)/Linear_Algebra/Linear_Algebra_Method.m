%% LA example
% pagerank vector calculation using power method
n = 5;
i = [1 1 1 1 2 3 3 5];
j = [2 3 4 5 3 2 5 4];
G = sparse(i,j,1,n,n); % creating sparse matrix
spy(G) % visually seeing the distribution

%% PageRank Vector (Linear Homogenous System Solution)
p = 0.8;  %scalar parameter
c = sum(G,1); % column sums
k = find(c~=0);
D = sparse(k,k,1./c(k),n,n);
e = ones(n,1);
I = speye(n,n);
pi = (I - p*G*D)\e;
pi = pi/sum(pi); %pagerank vector

%% Power Method
z = ((1-p)*(c~=0) + (c==0))/n;
A = p*G*D + e*z;
pi = e/n;
oldpi = zeros(n,1);
while norm(pi - oldpi) > .01
oldpi = pi;
pi = A*pi;
end
pi = pi/sum(pi); %pagerank vector