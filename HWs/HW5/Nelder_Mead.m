%
% takes in one input, tol, and returns the number of iterations, N, 
% necessary to achieve a certain the error tolerance, tol
%

function N = Nelder_Mead(tol)    % input tol to run

err = 1;    % initialize for while loop

x1 = 0.35;    % initializing points (left from part d)
y1 = 2.8;
x2 = 4;
y2 = 4;
x3 = 4.5;
y3 = 4.5;

xVec = [x1 x2 x3];    % create vectors
yVec = [y1 y2 y3];
fVec = [f(x1,y1) f(x2,y2) f(x3,y3)];

N = 0;    % to start counter

while err > tol
    
    [fNew,indsVec] = sort(fVec);    % sort the vector so we can order them
    xLeast = xVec(indsVec(1));    % assign names to each value in vec
    xMid = xVec(indsVec(2));
    xGreat = xVec(indsVec(3));
    yLeast = yVec(indsVec(1));
    yMid = yVec(indsVec(2));
    yGreat = yVec(indsVec(3));
    
    xMdpt = 1/2*(xLeast+xMid);    % compute midpoint
    xReach = xMdpt+(xMdpt-xGreat);    % new point
    yMdpt = 1/2*(yLeast+yMid);
    yReach = yMdpt+(yMdpt-yGreat);
    
    if f(xReach,yReach) < f(xGreat,yGreat)    % if this is true
        xGreat = xReach;    % change x,y values to guess
        yGreat = yReach;
        
    else
        if f(xReach,yReach) > f(xGreat,yGreat)    % otherwise, change center values
            xCenter = 1/2*(xMdpt+xGreat);
            yCenter = 1/2*(yMdpt+yGreat);
            
            if f(xCenter,yCenter) < f(xGreat,yGreat)    % more renaming
                xGreat = xCenter;
                yGreat = yCenter;
                
            else
                xMid = 1/2*(xLeast+xMid);    % more renaming
                yMid = 1/2*(yLeast+yMid);
                xGreat = 1/2*(xLeast+xGreat);
                yGreat = 1/2*(yLeast+yGreat);
                
            end
        end
    end
    
    err = abs(f(xGreat,yGreat)-f(xLeast,yLeast));    % compute error
    
    xVec = [xLeast xMid xGreat];    % did this to fix an error code I was getting
    yVec = [yLeast yMid yGreat];
    fVec = [f(xLeast,yLeast) f(xMid,yMid) f(xGreat,yGreat)];
    
    N = N+1;    % increase number of iterations counter
end

xLeast    % print out xLeast
yLeast    % print out yLeast
N     % print out number of iterations

end


function val = f(x,y)
val = -(sin(x)+cos(y));    % the function we're working with
end



% 
% a) It takes 29 iterations.
%
% b) The points appear to converge to (1.5715, 7.9827e-04). The true (x,y)
% point where the minima is located is (pi/2, 0). While this doesn't look
% like 1e-8 accuracy, it is because it depends how you define the error. We
% are finding the min between f least and f great, but that is not
% necessarily the min of the points themselves. This is just the problem we
% run into with optimization.
%
% c) When you change the second initial point, it now takes 58 iterations
% to achieve 1e-8 accuracy. The minima it located is (1.5709, -1.1087e-04),
% which is still not correct, and it also different from the min we found
% in part a. Even though we moved our initial value closer to the local
% minima from part a, it took more iterations. This is again just a problem
% with optimization; just because we moved a point closer doesn't mean it
% will be easier to find the min. Our guess will still just be some number
% between the other 2 values.
%
% d) The algorithm finds a min of (-4.7123, -2.8363e-04) in 53 iterations
% (which is way different from the other minimas we have found, and way 
% different from the real min).
%