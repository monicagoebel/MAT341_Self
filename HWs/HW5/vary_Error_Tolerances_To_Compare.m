%
% takes no inputs, nor returns anything
% compares previous 3 codes with graphs
%

function vary_Error_Tolerances_To_Compare()

errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-12];    % vector of different error tolerances to use (given)

for i = 1:length(errTolVec)    % run for loop for length of error tolerance vector
    
    parabolaVec(i) = successive_Parabolic_Interpolation(errTolVec(i));    % pass errTolVec in Parabolic script
    goldenSearchVec(i) = golden_Search(errTolVec(i));    % pass errTolVec in Golden Search script
    newtonsVec(i) = Newtons_1D_Opt(errTolVec(i));    % pass errTolVec in Newton's Method script
    
end

% plot all 3 methods on same graph using different colors, using semilogx
figure(1);
semilogx(errTolVec,goldenSearchVec,'blue','LineWidth',5);
hold on;
semilogx(errTolVec,parabolaVec,'red','LineWidth',5);
semilogx(errTolVec,newtonsVec,'black','LineWidth',5);
hold off;
xlabel('Error Tolerance (tol)')
ylabel('Number of Iterations (N)')
legend('Golden Search','Parabolic Interpolation','Newton Method');

% plot all 3 methods on same graph using different colors, using loglog
figure(2);
loglog(errTolVec,parabolaVec,'red','LineWidth',5);
hold on;
loglog(errTolVec,goldenSearchVec,'blue','LineWidth',5);
loglog(errTolVec,newtonsVec,'black','LineWidth',5);
hold off;
xlabel('Error Tolerance (tol)')
ylabel('Number of Iterations (N)')
legend('Parabolic Interpolation','Golden Search','Newton Method');

% 
% a) Newton's method converges faster in both graphs, but the loglog graph
% shows this better than the semilogx graph.
%
% b) Newton's method still converges quicker, and we get the same erorr
% messages as we did last homework regarding the problems with inverting
% the matrices.
%
% c) You could possibly change the convergence rates if you changed the
% initial conditions.
%