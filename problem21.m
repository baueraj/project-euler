%Andrew Bauer
%091513

clear all

%% PROBLEM

% Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
% If d(a) = b and d(b) = a, where a ? b, then a and b are an amicable pair and each of a and b are called amicable numbers.
% 
% For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. 
% The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
% 
%->Evaluate the sum of all the amicable numbers under 10000.

%% GO 

tic

storeSums = nan(9999,1);

for x = 2:9999
    
    smallestNon1Div = 2;
    while 1        
        if ~mod(x,smallestNon1Div)
            break
        elseif smallestNon1Div == round(x/smallestNon1Div) || smallestNon1Div == round(x/smallestNon1Div) - 1
            smallestNon1Div = x;
            break
        else
            smallestNon1Div = smallestNon1Div + 1;
        end
    end
    
    storeSums(x) = sum(find(~mod(x,1:(x/smallestNon1Div))));
end

mat = [transpose(1:9999) storeSums];
matFlipLR = fliplr(mat);

amicNosCandidates = mat(ismember(mat,matFlipLR,'rows'),:);
identicals = find(amicNosCandidates(:,1) == amicNosCandidates(:,2));
amicNosCandidates(identicals,:) = [];
amicNosSum = sum(amicNosCandidates(:,1));

toc

disp(strcat(mfilename,': done'));

%% NOTES

%Elapsed time is 1.097608 seconds. 