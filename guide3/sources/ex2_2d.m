%% alinea 2.2 d)
function ex2_2d(M, ~, ~, ~)

caseJ_C = 1000;
caseJ_lambda = 300;
caseJ_minutes = 95;

R = 100000;
N= 1000;

[b, o] = simulator1_new_wrapper(M, caseJ_C, caseJ_lambda, caseJ_minutes, R, N, 10);

% print results
[b_avg, b_termo] = confidence_level(0.1,b(1,:),N);
[o_avg, o_termo] = confidence_level(0.1,o(1,:),N);
fprintf('Case J = %.2e +- %.2e || ', b_avg, b_termo)
fprintf('%.2e +- %.2e\n',o_avg, o_termo)

end

M = 2;
ex2_2d(M, ~, ~, ~);
