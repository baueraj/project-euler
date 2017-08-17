function counted = countDivisors_helper_problem12(triNo)

    counted = 0;

%     if mod(triNo,2)    
%         for x = 1:2:triNo %initial upper bound, but will be adjusted externally
%             
%             if x >= round(triNo/x) || x == round(triNo/x) - 1 %pretty sure that I don't need this last conditional "-1" here...
%                 return
%             end
%             
%             if ~mod(triNo/x,1)
%                 counted = counted + 2;
%             end
%         end
%     else
        for x = 1:triNo %initial upper bound, but will be adjusted externally

            if x >= floor(triNo/x)
                return
            end 
            
            if ~mod(triNo/x,1)
                counted = counted + 2;
            end
        end
%      end
end