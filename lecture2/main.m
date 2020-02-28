clc,clear
num_gen = 1600;
record_all = zeros(2,num_gen);
times = 10;
for i = 1:times
    [record,Pop]=simpleEA(30,30,num_gen);
    record_all = record_all + record;
end
res = (record_all(2,:))/times;
eval = (1:size(record_all,2))*30;
figure(1)
plot(eval,res)
xlabel('evaluation')
ylabel('fitness')
title(' Simple arithmetic + Nonuniform using Cauchy')
figure(2)
plot(log(eval),res)
xlabel('log(evaluation)')
ylabel('fitness')
title(' Simple arithmetic + Nonuniform using Cauchy')

