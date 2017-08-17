%Andrew Bauer
%090913

clear all

%% PROBLEM

%By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

% 3
% 7 4
% 2 4 6
% 8 5 9 3
% 
% That is, 3 + 7 + 4 + 9 = 23.
% 
%->Find the maximum total from top to bottom of the triangle below:

bigMatOrig=[75	0	0	0	0	0	0	0	0	0	0	0	0	0	0
            95	64	0	0	0	0	0	0	0	0	0	0	0	0	0
            17	47	82	0	0	0	0	0	0	0	0	0	0	0	0
            18	35	87	10	0	0	0	0	0	0	0	0	0	0	0
            20	4	82	47	65	0	0	0	0	0	0	0	0	0	0
            19	1	23	75	3	34	0	0	0	0	0	0	0	0	0
            88	2	77	73	7	63	67	0	0	0	0	0	0	0	0
            99	65	4	28	6	16	70	92	0	0	0	0	0	0	0
            41	41	26	56	83	40	80	70	33	0	0	0	0	0	0
            41	48	72	33	47	32	37	16	94	29	0	0	0	0	0
            53	71	44	65	25	43	91	52	97	51	14	0	0	0	0
            70	11	33	28	77	73	17	78	39	68	17	57	0	0	0
            91	71	52	38	17	14	91	43	58	50	27	29	48	0	0
            63	66	4	68	89	53	67	30	73	16	69	87	40	31	0
            4	62	98	27	23	9	70	98	73	93	38	53	60	4	23];

% NOTE: As there are only 16384 routes, it is possible to solve this problem 
% by trying every route. However, Problem 67, is the same challenge with a 
% triangle containing one-hundred rows; it cannot be solved by brute force, 
% and requires a clever method! ;o)

%% GO 

tic

bigMat = flipdim(rot90(bigMatOrig),1);

flag = 1;

maxHierarchy = [];
maxHierarchyVals = [];

addColumnStep = 0:15:(15*size(bigMat,2)-1);

count = 0;

while flag

    storeAdds = [75 0; 95+75 64+75]' ;
    storeAdds = cat(3,storeAdds,[1 0; 1 2]');
    %storeAdds = cat(3,storeAdds,[0; 95]');
    
    [maxVals, indOrig_tmp] = max(bigMat);
    indOrig = addColumnStep + indOrig_tmp;
    [i, ~] = ind2sub(size(bigMat),indOrig);
    
    %never more than two repeat, so safe to use this block of code:
    flag_extra = 0;
    i_extra = [];
    maxVals_extra = [];store
    for max_i = 1:numel(maxVals)
        findTemp = find(bigMat(:,max_i) == maxVals(max_i));
        if numel(findTemp) > 1 && maxVals(max_i) ~= 0           
            indExtra = setdiff(findTemp, indOrig_tmp(max_i));
            i_extra = [i_extra indExtra];
            maxVals_extra = [maxVals_extra maxVals(max_i)];
            flag_extra = 1;
        else
            i_extra = [i_extra nan];
            maxVals_extra = [maxVals_extra nan];
        end
    end

    if flag_extra
        
        maxHierarchy = [maxHierarchy; i]; 
        maxHierarchy = [maxHierarchy; i_extra]; 
        maxHierarchyVals = [maxHierarchyVals; maxVals];
        maxHierarchyVals = [maxHierarchyVals; maxVals_extra];
        tempExtraIndOrig = addColumnStep + i_extra;
        removeInd = [indOrig tempExtraIndOrig(~isnan(tempExtraIndOrig))];
    else
        maxHierarchy = [maxHierarchy; i]; 
        maxHierarchyVals = [maxHierarchyVals; maxVals];
        removeInd = indOrig;
    end

    for x = 2:size(maxHierarchy,2)-1
        inds = maxHierarchy(~isnan(maxHierarchy(:,x)),x);
        vals = maxHierarchyVals(~isnan(maxHierarchyVals(:,x)),x);
        
        indsPls1 = maxHierarchy(:,x+1);
        valsPls1 = maxHierarchyVals(:,x+1);
        
        for y = 1:numel(inds)
            if vals(y) == 0
                continue
            end
            
            for z = 1:numel(indsPls1);
                if abs(inds(y) - indsPls1(z)) <= 1
                    indTemp = find(storeAdds(:,x,2) == inds(y));
                    for x2 = 1:numel(indTemp)
                        addIt = indTemp(x2);
                        try
                            zeroInd = find(storeAdds(:,x+1,1) == 0);
                        catch
                            zeroInd = [];
                        end
                        if any(zeroInd)
                            storeAdds(zeroInd(1),x+1,1) = storeAdds(addIt,x,1) + valsPls1(z);
                            storeAdds(zeroInd(1),x+1,2) = indsPls1(z);
                        elseif size(storeAdds,2) < x+1
                            storeAdds(1,x+1,1) = storeAdds(addIt,x,1) + valsPls1(z);
                            storeAdds(1,x+1,2) = indsPls1(z);
                        else
                            storeAdds(size(storeAdds,1)+1,x+1,1) = storeAdds(addIt,x,1) + valsPls1(z);
                            storeAdds(size(storeAdds,1),x+1,2) = indsPls1(z);
                        end
                        %storeAdds(size(storeAdds,1),x+1,3) = vals(y);
                    end
                end
            end
        end
        
        if size(storeAdds,2) ~= x+1
            break
        end
    end
    
    if size(storeAdds,2) == size(bigMat,2)
        flag = 0;
    else
        bigMat(removeInd) = 0;
        count = count + 1;
    end
end
    
toc

disp(strcat(mfilename,': done'));

%% NOTES

%could make more efficient by not visiting 0's