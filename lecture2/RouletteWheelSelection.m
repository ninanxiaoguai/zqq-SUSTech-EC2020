function index = RouletteWheelSelection(N,Fitness)
    % 越小越好
    Fitness = reshape(Fitness,1,[]);
    Fitness = Fitness + min(min(Fitness),0) + 1;
    Fitness = cumsum(1./Fitness);
    Fitness = Fitness./max(Fitness);
    index   = arrayfun(@(S)find(rand<=Fitness,1),1:N);
    
end