%Andrew Bauer
%090713

clear all

%% PROBLEM

% SEE ONLINE

%% GO 

tic

max=10^10;
n=zeros(max,1);
n(1)=0;
n(2)=1;

for i=3:max
    n(i)=n(i)+n(i-1)+n(i-2);
end

toc

save 

disp(strcat(mfilename,': done'));

%% NOTES

%