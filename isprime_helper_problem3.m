function decision = isprime_helper_problem3(testNo)

    for x = 2:testNo-1
        if testNo == 2
            decision = 1;
            return
        elseif ~mod(testNo/x,1)
            decision = 0;
            return
        end        
    end
    decision = 1;    
end