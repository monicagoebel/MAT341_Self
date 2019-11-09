%
% takes in one input, tol, and returns the number of iterations, N, 
% necessary to achieve a certain the error tolerance, tol
%

function N = golden_Search(tol)    % takes one input, tolerance

err = 1;    % initialize for while loop
T = (sqrt(5)-1)/2;    % search step, tau

a = 0;    % given in question (within interval 0 to 2)
b = 2;

N = 0;    % initialize for while loop so we start at N=1

x1 = a + (1-T)*(b-a);    % from golden search psuedo-code
x2 = a + T*(b-a);    % initializing x1, x2, f1, and f2
f1 = f(x1);
f2 = f(x2);

while err > tol
    
    N = N + 1;    % start at N=1 and increase until err < tol
    
    if f1 > f2
        
        a = x1;    % change all values so we get closer and closer to correct answer
        x1 = x2;
        f1 = f2;
        x2 = a + T*(b-a);
        f2 = f(x2);
        
    else
        b = x2;    % same as if statement but if f1 is not > f2
        x2 = x1;
        f2 = f1;
        x1 = a + (1-T)*(b-a);
        f1 = f(x1);
        
    end
    
    err = b-a;    % error
    
end

N    % print out number of iterations

end

function val = f(x)    % the function we use above in code
val = 0.5 - x*exp(-x^2);    % given in question
end

% It takes 40 iterations to  achieve 1e ? 8 accuracy.