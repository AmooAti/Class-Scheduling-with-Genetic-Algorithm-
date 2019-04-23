function showResults(input,best_ans,best_so_far,average_fitness,numberOfTimes,classSize,labSize,iter)
fprintf('best fitness = %d\n\n\n',best_so_far(end));

for i=1:classSize
    
    disp(['Class',num2str(i)]);
    fprintf('        ');
    for j=1:input.nop
        fprintf('          time %d           ',j);
    end
    fprintf('\n');
    for j=1:6
        fprintf('day   %d',j);
        for k=1:input.nop
            l_id=0;
            t_id=0;
            for s=1:numberOfTimes
                if(best_ans(s,2)==0 && best_ans(s,3)==i && best_ans(s,4)==j && best_ans(s,5)==k)
                    l_id=best_ans(s,7);
                    t_id=best_ans(s,6);
                    break;
                end
            end
            
            if(l_id==0)
                fprintf('            --             ');
            else
                fprintf('  lecture %d - professor %d  ',l_id,t_id);
            end
        end
        fprintf('\n');
    end
    
fprintf('\n');
end

fprintf('\n\n\n\n');
for i=1:labSize
    disp(['Lab',num2str(i)]);
    fprintf('        ');
    for j=1:input.nop
        fprintf('          time %d           ',j);
    end
    fprintf('\n');
    for j=1:6
        fprintf('day   %d',j);
        for k=1:input.nop
            l_id=0;
            t_id=0;
            for s=1:numberOfTimes
                if(best_ans(s,2)==1 && best_ans(s,3)==i && best_ans(s,4)==j && best_ans(s,5)==k)
                    l_id=best_ans(s,7);
                    t_id=best_ans(s,6);
                    break;
                end
            end
            
            if(l_id==0)
                fprintf('            --             ');
            else
                fprintf('  lecture %d - professor %d  ',l_id,t_id);
            end
        end
        fprintf('\n');
    end
    

end

fprintf('\n\n\n\n');


x=1:100;
p = plot(x,best_so_far,'m',x,average_fitness,'.b');
p(1).LineWidth = 2.25;
p(2).LineWidth = 1.5;
xlabel('Generation');
ylabel('Fitness Function');
legend('Max Fitness','Mean Fitness');



