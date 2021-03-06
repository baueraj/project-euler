%Andrew Bauer
%083013

%% PROBLEM

%Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

%1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

%->By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

%% GO 

tic

sum_ = 2;
prevNum_m2 = 2;
prevNum_m1 = 3;

while 1
    
    nextNum = prevNum_m2 + prevNum_m1;
    
    if nextNum > 4000000
        break
    end
   
    if ~mod(nextNum,2)
        sum_ = sum_ + nextNum;
    end
    
    prevNum_m2 = prevNum_m1;
    prevNum_m1 = nextNum;
end

toc

disp(strcat(mfilename,': done'));