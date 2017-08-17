%Andrew Bauer
%092113

%% PROBLEM

% The Fibonacci sequence is defined by the recurrence relation:

% Fn = Fn?1 + Fn?2, where F1 = 1 and F2 = 1.
% Hence the first 12 terms will be:
% 
% F1 = 1
% F2 = 1
% F3 = 2
% F4 = 3
% F5 = 5
% F6 = 8
% F7 = 13
% F8 = 21
% F9 = 34
% F10 = 55
% F11 = 89
% F12 = 144
% The 12th term, F12, is the first term to contain three digits.
% 
%->What is the first term in the Fibonacci sequence to contain 1000 digits?


%% GO 

tic

stor = [1; 1];
prevNum_m2 = 1;
prevNum_m1 = 1;

for x = 1:10000
    
    nextNum = prevNum_m2 + prevNum_m1;
    
    stor = [stor; nextNum];
    
    prevNum_m2 = prevNum_m1;
    prevNum_m1 = nextNum;
end

toc

disp(strcat(mfilename,': done'));

%% NOTES

%Used a formula from Wikipedia and, based on empirical evidence from
%comparing formula with my computed results, was able to guess with high
%confidence which term it is

% Elapsed time is 0.129690 seconds.
% temp: done
% storDig = 1+floor(log10(stor)+eps);
% changeDig = cell2mat(arrayfun(@(i) sum(storDig == i),storDigUnique,'uniformoutput', false));
% ??? Undefined function or variable 'storDigUnique'.
%  
% storDigUnique = unique(storDig);
% changeDig = cell2mat(arrayfun(@(i) sum(storDig == i),storDigUnique,'uniformoutput', false));

% find(storDig == 302)
% 
% ans =
% 
%         1442
%         1443
%         1444
%         1445
%         1446
% 
% find(storDig == 301)
% 
% ans =
% 
%         1438
%         1439
%         1440
%         1441
% 
% 1000/.209
% 
% ans =
% 
%   4.7847e+003
% 
% ceil(1000/.209)
% 
% ans =
% 
%         4785
% 
% find(storDig == 306)
% 
% ans =
% 
%         1462
%         1463
%         1464
%         1465
% 
% ceil(306/.209)
% 
% ans =
% 
%         1465

%OK, so ceil(x/.209) produces a number of digits, then subtract 3 to get the
%answer (i.e. the FIRST Fib term i.e. index with that same no. of digits)