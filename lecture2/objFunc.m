function [y]=objFunc(x)
n = size(x,2);
d = size(x,1);
mat = repmat(1:n,d,1);
y = sum((x).^4.*mat,2) +rand(d,1);
end