%
% find smallest integers N_A and N_B such that diff btwn a_N_A and pi and b_N_A and pi are less than 10^-6
%

function calculate_Pi_Sums()    % takes no input arguments, nor returns anything

tol = 1e-6;    % error tolerance
err_A = 1;    % initialize
NA = -1;    % initilalize at -1 so when we add 1, NA starts at 0

while err_A > tol
    
    NA = NA+1;
    
    % compute sum for a_N
    sumA = 0;    % initialize
    for k = 0:NA
        sumA = sumA + 6/(sqrt(3)) * ((-1)^k)/((3^k)*(2*k+1));
    end
    
    err_A = abs(sumA - pi);    % prints out difference
    
end

NA    % prints out NA
    
   
err_B = 1;    % initialize
NB = -1;    % initialize at -1 so when we add 1, NA starts at 0

while err_B > tol
    
    NB = NB+1;
    
    % compute sum for b_N
    sumB = 0;    % initialize
    for k = 0:NB
        sumB = sumB + 16*((-1)^k)/(5^(2*k+1)*(2*k+1))-4*((-1)^k)/(239^(2*k+1)*(2*k+1));
    end
    
    err_B = abs(sumB - pi);    % prints out difference
    
end

NB    % prints out NB

end

% NA = 10
% NB = 3

