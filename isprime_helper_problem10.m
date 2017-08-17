function decision = isprime_helper_problem10(testNo)

    for x = 2:testNo-1 %initial upper bound, but will be adjusted externally
        if testNo == 2
            decision = 1;
            return
        elseif ~mod(testNo/x,1)
            decision = 0;
            return
        end
        
        if x == round(testNo/x) || x == round(testNo/x) - 1 %pretty sure that I don't need this last conditional "-1" here...
            decision = 1;
            return
        end        
    end
    decision = 1;    
end