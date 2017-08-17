%Andrew Bauer
%090113

%On Intel Core 2 CPU, 2.33 GHz, 4 GB RAM, x64
%MATLAB Version 7.11.0.584 (R2010b)

clear all

%% PROBLEM

% A permutation is an ordered arrangement of objects. 
% For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. 
% If all of the permutations are listed numerically or alphabetically, 
% we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

%012   021   102   120   201   210

%->What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

%% GO 

tic

desiredIndStr = 1000000;
nos = 0:9; 
digLen = numel(nos);

buildStr = [];
indNo = 0;

for x = 1:digLen
    noFact = digLen - x;
    
    for y = 1:numel(nos) %necessary to have this other loop?
        indNo = indNo + factorial(noFact);
        
        if indNo >= desiredIndStr
            buildStr = [buildStr nos(y)];
            nos(y) = [];
            indNo = indNo - factorial(noFact);
            break
        end
    end
end

toc

disp(strcat(mfilename,': done'));

%% NOTES

%Elapsed time is 0.144720 seconds.