function solution = GreedyRandomizedLoad()

Matrizes;
miu = R*1e9/(8*1000);            % capacidade em bits / pacotes de 1000bytes -> pacotes/sec
NumberLinks = sum(sum(R>0));     % numero total de ligacoes
lambda_s = T*1e6/(8*1000);       % packet arrival rate
gama = sum(sum(lambda_s));       % trafego total na rede (packets/sec)
d = L*1e3/2e8;                   % velocidade propagacao / vel da luz na fibra optica
pairs = [];

% descobrir nos ligados por um path bidirecional
for origin=1:16
    for destination=(origin+1):17
        if T(origin,destination)+T(destination,origin)>0
            pairs = [pairs; origin destination];
        end
    end
end

npairs = size(pairs,1);
b = randperm(npairs);       % random sorted numbers up to npairs
aux = [];

% reorder pairs acording to b
for i = 1: npairs
    aux(i,:) = pairs(b(i), :);
end

pairs = aux;
lambda = zeros(17);
routes = zeros(npairs,17);

% compute the new lambda between the routes between nodes according the shortestpaths
for i=1:npairs
    origin= pairs(i,1);
    destination= pairs(i,2);
    
    Load= lambda./miu;
    r = ShortestPathSym(Load.^2, origin, destination);
    
    routes(i,:) = r;
    
    j= 1;
    % adiciona a carga as routes
    while r(j) ~= destination
        lambda(r(j), r(j+1)) = lambda(r(j), r(j+1)) + lambda_s(origin, destination);
        lambda(r(j+1), r(j)) = lambda(r(j+1), r(j)) + lambda_s(destination, origin);
        j = j + 1;
    end
end


solution = struct('pairs', pairs, 'routes', routes, 'lambda',lambda);

end