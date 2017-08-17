%Andrew Bauer
%090513

clear all

%% PROBLEM

%2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

%->What is the sum of the digits of the number 2^1000?

%% GO 

tic

%in binary, 2^1000 = [1 zeros(1,999)] (vector format)

buildNoVec = [1 6];

for i = 5:1000
    buildNoVec = buildNoStr_helper_problem16(buildNoVec);
end

toc

disp(strcat(mfilename,': done'));

%% NOTES

%Elapsed time is 21.154666 seconds.

%well, kind of efficient, I guess -- ended up borrowing code from problem
%13 to build that function, although I didn't really need a function