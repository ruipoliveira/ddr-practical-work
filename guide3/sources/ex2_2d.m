
%% alinea 2.2 d)
function ex2_2d(M, ~, ~, ~)

caseJ_lambda = 300;
caseJ_minutes = 95;
caseJ_C = 1000;

R = 100000;
N= 1000;

[b, o] = simulator1_new_wrapper(M, C_all, lambda_all, minutes_all, R, N, 1);

% print results

[b_avg, b_termo] = confidence_level(0.1,b(1,:),N);
[o_avg, o_termo] = confidence_level(0.1,o(1,:),N);
fprintf('Case J = %.2e +- %.2e || ', b_avg, b_termo)
fprintf('%.2e +- %.2e\n',o_avg, o_termo)

end

M = 2;
C_all = [10 10 10 10 100 100 100 100 1000 1000 1000 1000];
lambda_all = [1.0 1.0 1.5 1.5 25 25 30 30 300 300 350 350];
minutes_all = [90 95 90 95 90 95 90 95 90 95 90 95];

ex2_2d(M, C_all, lambda_all, minutes_all);
