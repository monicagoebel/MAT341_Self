%
% takes in one inputs, tol and returns the number of iterations, N,
% necessary to achieve a certain the error tolerance, tol, using a specific
% fixed step-size gamma
%

function N = Gradient_Descent_2(tol)

x0 = [1.0; 1.5];    % initial guess
gamma = 0.5;    % initialize gamma
err = 1;    % initialize error
N = 0;    % initialize counter

while err > tol
    
    N = N+1;    % increase N (number of iterations) by 1
    x1 = x0 - (gamma*G(x0));    % plug our value into the matrix
    gamma = abs(((x1-x0).' * (G(x1)-G(x0))))/(G(x1)-G(x0).' * (G(x1)-G(x0)));    % compute Barzilai-Borwein step-size
    err = sqrt((x1-x0).' * (x1-x0));    % compute error
    x0 = x1;    % change x0 value
    
end

end

function val = G(x)    % create gradient matrix
val = [-cos(x(1)); sin(x(2))];
end

%
% a) It takes 5 iterations to achieve 1e-6 accuracy.
%
% b) It takes 6 iterations to achieve 1e-10 accuracy.
%