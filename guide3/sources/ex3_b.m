
function ex3_b()
S = 2;                  % 2 server farms
p = 0.1;                % 10% of requests are HD

subscribers = 8000;
lambda = 1 / (24 * 7);  % 1 request / week. lambda is requests/hour
lambda = lambda * subscribers;

invmiu = 90;
Ms = 2;
Mh = 5;
R = 10000;
N = 1000;       % one month warm up

b_s = zeros(1,100);
b_h = zeros(1,100);

runs = 5;
W_limit = 100;

b_s_confidence = zeros(W_limit,2);
b_h_confidence = zeros(W_limit,2);

for W=1:W_limit
    for lap=1:runs
        [b_s(W,lap), b_h(W,lap)] = simulator2(lambda, p, invmiu, S, W, Ms, Mh, R, N);
    end
    [b_s_confidence(W,1), b_s_confidence(W,2)] = confidence_level(0.1, b_s(W,:), runs);
    [b_h_confidence(W,1), b_h_confidence(W,2)] = confidence_level(0.1, b_h(W,:), runs);
    
    fprintf('W:%.0f : %.6f +- %.6f || %.6f +- %.6f\n', W, b_s_confidence(W,1)*100, b_s_confidence(W,2)*100, b_h_confidence(W,1)*100, b_h_confidence(W,2)*100);
end

plot(1:W_limit,b_s_confidence(:,1), 1:W_limit, b_h_confidence(:,1));

dist = zeros(1,W_limit);
for i=1:W_limit
    dist(i)= abs(b_s_confidence(i,1) - b_h_confidence(i,1));
end

find(dist==min(dist))

end

lambda = [13 13 13 50 50 50];
S = [1 1 1 3 3 3];
W = [0 60 80 0 180 240];

ex3_b()