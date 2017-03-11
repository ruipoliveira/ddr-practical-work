function L= ConnectedList(~ ,pos,W)
% Calculates if the points are connected according to a minimum W distance
% and draws the accordingly line connection.
%
% ConnectedList(N, POS, W)
%
% N:    ??
% POS:  matrix containing points positions
% W:    Minimum distance

[lines, ~] = size(pos);
connected = zeros(lines,lines);
connected(:) = W + 1;
draw_x = [];
draw_y = [];
L = [];

for i=2:lines
    ponto1 = pos(i,:);
    for j=1:i-1
        ponto2 = pos(j,:);
        connected(i,j) = sqrt( (ponto1(1,1)-ponto2(1,1))^2 + (ponto1(1,2)-ponto2(1,2))^2);
        %connected(i,j) = pdist([ponto1; ponto2], 'euclidean');
        if(connected(i,j) < W)
            %plot([ponto1(1,1) ponto2(1,1)],[ponto1(1,2) ponto2(1,2)])
            draw_x = [ draw_x NaN ponto1(1,1) ponto2(1,1)];
            draw_y = [ draw_y NaN ponto1(1,2) ponto2(1,2)];
            L = [ L ;  i j ];
        end
    end
end

plot(draw_x, draw_y); % plot is slow. do it only once

end