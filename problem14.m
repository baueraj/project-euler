%Andrew Bauer
%090413

clear all

%% PROBLEM

%The following iterative sequence is defined for the set of positive integers (sub -> for ? symbol):

% n ? n/2 (n is even)
% n ? 3n + 1 (n is odd)

% Using the rule above and starting with 13, we generate the following sequence:

% 13 ? 40 ? 20 ? 10 ? 5 ? 16 ? 8 ? 4 ? 2 ? 1
% It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

%->Which starting number, under one million, produces the longest chain?
%->NOTE: Once the chain starts the terms are allowed to go above one million.

%% GO 

tic

%2nd column is ID, always there
nos = [1:999999; 1:999999]';
count = 0; %out of curiosity

flag = 1;
while flag
    
    count = count + 1;
    
    evens = mod(nos(:,1),2) == 0;
    
    nos(evens,1) = nos(evens,1)/2;
    nos(~evens,1) = 3 * nos(~evens,1) + 1;

    nos = nos(nos(:,1) ~= 1,:);
    
    if size(nos,1) == 1;
        flag = 0;
    end
end
    
toc

disp(strcat(mfilename,': done'));

%% NOTES

%Elapsed time is 17.862159 seconds
%Elapsed time is 6.472455 seconds on my CCBI computer