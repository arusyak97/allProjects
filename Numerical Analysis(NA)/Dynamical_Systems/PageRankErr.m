function rank = PageRankErr(A,v,e)
v1 = v;
err = 10;
while err > e;
    v = A*v;
    err = abs(sum(v1) - sum(v));
    v1 = v;
end
rank = v;
end
