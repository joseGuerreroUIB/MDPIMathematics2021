
%Calculates the numbers of stpes required to converge.
%Parameters: 
% FM fuzzy markov matrix
% ProbM: probabilistic matrix
% maxIter: max number of iterations.
%Returns:
% iterF: number of iterations to convrge with a fuzzy MArkov chain.
% fConver: true if matrix FM converges, false otherwise
% FMC: final matrix after converge.

% iterProb: number of iterations to convrge with a probabilistic MArkov chain.
% probConver: true if matrix ProbM converges, false otherwise
% probAux: final probabilistic matrix after converge.
function [iterF, fConver, FMC, iterProb, probConver, probAux]=getconvergenceSteps(FM, ProbM, maxIter)
   fConver = false;
   probConver = false;
   [f c] = size(FM);
   probAux = eye(f);
   FMC=eye(f);
   ProbMC=eye(f);
  
   for iterProb=1:maxIter
       probAuxOld = probAux;
       probAux = probAux * ProbM;
       if probAuxOld == probAux
          probConver = true;
          ProbMC = probAux;
          break;
       end
   end

   FAux = FM; %eye(f);
   for iterF=1:maxIter
       FAuxOld = FAux;
      FAux = fuzzy_maxmin(FAux, FM);
      %FAux = fuzzy_Luk(FAux, FM);
      % FAux = fuzzy_MaxAvg(FAux, FM);
       if FAuxOld == FAux
          fConver = true;
          FMC = FAux;
          iterF=iterF + 1;
          break;
       end
   end
   
end
