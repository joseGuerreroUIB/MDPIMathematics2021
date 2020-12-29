
%Transform a fuzzy Matrix to a probabilistic one.
%M1: matrix to transform
%conType: not used. It Would indicate the conversion type: 
%        normalization, centroid, ...
function [probMatrix]=fuzzyMat2Prob(M1, convType) 
  [f c]=size(M1);
  probMatrix=M1;
  if (convType==1)
      for i=1:f
             probMatrix(i,:) = probMatrix(i,:)/sum(probMatrix(i,:));
      end
  else
      
      for i=1:f  
       %Possibility to probability (Duboi's method)
       [SLP,ISLP]= sort(probMatrix(i,:), 'descend');
       SLP = [SLP 0];
       newPos=zeros(1,c);
       for k=1:c
           divisorI=k:c;
           diffSLP = -diff(SLP(k:c+1));
           newPos(ISLP(k)) = sum(diffSLP./divisorI);
       end
       probMatrix(i,:) = newPos;
      end
  end
end
