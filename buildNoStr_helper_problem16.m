function builtNoStr = buildNoStr_helper_problem16(startNoStr)

nextNoStr = 2 * startNoStr;

for i = numel(nextNoStr):-1:1
    currDig = nextNoStr(i);
    
    if i == numel(nextNoStr)
        currDigStr = num2str(currDig);
        if numel(currDigStr) > 1
            digCarry = str2num(currDigStr(1:end-1));
        else
            digCarry = 0;
        end
        builtNoStr = str2num(currDigStr(end));
    elseif i < numel(nextNoStr) && i > 1
        currDig = digCarry + currDig;
        currDigStr = num2str(currDig);
        if numel(currDigStr) > 1
            digCarry = str2num(currDigStr(1:end-1));
        else
            digCarry = 0;
        end
        builtNoStr = [str2num(currDigStr(end)) builtNoStr];
    else
        currDig = digCarry + currDig;
        builtNoStr = [(num2str(currDig) - '0') builtNoStr];
    end
end