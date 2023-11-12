function [rel_err, rel_err_a, comp_ratio] = my_metrics (x, a, y, b) %Name the function and setting the parameters.
%Relative error of x gets outputed as rel_err
%Relative error of coefficient matrix a gets outputed as rel_err_a
%compression ratio gets outputed as comp_ratio
%The parameter x is the original signal, a is the original coefficient
%matrix
%y is the new compressed signal, and b is the new coefficient matrix.

s = norm(x(:,1)-y(:,1)); %Since the calculation is long, I seperated it them into 4 parts to have it visually pleasing and also to find mistakes easily
t = norm(x(:,1));
u = norm(x(:,2)-y(:,2));
v = norm(x(:,2));

rel_err = 0.5 * ((s/t)+ (u/v)); %Calcuation of the relative error between the compressed and the original signal.

f = norm(a(:,1)-b(:,1));  %Since the calculation is long, I seperated it them into 4 parts to have it visually pleasing and also to find mistakes easily
g = norm(a(:,1));
h = norm(a(:,2)-b(:,2));
i = norm(a(:,2));

rel_err_a = 0.5 * ((f/g)+ (h/i)); %Calcuation of the relative error between the coefficient matrix of compressed and the original signal.

comp_ratio = nnz(b)/nnz(a); %Calculation of compression ratio using the built in nnz function which defines the number of non zero elements.