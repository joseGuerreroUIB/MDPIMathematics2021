% Save in a file the number of steps to converge using both: probabilistic and possibilistic approaches
%Parameters:
%   Nt: number of tasks.
%   multDist: nTH parameters
%   nVs: n power for the operators.
%   TF: transdorm type-->always 1 for normalization
function getConvergence(Nt, MEnvironments, multDists,nVs,TF) 
    Nr=100;

    
    dmax=2*283*sqrt(2);
    for nV=nVs
    for multDist=multDists
    finalRes=[];
    for nEx=MEnvironments

    fname=sprintf('environments/EnvironmentSw_%d',nEx);

    load(fname, 'posObjES');  
    

    posObj=posObjES(1:Nt,:);

    TH1=multDist/dmax;

    [PijF1L, PijProb1L]=createTransMatrix(posObj, Nt, 0, TF, nV, TH1, zeros(1,Nt), 0);

    [iterFL, fConverL, FMCL, iterProbL, probConverL, ProbMCL] = getconvergenceSteps(PijF1L,PijProb1L,500);
  
    finalRes = [finalRes; nEx, iterFL, fConverL, iterProbL, probConverL];

    nEx
    end

    fname=sprintf('results4/ConvergenceRes_TH%d_F%d_N%d_%d',multDist,TF,nV,Nt);
    save(fname);
    end
    end
    
end

