function ex3_a(lambda, S, W)
p = 0.4;
invmiu = 90;
Ms = 2;
Mh = 5;
R = 10000;
N = 1000;

runs = 40;
test_count = size(lambda,2);

b_s = zeros(test_count, runs);
b_h = zeros(test_count, runs);

b_s_confidence = zeros(test_count,2);
b_h_confidence = zeros(test_count,2);

for test_nr=1:size(lambda,2)
    for lap=1:runs
        [b_s(test_nr,lap), b_h(test_nr,lap)] = simulator2(lambda(test_nr), p, invmiu, S(test_nr), W(test_nr), Ms, Mh, R, N);
    end
    [b_s_confidence(test_nr,1), b_s_confidence(test_nr,2)] = confidence_level(0.1, b_s(test_nr,:), runs);
    [b_h_confidence(test_nr,1), b_h_confidence(test_nr,2)] = confidence_level(0.1, b_h(test_nr,:), runs);
    
    fprintf('%.6f +- %.6f || %.6f +- %.6f\n', b_s_confidence(test_nr,1)*100, b_s_confidence(test_nr,2)*100, b_h_confidence(test_nr,1)*100, b_h_confidence(test_nr,2)*100);
end

end

lambda = [13 13 13 50 50 50];
S = [1 1 1 3 3 3];
W = [0 60 80 0 180 240];

ex3_a(lambda, S, W)
