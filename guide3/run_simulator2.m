clear;
lambda = [13 13 13 50 50 50];
S = [1 1 1 3 3 3];
W = [0 60 80 0 180 240];

%ex3_1(lambda, S, W)
%ex3_2()
ex3_3()

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

for W=1:100
    [b_s(W), b_h(W)] = simulator2(lambda, p, invmiu, S, W, Ms, Mh, R, N);
    fprintf('W %.0f: %.3f || %.3f\n', W, b_s(W), b_h(W))
end

plot(1:100,b_s, 1:100, b_h);

end

function ex3_3()

p = 0.2;        % 20% HD requests
lambda = 1 / (24*7);
lambda = lambda * 17000; % 17000 subscribers
invmiu = 90;
Ms = 2;
Mh = 5;
R = 10000;
N = 1000;

S_limit = 15;
W_limit = 20;

b_s = zeros(W_limit, S_limit);
b_h = zeros(W_limit, S_limit);

for S=1:S_limit
    for W=0:W_limit
        [b_s(W+1,S), b_h(W+1,S)] = simulator2(lambda, p, invmiu, S, W, Ms, Mh, R, N);
        fprintf('W %.0f S %.0f: %.5f || %.5f\n', W, S, b_s(W+1,S), b_h(W+1,S))
    end
end

% compute worse case of the two streams
worse_case = zeros(size(b_s,1), size(b_s,2));

for i=1:size(b_s,1)
    for j=1:size(b_s,2)
        if b_s(i,j) >= b_h(i,j)
            worse_case(i,j) = b_s(i,j);
        else
            worse_case(i,j) = b_h(i,j);
        end
    end
end

surf(1:S_limit, 0:W_limit, worse_case)
xlabel('Nr Servers');
ylabel('W reservation');
zlabel('Worst case');

view(70,27)
grid on

end

