n = 5;
page1 = [0 0 0 1 1];
page2 = [0 0 1 0 0];
page3 = [1 1 0 1 0];
page4 = [0 1 0 0 1];
page5 = [1 1 1 1 1];

page1=value(page1);
page2=value(page2);
page3=value(page3);
page4=value(page4);
page5=value(page5);

A = [page1 page2 page3 page4 page5];
v = 1/n.*ones(n,1);
v1 = PageRankErr(A,v,1);
v2 = PageRankErr(A,v,0.7);
v3 = PageRankErr(A,v,0.5);
v4 = PageRankErr(A,v,0.3);
v5 = PageRankErr(A,v,0.1);