function [Pprob]=PossMatrixToProb(PossM)
   [f,c]=size(PossM);
   Pprob=zeros(f,c);
   parfor i=1:f
       s=sum(PossM(i,:));
       Pprob(i,:)=PossM(i,:)/s;
   end
end