%Andrew Bauer
%083113

clear all

%% PROBLEM

%The sum of the squares of the first ten natural numbers is,

%1^2 + 2^2 + ... + 10^2 = 385
%The square of the sum of the first ten natural numbers is,

%(1 + 2 + ... + 10)^2 = 552 = 3025
%Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 ? 385 = 2640.

%->Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

%% GO 

tic

nos = 1:100;

sumSquares = sum(nos .* nos);

squareOfSum = sum(nos) * sum(nos);

differ = squareOfSum - sumSquares;

disp(strcat(mfilename,': done'));

%% NOTES
