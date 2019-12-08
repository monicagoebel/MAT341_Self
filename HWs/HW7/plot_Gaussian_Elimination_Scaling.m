%
% takes no inputs (nor re- turns anything), runs go_Go_Gaussian_Elimination.m 
% script for a variety of N values
%

function plot_Gaussian_Elimination_Scaling()

NVec = 2:1:100;    % creates a vector made of N values

for i = 1:length(NVec)    % runs for length of N vector
    OpCount(i) = go_Go_Gaussian_Elimination(NVec(i));    % calls other script
end

% plots both figures using loglog for the 1st one and plot for the 2nd
figure(1);
loglog(NVec,OpCount,'Blue','LineWidth',5)
xlabel('Matrix Dimension:N');
ylabel('Operation Count');
figure(2);
plot(NVec,OpCount,'Blue','LineWidth',5)
xlabel('Matrix Dimension:N');
ylabel('Operation Count');

end

%
% a) As the size of the matrix increases, the number of operations required
% to compute its corresponding reduced row echelon form scale with N
% increases, as you can see in both graphs. In figure(1), where we use
% loglog to graph, it appears linear, but in figure(2), where we use plot
% to graph, it appears quadratic. I think it is actally quadratic, and the
% logog function just warps it and makes the graph look different.
% linear, but in