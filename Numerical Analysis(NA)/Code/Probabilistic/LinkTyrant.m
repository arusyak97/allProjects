EdgeTable = table({'X' 'A'; 'X' 'B'; 'X' 'C'; 'X' 'D'; 'A' 'X'; 'B' 'X'; 'C' 'X'; 'D' 'X'; 'D' 'A' ; 'A' 'E'; 'A' 'F'; 'B' 'E'; 'C' 'G'; 'C' 'H'; 'E' 'X'; 'F' 'X'; 'G' 'X'; 'H' 'X';},[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]', ...
    'VariableNames',{'EndNodes','Weight'});
G = digraph(EdgeTable);
plot(G);

d = 0.85;

rankX = 1;

rankA = 1;
rankB = 1;
rankC = 1;
rankD = 1;

rankE = 1;
rankF = 1;
rankG = 1;
rankH = 1;

for k = 1:100
[ rankXnew, rankAnew, rankBnew, rankCnew, rankDnew, rankEnew, rankFnew, rankGnew, rankHnew ] = PageRank (G, d, rankX, rankA, rankB, rankC, rankD, rankE, rankF, rankG, rankH);

rankX = rankXnew;

rankA = rankAnew;
rankB = rankBnew;
rankC = rankCnew;
rankD = rankDnew;

rankE = rankEnew;
rankF = rankFnew;
rankG = rankGnew;
rankH = rankHnew;

end

function [ rankXnew, rankAnew, rankBnew, rankCnew, rankDnew, rankEnew, rankFnew, rankGnew, rankHnew ] = PageRank (G, d, rankX, rankA, rankB, rankC, rankD, rankE, rankF, rankG, rankH)

rankXnew = (1-d) + d*(rankE/1 + rankF/1 + rankG/1 + rankH/1 + rankA/3 + rankB/2 + rankC/3 + rankD/2);

rankAnew = (1-d) + d*(rankX/4 + rankD/2);
rankBnew = (1-d) + d*(rankX/4);
rankCnew = (1-d) + d*(rankX/4);
rankDnew = (1-d) + d*(rankX/4);

rankEnew = (1-d) + d*(rankB/2 + rankA/3);
rankFnew = (1-d) + d*(rankA/3);
rankGnew = (1-d) + d*(rankC/3);
rankHnew = (1-d) + d*(rankC/3);

end

