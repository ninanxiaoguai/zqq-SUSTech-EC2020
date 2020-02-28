function [record]=simpleEA(N,D,T) 
    nbGen = 0; % generation counter
    % N number of individual
    % D the length of binary
    % T max gen
    Pop = randi([0,1],N,D);   % Initialise a population
%     Pop = ones(N,D);
    cal_mat = ones(1,D);
    for i = (D-1):-1:1        % calculate fitness
        cal_mat(i) = cal_mat(i+1)*2;
    end
    fitness = objFunc(Pop,cal_mat);  % Evaluate the initial population
    bestSoFarFit = min(fitness);     % best-so-far fitness value
    record = ones(2,T);

    while (nbGen<T) 
        fitness = objFunc(Pop,cal_mat);               % Evaluate the initial population
        index = RouletteWheelSelection(N,fitness);    % Roulette Wheel Selection
        Pop = reproduction(Pop(index,:),0.9,0.01);    % crossover mutation
        nbGen = nbGen + 1;
        bestSoFarFit = min(bestSoFarFit,min(objFunc(Pop,cal_mat)));
        record(:,nbGen) = [min(objFunc(Pop,cal_mat));bestSoFarFit];
    end
%     plot(1:size(record,2),(31*31-record(:,:)))
%     xlabel('generation')
%     ylabel('value of function')
end