%Andrew Bauer
%083113

clear all

%% PROBLEM

%The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

%->Find the sum of all the primes below two million.

%% GO 

tic

%sum_ = 2; %or engage format long for precision for continuous sum with
%forgetting previous primes
collectPrimes = 2;

for x = 3:2:1999999
    if isprime_helper_problem10(x) %more efficient search
        %sum_ = sum_ + x;
        collectPrimes = [collectPrimes; x];
    end
end

toc

disp(strcat(mfilename,': done'));

format long %before summing the vector of primes

%% NOTES

%this was over a minute even on my new CCBI computer... so although I tried
%to make this more efficient, it wasn't efficient enough