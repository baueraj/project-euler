%Andrew Bauer
%090813

clear all

%% PROBLEM

%***SEE ONLINE PICTURE***

%% GO 

tic

bigMat = ones(21,21);
bigMat(2:end,2) = 2:21; %don't mind last row
bigMat(2,2:end) = 2:21; %don't mind last column

for x = 21*2+3:numel(bigMat)
    [i,j] = ind2sub(size(bigMat),x);
    
    if i < 3
        continue
    else
        bigMat(x) = bigMat(i,j-1) + bigMat(i-1,j);
    end
end

toc

disp(strcat(mfilename,': done'));

%% NOTES

%Elapsed time is 0.062783 seconds.

%did this mostly "paper/pencil" or in my head, i.e. figured out the rule,
%but wrote the code to do it (all those damned sums!).

%I'm happy to say that this is very efficient code, I believe! Or at least
%the rule is simple and elegant!

%UPDATE: someone (well, apparently a lot) on the forum points out that this is a combinatorics
%question:

%Since we cannot backtrack along lattice, the problem can be treated vectorially, there must be 20 down moves and 20 right moves to get to the destination, i.e. 40 moves for EVERY possible path. The problem boils down to the question; "Out of a binary string 40 digits long, how many possible ways are there to insert 20 '1s' into this string - leaving the rest '0s'?" The answer is a simple case of combinatorics (40C20). I apologize for using MATLAB (boo hiss) as my programming language as the solution for me was; "answer = nchoosek(40,20)", which solved the problem in 25 milliseconds.