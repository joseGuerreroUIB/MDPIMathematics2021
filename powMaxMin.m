%Returns the M^n matrix using Max-Min algebra 
function [powMatrix]=powMaxMin(M1,n)
   [f c] = size(M1);
   if f~=c
       error('An square matrix is required!');
   end
   powMatrix = eye(f);
   for i=1:n
       powMatrix=fuzzy_maxmin(powMatrix,M1);
   end
end
