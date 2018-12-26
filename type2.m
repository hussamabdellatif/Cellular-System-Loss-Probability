function output2 = type2(lambda_h, lambda_n, mu_r, mu_s, index,S)
    l_h2 = lambda_h(index);%scalar value of lambda_h
    l_n2 = lambda_n(index);%scalar value of lambda_n

    lambda2 = l_h2 + l_n2;
    mu2 = mu_r + mu_s;

    t_matrix_2 = zeros(S*2,S*2); %intialize matrix (10 possible states) thus S*2

    %build upper transition matrix using obvious patterns
    for row = 1:size(t_matrix_2,1)/2
        for column = 1:size(t_matrix_2,2)/2
            if row == column
                t_matrix_2(row,column) = (((row-1)*mu2) + lambda2) * -1; 
            elseif column == row+1
                t_matrix_2(row,column) = lambda2;
            elseif column == row-1
                t_matrix_2(row,column) = mu2 * (row-1);
            end
        end
    end
    %fix inconsistency in patterns 
    t_matrix_2(5,6) = l_h2; 
    t_matrix_2(5,5) = t_matrix_2(5,5) + l_n2;
    
    
    %build lower half of transition matrix using obvious patterns
    for row = 6:size(t_matrix_2,1)
        for column = 1:size(t_matrix_2,2)
            if row == column
                t_matrix_2(row,column) = (((mod(S*2,row))*mu2) + mu2 + lambda2) * -1; 
            elseif column == row-1
                t_matrix_2(row,column) = lambda2;
            elseif ((mod(S*2,row) + 1) == column)
                t_matrix_2(row,column) = mu2;
            elseif column == row+1
                t_matrix_2(row,column) = mu2 * (mod(S*2,row));
            end
        end
    end
    %fix inconsistency in patterns 
    t_matrix_2(6,5) = mu2;
    t_matrix_2(6,6) = (t_matrix_2(6,6) + lambda2) ;
    t_matrix_2 = [t_matrix_2, ones(S*2,1)]; % concatenates column of ones to end of transition rate matrix
    size(t_matrix_2,2);
    size_c = size(t_matrix_2,2);
    y2 = zeros(0,size_c);
    y2(size_c) = 1;
    output2 = y2 / t_matrix_2 ;
end

