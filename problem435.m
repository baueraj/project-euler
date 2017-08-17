%Andrew Bauer
%090713

clear all

%% PROBLEM

% SEE ONLINE

%% GO 

tic

sum_ = 2;
prevNum_m2 = 2;
prevNum_m1 = 3;

xTerm = 0;

for n = 1:10^15
    b=5;
end


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

%% NOTES

%