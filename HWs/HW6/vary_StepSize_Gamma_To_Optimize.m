%
% will run Gradient_Descent_1 code from Problem 1 for a variety of
% step-sizes, gamma, to find which gamma seems to minimize the total number
% of iterations needed to achieve 1e ? 10 accuracy
%

function vary_StepSize_Gamma_To_Optimize()

gammaVec = [0.5:0.02:1.5];    % create gamma vector

for i = 1:length(gammaVec)    % for the length of the gamma vector, . . . 
    
    gVec(i) = Gradient_Descent_1(1e-10,gammaVec(i));    % set new vector and pull from previous code
    
end

figure(1);
semilogx(gammaVec,gVec,'blue','LineWidth',5);    % plot in blue using semilogx
xlabel('Gamma Step Size');    % label x-axis
ylabel('# of Iterations, N');    % label y-axis
legend('Fixed Step');

end

%
% a) From the graph we get, it appears that a step size of gamma=1 is best.
%