%
%
%

function plot_Nested_Times()

N = [1:1:10 20:10:100 125 150 175 200 225 250];    % vector of N values

for n = 1:length(N)    % for the length of the vector N
    time(n) = calculate_Nested_For_Loop_Time(N(n));    % call tic/tock m file to run nested for loop
end

lw = 4;    % change line width
fs = 18;    % change font size

loglog(N,time,'m','LineWidth',lw);    % plot (using loglog instead of plot)
xlabel('n');    % graph label
ylabel('Time');    % graph label
leg = legend('Time');    % legend
set(gca,'FontSize',fs);

end