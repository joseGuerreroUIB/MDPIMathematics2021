%Generates the set of random environments to test.
function generateEnvironmentsSw(NEnv)

NtE=300;
NrE=900;
for i=1:NEnv

    posObjE=unifrnd(-283,283,NtE,2); %Objects' positions posRobot=100x2
    posObjR=unifrnd(-283,283,NrE,2);%Robots' positions posRobot=100x2
    
    typeObjE=round(4*rand(1,NtE)+1);
    minLE = 10; %5; 
    maxLE = 30; %20;
    LE=unifrnd(minLE,maxLE,NtE,1); %Object's weigth
    
    UtilityE=unifrnd(100,200,NtE,1); %repmat(100,1,Nt); %unifrnd(100,200,Nt,1);
    
    minCRE=1;   
    maxCRE=5; %14;
    CRE=unifrnd(minCRE,maxCRE,NrE,5); %Robots' load capacity depending on the type
    
    %vel=repmat(3,Nr,1); %Robots' velocity (same vel. for all robots=3)
    minVelE=1;
    maxVelE=5;
    velE=unifrnd(minVelE,maxVelE,NrE,1);
    
    minDLE=50; %34 ;
    maxDLE=400;%267;
    DLE=unifrnd(minDLE,maxDLE,NtE,1);
    
    fnameE=sprintf('environments/EnvironmentSw_%d',i);
    save(fnameE)
end
