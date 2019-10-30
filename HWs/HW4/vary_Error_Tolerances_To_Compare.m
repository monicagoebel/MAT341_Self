%
% takes no inputs, nor returns anything
% Compares previous 2 codes with graphs
%

function vary_Error_Tolerances_To_Compare()

errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-12];    % vector of different error tolerances to use (given)

for i = 1:length(errTolVec)    % run for loop for length of error tolerance vector
    
    parabolaVec(i) = successive_Parabolic_Interpolation(errTolVec(i));    % pass errTolVec in Parabolic script
    goldenSearchVec(i) = golden_Search(errTolVec(i));    % pass errTolVec in Golden Search script
    
end

% plot both methods on same graph using different colors, using semilogx
figure(1);
semilogx(errTolVec,goldenSearchVec,'blue','LineWidth',5);
hold on;
semilogx(errTolVec,parabolaVec,'red','LineWidth',5);
hold off;
xlabel('Error Tolerance (tol)')
ylabel('Number of Iterations (N)')
legend('Golden Search','Parabolic Interpolation');

% plot both methods on same graph using different colors, using loglog
figure(2);
loglog(errTolVec,parabolaVec,'red','LineWidth',5);
hold on;
loglog(errTolVec,goldenSearchVec,'blue','LineWidth',5);
hold off;
xlabel('Error Tolerance (tol)')
ylabel('Number of Iterations (N)')
legend('Parabolic Interpolation','Golden Search');

% a) The parabolic algorithm appears converge faster to the minimum for
% higher tolerances, and the golden search algorithm appears converge
% faster to the minimun for smaller tolerances.

% b) When you increase the accuracy threshold, the golden search algorithm
% converges quicker because the parabolic algorithm runs into problems with
% inverting matrices.