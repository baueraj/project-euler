%Andrew Bauer
%083113

clear all

%% PROBLEM

%A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

%a^2 + b^2 = c^2
%For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

%There exists exactly one Pythagorean triplet for which a + b + c = 1000.
%->Find the product abc.

%% GO 

tic

for a = 1:1000
    for b = (a+1):1000
        for c = (b+1):1000
            if a^2 + b^2 == c^2 && a + b + c == 1000
                prod_ = prod([a b c]);
                break
            end            
        end
        if exist('prod_','var')
            break
        end
    end
    if exist('prod_','var')
        break
    end
end

toc

disp(strcat(mfilename,': done'));

%% NOTES

%by the sum constraint ALONE, max value of c = 997, thus a = 1, b = 2
%however, this is not optimally constrained by the triplet rule, because
%997^2 >> a^2 + b^2
%thus, need a max value of c which is also optimally constrained by triplet rule
%SO I COULD MAKE THIS MORE EFFICIENT THAN ABOVE

%Elapsed time is 7.044907 seconds.