%Andrew Bauer
%091413

clear all

%% PROBLEM

%You are given the following information, but you may prefer to do some research for yourself.
% 
% 1 Jan 1900 was a Monday.
% Thirty days has September,
% April, June and November.
% All the rest have thirty-one,
% Saving February alone,
% Which has twenty-eight, rain or shine.
% And on leap years, twenty-nine.
% A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

%->How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

%% GO 

tic

yr1900 = zeros(1,30*4 + 28 + 31*7);

nonLeapYr = [[1 zeros(1,30)]...
             [1 zeros(1,27) nan]...
             [1 zeros(1,30)]...
             [1 zeros(1,29)]...
             [1 zeros(1,30)]...
             [1 zeros(1,29)]...
             [1 zeros(1,30)]...
             [1 zeros(1,30)]...
             [1 zeros(1,29)]...
             [1 zeros(1,30)]...
             [1 zeros(1,29)]...
             [1 zeros(1,30)]];
         
leapYr =    [[1 zeros(1,30)]...
             [1 zeros(1,28)]...
             [1 zeros(1,30)]...
             [1 zeros(1,29)]...
             [1 zeros(1,30)]...
             [1 zeros(1,29)]...
             [1 zeros(1,30)]...
             [1 zeros(1,30)]...
             [1 zeros(1,29)]...
             [1 zeros(1,30)]...
             [1 zeros(1,29)]...
             [1 zeros(1,30)]];
         
oneHundYrs = repmat(nonLeapYr,100,1);     
leapInd = mod((1:100)/4,1) == 0;
oneHundYrs(leapInd,:) = repmat(leapYr,sum(leapInd),1);

oneHundYrs = transpose(oneHundYrs);
oneHundYrs = oneHundYrs(:);

oneHundOneYrs = [transpose(yr1900); oneHundYrs];
oneHundOneYrs = oneHundOneYrs(~isnan(oneHundOneYrs));
noSundays = sum(oneHundOneYrs(7:7:end));

toc

disp(strcat(mfilename,': done'));

%% NOTES

%Elapsed time is 0.030111 seconds.

%efficient, no loops, very good -- but, as someone posted, it doesn't take
%code:

% 100 years is 1200 months
% 
% 1200 / 7 is 171

%me: well, technically it's 171.4286, but rounded down, yes, because the
%total no. of months is slightly higher than 1200 (like 1200.x)