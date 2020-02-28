function [y]=objFunc(x,cal_mat)
cal_mat = repmat(cal_mat,size(x,1),1);
xx = sum(cal_mat.*x,2);
y = xx.^2;
y = y';
end