%
% performs linear least squares to find the best fit polynomial of degree
% 12 through data {(xi,yi)}Ni=1
%

function fit_Polynomial_Series()

N = 250;    % number of data points
xData = linspace(-2*pi,2*pi,N);    % creating data
yData = cos(xData)';    % creating data

for j = 1:N    % for loop runs for numebr pf data points
    
    x = xData(j);    % calls x data point
    y = yData(j);    % calls y data point
    A(j,:) = [1 x x^2 x^3 x^4 x^5 x^6 x^7 x^8 x^9 x^10 x^11 x^12];    % creates vector of 12th degree polynomial
    B(j,:) = y;
    
end

pseudoinv = (inv(A'*A))*A';    % takes the pseudo inverse
beta = pseudoinv*B;    % multiply pseudo inverse by B to get beta

for j = 1:N    % for loop runs for numebr of data points
    
    x = xData(j);    % calls x data points
    
    % creates series using beta coefficients
    f(j,1) = beta(1) + beta(2)*x + beta(3)*x^2 + beta(4)*x^3 + beta(5)*x^4 + beta(6)*x^5 + beta(7)*x^6 + beta(8)*x^7 + beta(9)*x^8 + beta(10)*x^9 + beta(11)*x^10 + beta(12)*x^11 + beta(13)*x^12;
    
end

% plot
figure;
plot(xData,yData,'bo','LineWidth',6);
hold on;
plot(xData,f,'Red','LineWidth',4)
xlabel('x');
ylabel('y');
legend('Data','Best Poly Fit')

res = B - A*beta;    % computes residual
l2norm = sqrt(res'*res)    % computes and prints l2norm

end

%
% a) When N = 10, the l2norm = 10.3557, N = 50, l2norm = 5.1501e-04, and
% N = 250, l2norm = 0.0011. So the residual decreases as N increases.
%
% b) We have seen cos(x) written as a polynomial before as a Taylor Series.
% The coefficients were 1 and -1.
%
% c) The coefficients when N = 250 are beta = 
%   0.9999
%   0.0000
%  -0.4998
%  -0.0000
%   0.0416
%   0.0000
%  -0.0014
%  -0.0000
%   0.0000
%   0.0000
%  -0.0000
%  -0.0000
%   0.0000
%
% d) The coefficients get smaller, but (except for the 1st one) they are
% all about 0.
%   