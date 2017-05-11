G= [ 1 2; 1 3; 1 4; 1 5; 1 6; 1 14; 1 15; 2 3; 2 4; 2 5; 2 7; 2 8; 3 4; 3 5; 3 8; 3 9; 3 10; 4 5; 4 10; 4 11; 4 12; 4 13; 5 12; 5 13; 5 14; 6 7; 6 16; 6 17; 6 18; 6 19; 7 19; 7 20; 8 9; 8 21; 8 22; 9 10; 9 22; 9 23; 9 24; 9 25; 10 11; 10 26; 10 27; 11 27; 11 28; 11 29; 11 30; 12 30; 12 31; 12 32; 13 14; 13 33; 13 34; 13 35; 14 15; 14 36; 14 37; 14 38; 15 16; 15 39; 15 40];

% 5 servidores tier 1
n = max(max(G)) - 5; 
N = 40;

% custos
C(6:15) = 8;
C(16:40) = 6;

I = zeros(40,40) -1;

v = length(I); 

for i=6:size(I,2)
    
    I(i,i) = 0;
    
    for a=0:1
        for j=1:size(G,1)
            p1 = I(i,G(j,1));
            p2 = I(i,G(j,2));
            
            if (p1 == a && p2 == -1)
                I(i,G(j,2)) = a+1;
                
            elseif (p1 == -1 && p2 == a)
                I(i,G(j,1)) = a+1;
            end
            
        end
    end
    
end

%% gerar ILP

fid = fopen('ex3.lp','wt');
fprintf(fid,'Minimize\n');
for i=1:N
    fprintf(fid,' + %f x%d',C(i),i);
end
fprintf(fid,'\nSubject To\n');


for j=1:v
    for i=1:N
        fprintf(fid,' + %f y%d,%d',s(i),i,j);
    end
    fprintf(fid,' <= %f\n',c(j));
end
for i=1:N
    for j=1:v
        fprintf(fid,' + y%d,%d',i,j);
    end
    fprintf(fid,' - x%d = 0\n',i);
end

fprintf(fid,'Binary\n');
for i=1:N
    fprintf(fid,' x%d\n',i);
    for j=1:v
        fprintf(fid,' y%d,%d\n',i,j);
    end
end

fprintf(fid,'End\n');
fclose(fid);
