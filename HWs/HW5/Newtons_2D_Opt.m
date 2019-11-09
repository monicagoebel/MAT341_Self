%
% takes in one input, tol and returns the number of iterations, N, 
% necessary to achieve a certain error tolerance, tol
% finds min
%

function N = Newtons_2D_Opt(tol)

x0 = [-4.5,4.5]';    % initialize x0, make it a column vector
err = 1;    % initialize error
N = 0;    % initialize N (counter)

while err > tol
    
   N = N+1;    % increase counter
   x1 = x0 - Hessian(x0(1),x0(2))*grad(x0(1),x0(2));    % find x1 by calling Hessian and grad functions defined below
   err = sqrt(dot((x1-x0),(x1-x0)));    % compute error
   x0 = x1;    % rename x0 and start over
    
end

N    % print out N
err    % print out error
x0    % print out x0

end


function val = Hessian(x,y)    % hard code Hessian to use above
val = inv([sin(x) 0;0 cos(y)]);
end

function val = grad(x,y)    % hard code gradient to use above
val = [-cos(x), sin(y)]';
end

%
% a) It takes 5 iterations to find a min of x0 = [-4.7124; 0].
%
% b) It takes 4 iterations to find a min of x0 = [-4.7124; 0].
%