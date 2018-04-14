function [index] = findIndexOfValue(array, value)
    
    N = max(size(array));
    minDiff = abs(value - array(1));
    index = 1;
    for i = 2 : N
        if minDiff > abs(value - array(i))
            minDiff = abs(value - array(i));
            index = i;
        end
    end


end