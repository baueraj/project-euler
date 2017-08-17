%Andrew Bauer
%090913

clear all

%% PROBLEM

%If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

%->If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

% NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 
%(one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

%% GO 

tic

leadNos = [3 3 5 4 4 3 5 5 4];
andNo = 3;
hundredNo = 7;
oneThousNo = 11;

[~,txt]=xlsread('./numberList.xlsx');

storeBasicChars = '';

for i = 1:numel(txt)
    iWord = strtrim(txt{i});
    if strcmp('',iWord)
    else
       storeBasicChars = strcat(storeBasicChars,iWord);
    end
end

basicCount = numel(storeBasicChars);
count =  basicCount + oneThousNo;

for i = 1:9
    count = count + hundredNo + leadNos(i) + basicCount + ((leadNos(i) + hundredNo + andNo)*99);
end

toc

disp(strcat(mfilename,': done'));

%% NOTES

%Elapsed time is 0.425366 seconds.

%pretty ridiculous approach but oh well