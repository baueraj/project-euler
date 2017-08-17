function maxFactor = recur_helper_problem3(factoriseNo)
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
end