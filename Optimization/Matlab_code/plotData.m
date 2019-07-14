function plotData(x, y)

figure; % open a new figure window
plot(x, y, 'rx', 'MarkerSize', 10);
axis([4 24 -5 25]);
xlabel("Population of City in 10,000s"); % setting the x label as population
ylabel("Profit in $10,000s");            % setting the y label

end
