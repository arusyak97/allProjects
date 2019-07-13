EdgeTable = table({'A' 'B'; 'B' 'C'; 'C' 'D'; 'D' 'A'; 'B' 'Z'; 'X' 'A'; 'D' 'X'; 'Z' 'C';},[1 1 1 1 1 1 1 1]', ...
    'VariableNames',{'EndNodes','Weight'});
G = digraph(EdgeTable);
plot(G);

d = 0.85;

rankA = 1;
rankB = 1;
rankC = 1;
rankD = 1;
rankZ = 1;
rankX = 1;

for k = 1:100
[ rankAnew, rankBnew, rankCnew, rankDnew, rankZnew, rankXnew ] = PageRank (G, d, rankA, rankB, rankC, rankD, rankZ, rankX);

rankZ = rankZnew;
rankA = rankAnew;
rankB = rankBnew;
rankC = rankCnew;
rankD = rankDnew;
rankX = rankXnew;

end

function [ rankAnew, rankBnew, rankCnew, rankDnew, rankZnew, rankXnew ] = PageRank( G, d, rankA, rankB, rankC, rankD, rankZ, rankX )

rankZnew = (1-d) + d*(rankB/2);
rankAnew = (1-d) + d*(rankD/2 + rankX/1);
rankBnew = (1-d) + d*(rankA/1);
rankCnew = (1-d) + d*(rankB/2 + rankZ/1);
rankDnew = (1-d) + d*(rankC/1);
rankXnew = (1-d) + d*(rankD/2);

end

