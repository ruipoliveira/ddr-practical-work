% Calculates if the points are connected according to a minimum W distance
% and draws the accordingly line connection.
%
% ConnectedList(N, POS, W)
%
% N:    ??
% POS:  matrix containing points positions
% W:    Minimum distance


function L= ConnectedList(~ ,pos,W)

[lines, ~] = size(pos);
connected = zeros(lines,lines);
connected(:) = W + 1;
draw_x = [];
draw_y = [];

for i=2:lines
    ponto1 = pos(i,:);
    for j=1:i-1
        ponto2 = pos(j,:);
        connected(i,j) = sqrt( (ponto1(1,1)-ponto2(1,1))^2 + (ponto1(1,2)-ponto2(1,2))^2);
        if(connected(i,j) < W)
            %plot([ponto1(1,1) ponto2(1,1)],[ponto1(1,2) ponto2(1,2)])
            draw_x = [ draw_x NaN ponto1(1,1) ponto2(1,1)];
            draw_y = [ draw_y NaN ponto1(1,2) ponto2(1,2)];
        end
    end
end

L=sum(sum(connected < W));

plot(draw_x, draw_y); % plot is slow. do it only once
%refresh(1);
%connected
%draw_x
%draw_y
%waitforbuttonpress
end