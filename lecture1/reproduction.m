function Offspring = reproduction(Parent,proc,prom)

    Parent1 = Parent(1:floor(end/2),:);
    Parent2 = Parent(floor(end/2)+1:floor(end/2)*2,:);
    [N,D]   = size(Parent1);
    %% crossover
    k = repmat(1:D,N,1) > (randi(D-2,N,1)+1);
    k(repmat(rand(N,1)>proc,1,D)) = false; % > proc 的概率不交叉
    Offspring1    = Parent1;
    Offspring2    = Parent2;
    Offspring1(k) = Parent2(k);
    Offspring2(k) = Parent1(k);
    Offspring     = [Offspring1;Offspring2];
  
    %% mutation
    Site = repmat(1:D,2*N,1) == randi(D,2*N,1);
    Site(repmat(rand(2*N,1)>prom,1,D)) = false;
    Offspring(Site) = ~Offspring(Site);
end

