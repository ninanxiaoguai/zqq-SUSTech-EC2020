clc,clear
nbGen = 0; % generation counter
bestSoFarSolution = NaN; % best-so-far solution
N = 6;            % number of individual
D = 5;            % the length of binary
T = 3000;         % max gen
Pop = randi([0,1],N,D);   % Initialise a population
cal_mat = ones(1,D);
for i = (D-1):-1:1
    cal_mat(i) = cal_mat(i+1)*2;
end
fitness = objFunc(Pop,cal_mat);  % Evaluate the initial population
bestSoFarFit = min(fitness);     % best-so-far fitness value
min_num = []; best_num = [];

while (nbGen<T) 
    fitness = objFunc(Pop,cal_mat);               % Evaluate the initial population
    index = RouletteWheelSelection(N,fitness);    % Roulette Wheel Selection
    Pop = reproduction(Pop(index,:),0.1,0.01);    % crossover mutation
    nbGen = nbGen + 1;
    min_num = [min_num min(objFunc(Pop,cal_mat))];
    bestSoFarFit = min(bestSoFarFit,min(objFunc(Pop,cal_mat)));
    best_num = [best_num bestSoFarFit];
end
plot(1:size(min_num,2),min_num)
hold on
plot(1:size(best_num,2),best_num)
xlabel('generation')
ylabel('value of function')