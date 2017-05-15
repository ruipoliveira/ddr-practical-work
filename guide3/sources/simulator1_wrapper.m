%% runs simulator1 according to the tests
function [result_b, result_o] = simulator1_wrapper(M, C_all, lambda_all, minutes_all, R, runs)
% runs simulator 1 and saves the results
% N: numer of times to run
% *_all: vector of the table to compute results 

result_b = zeros(size(C_all,2), runs);  % vector resultados: o 'blocking prob'
result_o = zeros(size(C_all,2), runs);  % vector resultados: b 'average occupation'

format short;
for it= 1:runs
    for i= 1:size(C_all,2)
        [b, o] = simulator1(lambda_all(i), minutes_all(i), C_all(i), M ,R );
        result_b(i,it) = b*100;
        result_o(i,it) = o;
    end
end

end