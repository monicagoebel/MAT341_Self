%
% Write a script to determine how this probability changes for different radii
%
% Based off of the graph, r=0.15 gives an estimated probability of 0.5, 
% r=0.35 gives a probability of about 0.1, and approx. r=0.47 gives a 
% probability of 0.01.
%

function vary_Radii_Plot()

N = 1e5;    % set number of trials
rVec = [0.01:0.005:0.10 0.1:0.01:0.5];    % r vector

for i=1:length(rVec)    % run this loop for the length of the vector
    estimateVec(i) = estimate_Coin_In_Square_Probability(rVec(i),N);    % run other m file
end

plot(rVec,estimateVec,'r')    % plot values

lw=4;                         % line width
fs=18;                        % font size
xlabel('Radius');
ylabel('Probability');
set(gca,'FontSize',fs);   

end