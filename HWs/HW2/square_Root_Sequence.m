%
% write a code to determine the limit of t_n as n gets large
%

function val = square_Root_Sequence(m,n)    % input: value to test (m) and what value of sequence (n)

val = sqrt(m);    % what we're starting with (working backwards)

for j=2:n
    
    if mod(n,2)==0    % if n is even, make the first sqrt(m) subtract val
        x = -1;
    else
        x = 1;    % otherwise, add val
    end
    
    val = sqrt(m + (-1)^j*x*val);
    
end

end

% m = 13, limit = 3
% m = 31, limit = 5
% m = 43, limit = 6