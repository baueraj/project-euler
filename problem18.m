%Andrew Bauer
%092213

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
bigMatMod = bigMat(:,2:end);

flag = 1;
i = 1;

while 1
    
    bigMatModNew = zeros(size(bigMatMod,1),(size(bigMatMod,2)-1)/2); 
   
    for x_col = 1:2:(size(bigMatMod,2)-1)
        for x_el = 1:sum(bigMatMod(:,x_col) > 0)
            y_el_ind = (x_el * (2^i)) - ((2^i) - 1);
            x_el2_ind = (x_el * 2^(i-1)) - ((2^(i-1)) - 1);
            bigMatModNew(y_el_ind:(y_el_ind + (2^i)) - 1,ceil(x_col/2)) = ...
                repmat(bigMatMod(x_el,x_col),1,(2^i))' + bigMatMod(x_el2_ind:(x_el2_ind + (2^i)) - 1,x_col+1);
        end
    end
            
    if size(bigMatModNew,1) == 1
        flag = 0;
        break
    else
        bigMatMod = bigMatModNew(:,2:end);
        i = i + 1;
    end
end

toc

disp(strcat(mfilename,': done'));

%% NOTES

% Elapsed time...
%
% variable names are rather bad... some of them anyway

%% CODE NEXT: COLLECTION OF FIRST COLUMNS!