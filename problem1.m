%Andrew Bauer
%083013

%% PROBLEM

%If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
%->Find the sum of all the multiples of 3 or 5 below 1000.

%% GO 

sum_ = 0;

for x = 3:999
   
    if x/3 == round(x/3) || x/5 == round(x/5)
        sum_ = sum_ + x;
    end
end

disp(strcat(mfilename,': done'));