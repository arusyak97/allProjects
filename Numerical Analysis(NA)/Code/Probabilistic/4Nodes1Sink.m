EdgeTable = table({'A' 'B'; 'A' 'C'; 'B' 'C';'C' 'A';'D' 'C'},[1/2 1/2 1 1 1]', ...
    'VariableNames',{'EndNodes','Weight'});
G = digraph(EdgeTable);
plot(G);

d = 0.85;

rankA = 1;
rankB = 1;
rankC = 1;
rankD = 1;

for k = 1:10
[ rankAnew, rankBnew, rankCnew, rankDnew ] = PageRank (G, d, rankA, rankB, rankC, rankD);

rankA = rankAnew;
rankB = rankBnew;
rankC = rankCnew;
rankD = rankDnew;

end

function [ rankAnew, rankBnew, rankCnew, rankDnew ] = PageRank( G, d, rankA, rankB, rankC, rankD )

rankAnew = (1-d) + d*(rankC/1);
rankBnew = (1-d) + d*(rankA/2);
rankCnew = (1-d) + d*(rankB/1 + rankA/2 + rankD/1);
rankDnew = (1-d) + d*(0);

end

