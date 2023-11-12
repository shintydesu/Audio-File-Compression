function ath = my_filter (a, th) %naming the function and setting the parameters. a being the coefficient matrix, and th being the threshold value

[m,n]=size(a); %Setting the diension of the matrix of m rows and n columns

for i=1:m     % for i in range m and for j in range n allows it to access each element of the matrix
    for j = 1:n
        if abs(a(i,j)) < th %If the absolute value of the element in matrix a is smaller than the threshold value, then it gets replaced with 0
            a(i,j) = 0;
        else
            a(i,j) = a(i,j); %If the absolute value of the element in matrix a is not less than the threshold, it stay the same.
     
        end
    end
end
ath = a; %The new matrix with the bounded threshold gets created
end

