%Andrew Bauer
%083113

clear all

%% PROBLEM

%The prime factors of 13195 are 5, 7, 13 and 29.

%->What is the largest prime factor of the number 600851475143 ?

%% GO 

tic

factoriseNo = 600851475143;
flag = 1;
x = 2; %start no.

while flag
    if isprime_helper_problem3(x)
        if ~mod(factoriseNo/x,1)
            if isprime_helper_problem3(factoriseNo/x)
                maxFactor = factoriseNo/x;                
            else
                maxFactor = recur_helper_problem3(factoriseNo/x);
            end
            flag = 0;
        end
    end    
    x = x + 1;
end

toc

disp(strcat(mfilename,': done'));

%% NOTES

%find x where mod(600851475143/x,1) == 0 and where x is prime, then
%determine whether 600851475143/x is prime, if not break it up recursively,
%until arrive at y[n]/x[n] of n recursive calls and return that prime --
%don't have to keep a record of previous primes because guaranteed to
%return largest prime? I think so...

%Elapsed time is 0.041979 seconds. 
%my method is very fast apparently, but surely there is a better method. Saw 
%a method on the forums that looked really elegant, here it is:

% 31 Aug 2013 08:02 pm 
% harsh_star
% Java  
% India	
%    Quote    0
% The solution to the problem is the last number displayed in the output screen. As the number is too large it will take a long time to end the execution of the program. We should not wait for the program to end because we have already got the result in the starting of the running of the program. The source code is :
% Java
% 
% class largest_prime_factor
% {
% public static void main()
% {
% double n=600851475143.0,h=0.0,a=0;
% for(double i=1.0;i<n;i++)
% {
% if(n%i==0)
% for(double j=1.0;j<=i;j++)
% {
% if(i%j==0)
% h++;
% }
% if(h==2)
% {
% a=i;
% System.out.println(a);
% }
% h=0;
% }
% }}