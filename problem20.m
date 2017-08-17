%Andrew Bauer
%091513

clear all

%% PROBLEM

%n! means n × (n ? 1) × ... × 3 × 2 × 1

% For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
% and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
% 
%->Find the sum of the digits in the number 100!

%% GO 

tic

multiplyTo = [3628800];
currBuildStr = [3 6 2 8 8 0 0];

for x = 12:2:100
    multiplyTo = [multiplyTo; round(factorial(x)/prod(multiplyTo(1:numel(multiplyTo))))];
    
    currBuildStr = buildNoStr_helper_problem20(sum(repmat(currBuildStr,multiplyTo(end),1),1));
end

toc

disp(strcat(mfilename,': done'));

%% NOTES

%Elapsed time is 0.932828 seconds.

%don't have to multiply by 10 or 100, but did anyway (because these just
%add 0s)

%borrowed core code from problem 16 helper function (and that was derived
%from problem 13 helper function)

%DON'T REALLY NEED TO BUILD/STORE "MULTIPLYTO" MATRIX! JUST USE LAST
%RESULT!