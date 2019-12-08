%
% perform linear least squares to find a best fit function through data
% {(xi, yi)}Ni=1
%

function fit_Sine_Series()

N = 500;    % # of data points
M = 5;    % upper bound of sum
xData = linspace(-pi,pi,N);    % creating data
yData = ((0.25*xData.^2).*cos(xData).^4.*sin(xData).^7)';

for j = 1:N
    
    x = xData(j);    % calls x data
    y = yData(j);    % calls y data
    
    for i = 1:M
        A(j,i) = sin(i*x);    % sum
    end
    
    B(j,:) = y;
    
end

pseudoinv = (inv(A'*A))*A';    % creates pseudo inverse
beta = pseudoinv*B;    % finds beta values

for j = 1:N
    
    x = xData(j);
    f(j,1) = 0;
    i = 1;    % initializes counter
    
    while i <= M    % while counter is less than M
        
        f(j,1) = f(j,1) + beta(i)*sin(i*x);    % sum
        i = i + 1;    % increase counter
        
    end
    
end

% plot
figure;
plot(xData,yData,'bo','LineWidth',6);
hold on;
plot(xData,f,'Red','LineWidth',4)
xlabel('x');
ylabel('y');
legend('Data','Best Sine Series Fit')

res = B - A*beta;    % calculate residual
l2norm = sqrt(res'*res)    % calculate and print l2norm

end

%
% a) Using N = 500, when M = 5, the l2norm = 0.0813. M = 10, l2norm = 0.0096,
% M = 20, l2norm = 2.1412e-06, and M = 40, l2norm = 3.9199e-09. As you
% increase M, the l2norm decreases.
%
% b) This series/process is called a Fourier Series.
%