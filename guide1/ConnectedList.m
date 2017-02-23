function L= ConnectedList(N,pos,W)

  [lines, cols] = size(pos); 
  connected = zeros(lines,lines); 
   
  for i=2:lines
    ponto1 = pos(i,:);
    for j=1:i-1
      ponto2 = pos(j,:);
      connected(i,j) = sqrt( (ponto1(1,1)-ponto2(1,1))^2 + (ponto1(1,2)-ponto2(1,2))^2);
      if(connected(i,j) < W)
        plot([ponto1(1,1) ponto2(1,1)],[ponto1(1,2) ponto2(1,2)])
      end
    end
  end
  
  L=sum(connected);  
  
end