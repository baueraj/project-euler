%Andrew Bauer
%083113

clear all

%% PROBLEM

%2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

%->What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

%% GO 

tic

testNos = [3 6 7 8 9 11 12 13 14 15 16 17 18 19];

flag = 1;
multi20 = 127;

while flag
    flag2 = 0;
    
    currNo = 20 * multi20;
    for x_i = 1:numel(testNos)
        x = testNos(x_i);
        
        if currNo/x ~= round(currNo/x)
            flag2 = 1;
            break
        end
    end
    
    if flag2
        multi20 = multi20 + 1;
    else
        flag = 0;
    end
end

toc

disp(strcat(mfilename,': done'));

%% NOTES

%started at >2520 product of 20 and x because likely 2520 isn't the
%answer... although this is a shortcut (and I double-checked), although it
%*is* a highly negligible shortcut

%don't need to test all numbers if searching by 20 * x

%annoying that "break" doesn't work as it really should... it exits current
%loop but "along the way to the exit", remaining commands are executed --
%they should be skipped...

%Elapsed time is 2.595422 seconds