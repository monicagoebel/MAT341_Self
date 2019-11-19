%
% takes in two inputs, tol and gamma, and returns the number of iterations,
% N, necessary to achieve a certain the error tol- erance, tol, using a
% specific fixed step-size gamma
%

function N = Gradient_Descent_1(tol,gamma)

x0 = [1.0, 1.5];    % initialize x0 (initial guess)
err = 1;    % initialize error
N = 0;    % initialize N, number of iterations

while err > tol
    
    N = N+1;    % increase number of iterations
    x1 = x0 - (gamma*G(x0));    % plug our value into the matrix
    err = sqrt((x1-x0).' * (x1-x0));    % compute error
    x0 = x1;    % rename x0 (x0 is now our new answer)
    
end
end

function val = G(x)    % create gradient matrix
val = [-cos(x(1)); sin(x(2))];
end

%
% a) 34 iterations.
%
% b) 12 iterations.
%
% c) 35 iterations.
%