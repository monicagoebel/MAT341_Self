%
% perform non-linear least squares to find a best fit function through
% data {(xi, yi)}Ni=1
%

function perform_NonLinear_Least_Squares()

N = 2500;    % initializing
tol = 1e-5;
err = 1;

data = give_NonLinear_Least_Squares_Data(N);    % calls in mfile to get data
xData = data(:,1);    % create vectors
yData = data(:,2);
beta = [1 0.5 0.3]';    % initialzie beta value

while err > tol    % while the error is greater than 1e-5
    
    for i = 1:N    % run the for loop 2500 (N) times
        
        x = xData(i);    % pull x value from data
        expy = exp((-(x-beta(2))^2)/(2*beta(3)^2));    % create expy value
        J(i,1) = expy;    % create Jacobian matrix
        J(i,2) = beta(1)*((x-beta(2))/beta(3)^2)*expy;
        J(i,3) = beta(1)*((x-beta(2))^2/beta(3)^3)*expy;
        
    end
    
    for i = 1:N    % from 1 to 2500 (N)
        
        x = xData(i);    % create x and y points
        y = yData(i);
        expy = exp((-(x-beta(2))^2)/(2*beta(3)^2));    % create expy value
        rVec(i,1) = y-beta(1)*expy;    % find residual
        
    end
    
    inverse = inv(J'*J)*J';    % compute inverse
    pseudoInv = inverse*rVec;    % compute pseudo inverse
    betaNew = beta + pseudoInv;    % compute new beta value
    err = sqrt((betaNew-beta)'*(betaNew-beta));    % compute error
    beta = betaNew;    % make beta = new beta value
    
end

for i = 1:N    % runs for loop 2500 (N) times
    
    x = xData(i);    % create x value
    expy = exp((-(x-beta(2))^2)/(2*beta(3)^2));    % create expy value
    f(i,1) = beta(1)*expy;
    
end

beta    % print beta
err    % print error

% plot
figure;
plot(xData,yData,'b.','LineWidth',6,'MarkerSize',20);
hold on;
plot(xData,f,'Red','LineWidth',4)
xlabel('xData');
ylabel('yData');
legend('Data','Model Fit')

end
