%
% Write a code to find the LCM of two numbers x and y.
%

function LCM_val = calculate_LCM(x,y)

m = 0;         % initialize m (what we'll be multiplying our x-value by)
notLCM = 1;    % initilize notLCM (will be used in while loop)

while notLCM == 1    % until this value changes, run while loop
    m=m+1;           % increase what we're multiplying x-value by
    x_count=m*x;     % multiply x-value by whatever value of m we're at and store it
    n=0;             % initialize n (what we'll be multiplying our y-value by)
    y_count=n*y;     % multiply y-value by whatever value of n we're at and store it

    
    while y_count <= x_count       % compares y_count and x_count
        n=n+1;                     % increase what we're multiplying y-value by
        y_count=n*y;               % multiply y-value by whatever value of n we're at and store it
        
        if y_count == x_count      % if they're equal
            LCM = x_count          % print out what the LCM is (could print x_count or y_count here, they're the same)
            notLCM=0;              % set to 0 so 1st while loop stops running
        end
        
    end
    
end

end
