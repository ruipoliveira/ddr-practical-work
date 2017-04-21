clear;
lambda = [13 13 13 50 50 50];
S = [1 1 1 3 3 3];
W = [0 60 80 0 180 240];

for i=1:size(lambda,2)
    p = 0.4;
    invmiu = 90;
    Ms = 2;
    Mh = 5;
    R = 10000;
    N = 1000;
    
    [b_s, b_h]= simulator2(lambda(i), p, invmiu, S(i), W(i), Ms, Mh, R, N)
end