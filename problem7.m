%Andrew Bauer
%083113

clear all

%% PROBLEM

%By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

%->What is the 10 001st prime number?

%% GO 

tic

flag = 1;
x = 14; %start no.
collectPrimes = [2 3 5 7 11 13]';

while flag
    if isprime_helper_problem3(x)
        collectPrimes = [collectPrimes; x];
    end
    
    if numel(collectPrimes) == 10001
        break
    else
        x = x + 1;
    end
end

prime10001 = collectPrimes(end);

toc

disp(strcat(mfilename,': done'));

%% NOTES

%Elapsed time is 53.009244 seconds.