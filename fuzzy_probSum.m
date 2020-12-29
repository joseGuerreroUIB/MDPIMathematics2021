
% Calculates probabilistic sum (Tp=x*y Sp=x+y-x*y) of matrices A and B
function probSumR=fuzzy_probSum(A,B)
for i=1:length(A(:,1))
    for j=1:length(B(1,:));
        mn=[];
        for k=1:length(B(:,1))
            mn(k)=A(i,k)*B(k,j);
        end
        probSumR(i,j)=probSumCoNorm(mn);
    end
end
