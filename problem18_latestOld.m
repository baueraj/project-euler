%Andrew Bauer
%092113

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

addColumnStep = 0:15:(15*size(bigMat,2)-1);
maxHierarchy = [];
maxHierarchyVals = [];

count = 0; %to see how many max iterations needed, not necessary for algorithm to run

while flag

    [maxVals, indOrig_tmp] = max(bigMat);
    indOrig = addColumnStep + indOrig_tmp;
    [i, ~] = ind2sub(size(bigMat),indOrig);

    maxHierarchy = [maxHierarchy; i]; 
    maxHierarchyVals = [maxHierarchyVals; maxVals];
    
    clear maxHierarchyAccum maxHierarchyValsAccum

    for pairs_i = 1:14
        
        if pairs_i == 1
            pairs_inds_1 = maxHierarchy(:,1);
            pairs_maxVals_1 = maxHierarchyVals(:,1);
            
            pairs_inds_2 = maxHierarchy(:,2);
            pairs_maxVals_2 = maxHierarchyVals(:,2);
        else
            pairs_inds_1 = maxHierarchyAccum(:,pairs_i);
            pairs_maxVals_1 = maxHierarchyValsAccum(:,pairs_i);
            
            pairs_inds_2 = maxHierarchy(:,pairs_i+1);
            pairs_maxVals_2 = maxHierarchyVals(:,pairs_i+1);
        end

        for x = 1:sum(pairs_maxVals_1 ~= 0)
    
            for y = 1:sum(pairs_maxVals_2 ~= 0)

                if abs(pairs_inds_1(x) - pairs_inds_2(y)) <= 1
                    
                    if ~exist('maxHierarchyAccum','var') || size(maxHierarchyAccum,2) < pairs_i+1
                        maxHierarchyAccum(1,pairs_i+1) = pairs_inds_2(y);
                        maxHierarchyValsAccum(1,pairs_i+1) = pairs_maxVals_1(x) + pairs_maxVals_2(y);
                    elseif any(find(maxHierarchyAccum(:,pairs_i+1) == 0))
                        zeroInd = find(maxHierarchyAccum(:,pairs_i+1) == 0);
                        maxHierarchyAccum(zeroInd(1),pairs_i+1) = pairs_inds_2(y);
                        maxHierarchyValsAccum(zeroInd(1),pairs_i+1) = pairs_maxVals_1(x) + pairs_maxVals_2(y);
                    else
                        maxHierarchyAccum(end+1,pairs_i+1) = pairs_inds_2(y);
                        maxHierarchyValsAccum(end+1,pairs_i+1) = pairs_maxVals_1(x) + pairs_maxVals_2(y);
                    end
                end                
            end
        end
        
        if size(maxHierarchyAccum,2) < pairs_i+1
            bigMat(indOrig) = 0;
            count = count + 1;
            break
        end        
    end
    
%     if size(maxHierarchyValsAccum,2) == size(bigMat,2)
    if size(maxHierarchyVals,1) >= 15
        flag = 0;
    else
        bigMat(indOrig) = 0;
        count = count + 1;
    end
end
    
toc

disp(strcat(mfilename,': done'));

%% NOTES

%