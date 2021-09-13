function [] = matPrint(table,int)

[row,col] = size(table);

%% Header
fprintf('\\begin{bmatrix}\n')

%% Table data
if int == 1
    fprintf('\t%d ',table(1,1))
    for i = 2:col
        fprintf('& %d ',table(1,i))
    end
    fprintf('\\\\\n')
    
    for i = 2:row
        fprintf('\t%d ',table(i,1))
        for j= 2:col
            fprintf('& %d ',table(i,j))
        end
        fprintf('\\\\\n')
    end
else
    fprintf('\t%0.4f ',table(1,1))
    for i = 2:col
        fprintf('& %0.4f ',table(1,i))
    end
    fprintf('\\\\\n')
    
    for i = 2:row
        fprintf('\t%0.4f ',table(i,1))
        for j= 2:col
            fprintf('& %0.4f ',table(i,j))
        end
        fprintf('\\\\\n')
    end
end

%% Footer
fprintf('\\end{bmatrix}')
