function [record,Pop]=simpleEA(N,D,T) 
    nbGen = 0; % generation counter
    % N number of individual
    % D the length of binary
    % T max gen

    Pop = 2.56*rand(N,D) - 1.28 ;

    fitness = objFunc(Pop);  % Evaluate the initial population
    bestSoFarFit = max(fitness);     % best-so-far fitness value
    record = ones(2,T);

    while (nbGen<T) 
        fitness = objFunc(Pop);               % Evaluate the initial population
        index = RouletteWheelSelection(N,fitness);    % Roulette Wheel Selection
        Pop = reproduction(Pop(index,:),0.5,0.5);    % crossover mutation
        nbGen = nbGen + 1;
        bestSoFarFit = min(bestSoFarFit,min(objFunc(Pop)));
        record(:,nbGen) = [min(objFunc(Pop));bestSoFarFit];
    end
%     plot(1:size(record,2),(31*31-record(:,:)))
%     xlabel('generation')
%     ylabel('value of function')
end