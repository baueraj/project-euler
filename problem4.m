%Andrew Bauer
%083113

clear all

%% PROBLEM

%A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

%->Find the largest palindrome made from the product of two 3-digit numbers.

%% GO 

tic

storeProd = [];

chain = 100:999;

for x = 100:999
    ind = x-100+1;
    for y = chain(ind):999
        prod_ = x * y;
        prodExpand = num2str(prod_) - '0';
        if ~mod(numel(prodExpand),2)
            firstHalf = prodExpand(1:end/2);
            secondHalf = prodExpand(end/2+1:end);
            if isequal(fliplr(firstHalf),secondHalf)
                storeProd = [storeProd; prod_];
            end
        end
    end
end

largest = max(storeProd);

toc

disp(strcat(mfilename,': done'));

%% NOTES

%I really like this trick: prodExpand = num2str(prod_) - '0';

%this gives no. of digits of an int: floor(log10(x)) + 1

%needs to be much more efficient, currently clocked at 36.859775 seconds on
%old Justin laptop