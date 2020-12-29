%Calculate the product using the +-* Algebra of two
%probabilistic matrix
function mxmn=fuzzy_ProbSumProd(A,B)
% Calculates max-min product of matrices A and B
for i=1:length(A(:,1))
    for j=1:length(B(1,:));
        mn=[];
        for k=1:length(B(:,1))
            mn(k)=A(i,k)*B(k,j); %Product T-Norm
        end
        mxmn(i,j)=prodCoNorm(mn); %Probabilsitic sum
    end
end
