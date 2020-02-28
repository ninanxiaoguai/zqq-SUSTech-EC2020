clc,clear
record_all = zeros(2,500);
for i = 1:100
    [record]=simpleEA(4,5,500);
    record_all = record_all + 31*31-record;
end
plot(1:size(record_all,2),(record_all)/30)
xlabel('generation')
ylabel('value of function')
