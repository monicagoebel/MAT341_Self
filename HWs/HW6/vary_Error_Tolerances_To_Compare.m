%
%
%

function vary_Error_Tolerances_To_Compare()

errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11];    % initialize vector

for i = 1:length(errTolVec)    % for the length of the vector we initialized above, . . . 
    
    gradDes1Vec(i) = Gradient_Descent_1(errTolVec(i),0.5);    % call each m-file and make it a vector
    gradDes2Vec(i) = Gradient_Descent_2(errTolVec(i));
    
end

% plot each graph against each other using semilogx so we can see which one converges faster
figure(1);
semilogx(errTolVec,gradDes1Vec,'blue',errTolVec,gradDes2Vec,'red','LineWidth',5);
xlabel('Error Tolerance (tol)')
ylabel('Number of Iterations (N)')
legend('Fixed Step','Barzilai-Borwein');

% plot each graph against each other using loglog so we can see which one converges faster
figure(2);
loglog(errTolVec,gradDes1Vec,'blue',errTolVec,gradDes2Vec,'red','LineWidth',5);
xlabel('Error Tolerance (tol)')
ylabel('Number of Iterations (N)')
legend('Fixed Step','Barzilai-Borwein');

end

%
% a) The fixed step-size line appears to converge faster to the minimum.
%
% b) With gamma of 0.5 instead of 1, the Barzilai-Borwein line appears to
% converge faster to the minimum.
%
% c) An advantage of using the Barzilai-Borwein step-size is that it
% converges faster.
%
% d) I would use the first step-size method (fixed, not Barzilai-Borwein),
% because I can put a value for gamma in.
%