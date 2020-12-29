% Calculates max-multiplication product of matrices A and B
function mxmn=fuzzy_maxProd(A,B)
for i=1:length(A(:,1))
    for j=1:length(B(1,:));
        mn=[];
        for k=1:length(B(:,1))
            mn(k)=A(i,k) * B(k,j);
        end
        mxmn(i,j)=max(mn);
    end
end
