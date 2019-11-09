%
% takes in one input, tol and returns the number of iterations, N, 
% necessary to achieve a certain the error tolerance, tol
% find min
%

function N = Newtons_1D_Opt(tol)    % need to input tolerance to run it

err = 1;    % initialize error
N = 0;    % initialize N
xn = 0.25;    % initialize xn

while err > tol
    
    N = N+1;    % increase counter
    xn1 = xn - (fprime(xn)/fprimeprime(xn));    % compute next xn value
    err = abs(xn1 - xn);    % compute error
    xn = xn1;    % rename to get new xn
    
end

xn    % print out xn
N    % print out number of iterations

end

function val = f(x)    % define function we are finding the min of
val = 0.5 - x*exp(-x^2);
end

function val = fprime(x)    % hard code prime of function
val = -exp(-x^2) + 2*exp(-x^2)*x^2;
end

function val = fprimeprime(x)    % hard code double prime of f
val = -4*exp(-x^2)*x^3 + 6*exp(-x^2)*x;
end

% 
% a) It takes 6 iterations.
%
% b) If you change xn to 1.5, it does 736 iterations and then tells you
% that your answer is not a number. Our initial guess was apparently just
% not a good one.
%