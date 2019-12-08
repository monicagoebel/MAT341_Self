%
% takes in one input, N- the size of the matrix, and returns the operation
% count, OpCount, necessary to row reduce a matrix, A ? RN ×N , to
% reduced-row echelon form
%

function OpCount = go_Go_Gaussian_Elimination(N)

B = rand(N,N);    % create random NxN matrix
OpCount = 0;    % initialize operation counter at 0

for L = 1:N    % reduceds matrix into row echelon form, runs N times
    
    for i = L:N    % runs from L iteration to N iteration
        
        for j = 1:N    % runs basic row and matrix operators
            
            A = (B(i,j)/B(L,L));    % divides matrix rows
            OpCount = OpCount + 1;    % increases operation counter
            
            if i == L    % runs until i equals L
                B(i,j) = A;
            else    % otherwise,
                val = A*B(L,j);    % create value and set it equal to matrix times A
                OpCount = OpCount + 1;    % increases operation counter
                B(i,j) = val - B(i,j);    % subtracts B matrix from value 
                OpCount = OpCount + 1;    % increases operation counter
            end
            
        end
        
    end
    
end

OpCount    % prints operation counter

for L = N:-1:2    % creates row reduced echelon form of matrix
    
    for i = L-1:-1:1
        
        A = B(i,L) * B(L,L);    % creates new matrix equal to product of two previous matrices
        OpCount = OpCount + 1;    % increases operation counter
        B(i,L) = B(i,L) - A;
        OpCount = OpCount + 1;    % increases operation counter
        
    end
    
end

end