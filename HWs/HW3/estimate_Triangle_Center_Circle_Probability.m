%
% Write Monte Carlo script to estimate the probability that the center of
% the circle is contained within the triangle formed between 3 points.
%

function prob = estimate_Triangle_Center_Circle_Probability(N)

count = 0;    % initialize your counter

for i=1:N
    theta(1) = 2*pi*rand();    % pick 3 random theta values
    theta(2) = 2*pi*rand();
    theta(3) = 2*pi*rand();
    X = [theta(1) theta(2) theta(3)];    % write thetas as a vector X so we can sort them
    Y = sort(X);    % sort X and rename Y
    theta1 = Y(1);
    theta2 = Y(2);    % theta(2) has to be in between theta(1) and theta(3)
    theta3 = Y(3);
        
        if theta2 < theta1 + pi && theta2 > theta3 - pi    % if these things are true
        count = count+1;                                   % increase the counter
        end
        
end

prob = count/N    % calculate and print the probability

end