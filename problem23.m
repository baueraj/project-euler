%Andrew Bauer
%092013

clear all

%% PROBLEM

% A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. 
% For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
% 
% A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
% 
% As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as 
% the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 
% can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further 
% by analysis even though it is known that the greatest number that cannot be expressed as 
% the sum of two abundant numbers is less than this limit.
% 
%->Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

%% GO 

tic

numLim = 28123;

storeSums = nan(numLim,1);

for x = 2:numLim - 12
    
    smallestNon1Div = 2;
    while 1        
        if ~mod(x,smallestNon1Div)
            break
        elseif smallestNon1Div == round(x/smallestNon1Div) || smallestNon1Div == round(x/smallestNon1Div) - 1 %FIGURE OUT IF NEED DOUBLE CHECK!
            smallestNon1Div = x;
            break
        else
            smallestNon1Div = smallestNon1Div + 1;
        end
    end
    
    storeSums(x) = sum(find(~mod(x,1:(x/smallestNon1Div))));
end

numList = (1:numLim)';

abunNums = numList(storeSums > numList);
sumsOfAbuns = cell2mat(arrayfun(@(identicals) abunNums + identicals, abunNums, 'uniformoutput', false));
sumsOfAbuns(sumsOfAbuns > numLim) = [];
nonSumsofAbuns = setdiff(1:numLim,sumsOfAbuns);

toc

disp(strcat(mfilename,': done'));

%% NOTES

%Elapsed time is 10.108848 seconds.

%derived code from problem 22
%inefficient because am needlessly doing a copy of each addition,
%and am producing sums that exceed the positive integer beyond which all
%positive integers can be written as a sum of two abundant numbers...
%however, by using arrayfun(), I may actually be more efficient...
%certainly more readable!

%apparently arrayfun() yields only unique values?... is this so? nice!
%so maybe it's not as inefficient (i.e. doesn't do copy of each addition)