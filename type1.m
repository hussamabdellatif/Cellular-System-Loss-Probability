
function output = type1(lambda_h, lambda_n, mu_r, mu_s, index,S)
l_h = lambda_h(index); %scalar value of lambda_h
l_n = lambda_n(index); %scalar value of lambda_n

lambda = l_h + l_n; 
mu = mu_r + mu_s;

t_matrix = zeros(S+1,S+1); %intialize matrix to S+1 states 

%build matrix using obvious patterns
for row = 1:size(t_matrix,1)
    for column = 1:size(t_matrix,2)
        if row == column
            t_matrix(row,column) = (((row-1)*mu) + lambda) * -1; 
        elseif column == row+1
            t_matrix(row,column) = lambda;
        elseif column == row-1
            t_matrix(row,column) = mu * (row-1);
        end
    end
end
%fix inconsistency in patters 
t_matrix(5,6) = l_h; 
t_matrix(6,6) = t_matrix(6,6) + lambda;
t_matrix(5,5) = t_matrix(5,5) + l_n;
t_matrix = [t_matrix, ones(S+1,1)]; % concatenates column of ones to the end of transition rate matrix (normalization)
y = zeros(0,S+2); %intialize y to solve the linear system [0 0 .. 0 1] i.e. y will have (N+1) zeroes
y(S+2) = 1;
output = y / t_matrix; %solve linear system, and return the probability state vector

end

