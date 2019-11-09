%
% takes in one input, tol, and returns the number of iterations, N, 
% necessary to achieve a certain the error tolerance, tol
%

function N = successive_Parabolic_Interpolation(tol)

N = 0;    % initialize before while loop
err = 1;    % initialize before while loop

x1 = 0;    % initialize x values
x2 = 0.6;
x3 = 1.2;

while err > tol
    
    N = N + 1;    % increase N by 1 (this is why we intitialized N=0 and not N=1)
    A = [x1^2 x1 1; x2^2 x2 1; x3^2 x3 1];    % matrix A
    coef = inv(A)*[f(x1) f(x2) f(x3)]';
    
    a = coef(1);
    b = coef(2);
    
    vertex = -b/(2*a);
    
    x3 = x2;
    x2 = x1;
    x1 = vertex;
    
    err = abs(x3 - x1);
    
end

N    % print out number of iterations

end

function val = f(x)    % the function we use above
val = 0.5 - x*exp(-x^2); 
end

% a) It takes 227 iterations to achieve 1e?8 accuracy with the initial 
% guesses of x1=0, x2=0.6, and x3=0.9.

% b) When x3=2, the number of iterations needed to achieve 1e-8 accuracy
% changes to 29. MATLAB issues warnings that say "Matrix is close to
% singular or badly scaled. Results may be innaccurate." This is because as
% MATLAB runs through the code, the lines become more and more parallel, so
% the matrices become closer to being singular, which MATLSB can't compute
% well with. It just means that our answers may be a bit off. Maybe there is a
% more accurate way to do this.