clear;
lambda = [13 13 13 50 50 50];
S = [1 1 1 3 3 3];
W = [0 60 80 0 180 240];

ex3_1(lambda, S, W)
ex3_2()

function ex3_1(lambda, S, W)
p = 0.4;
invmiu = 90;
Ms = 2;
Mh = 5;
R = 10000;
N = 1000;

for i=1:size(lambda,2)
    [b_s, b_h] = simulator2(lambda(i), p, invmiu, S(i), W(i), Ms, Mh, R, N);
    fprintf('%.3f || %.3f\n', b_s, b_h)
end

end

function ex3_2()
S = 2;                  % 2 server farms
p = 0.1;                % 10% of requests are HD
lambda = 1 / (24 * 7);  % 1 request / week. lambda is requests/hour
invmiu = 90;
Ms = 2;
Mh = 5;
R = 10000;
N = 1*24*31*8000;       % one month warm up

for W=1:100
    [b_s, b_h] = simulator2(lambda, p, invmiu, S, W, Ms, Mh, R, N);
    fprintf('W %.0f: %.3f || %.3f\n', W, b_s, b_h)
end


end


