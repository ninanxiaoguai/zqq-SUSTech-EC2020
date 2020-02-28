function Offspring = reproduction(Parent,proc,prom)
    Parent1 = Parent(1:floor(end/2),:);
    Parent2 = Parent(floor(end/2)+1:floor(end/2)*2,:);
    [N,D]   = size(Parent1);
    %% crossover
    % one-bit
%     k = repmat(1:D,N,1) > (randi(D-2,N,1)+1);
%     k(repmat(rand(N,1)>proc,1,D)) = false; % > proc 的概率不交叉
%     Offspring1    = Parent1;
%     Offspring2    = Parent2;
%     Offspring1(k) = Parent2(k);
%     Offspring2(k) = Parent1(k);
%     Offspring     = [Offspring1;Offspring2];
    
    % Simple Arithmetic Recombination
    k = repmat(1:D,N,1) > (randi(D-2,N,1)+1);
    k(repmat(rand(N,1)>proc,1,D)) = false; % > proc 的概率不交叉
    k1 = k .* repmat(rand(N,1),1,D);
%     k1 = k .* 0.4;
    
    Offspring1    = Parent1.*(k == 0) + Parent1.*k1 + Parent2.*(1-k1).*((k == 1));
    Offspring2    = Parent2.*(k == 0) + Parent2.*k1 + Parent1.*(1-k1).*((k == 1));
    
    
    Offspring     = [Offspring1;Offspring2];
  
    %% mutation
    t = 0.01;
    k2 = repmat(rand(2*N,1),1,D) > prom;

    Offspring = Offspring + (t*randn(2*N,D)./randn(2*N,D)).*k2;
    Offspring(Offspring > 1.28) = 1.28;
    Offspring(Offspring < -1.28) = -1.28;
end

