%
% Write a Monte Carlo scheme to estimate probability that coin tossed into
% a square is contained fully in the square
%
% I think N=1e5 is a reasonable number of trials, because as you increase
% your N value, the probability converges to about 0.64 when you get to
% N=1e5 and stays there if you increase N.
% This is harder than what we did in class because we know a coin flip has
% a 50/50 chance of landing heads or tails, but we don't know the exact
% proability for landing in the square.
%

function prob = estimate_Coin_In_Square_Probability(r,N)

count = 0;    % initialize the counter at 0

for i=1:N
    x = rand;    % make x a random number from 0 to 1
    y = rand;    % make y a random number from 0 to 1
    
    if ((x-r>0) && (x+r<1) && (y-r>0) && (y+r<1))    % if all of these statements are true
        count = count + 1;                           % increase the counter by 1
    end
    
end

prob = count/N    % calculate the probability

end
