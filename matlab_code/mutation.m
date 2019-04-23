function [pop] = mutation(input,pop,n,numberOfTimes,pm,classSize,labSize)
for i=1:n
    if(rand()<=pm)
        rg=randi([1 numberOfTimes],1,1);
        if(pop(i,rg,2)==0) %class
            pop(i,rg,:)=[pop(i,rg,1),0,randi([1 classSize],1,1),randi([1 6],1,1),randi([1 input.nop],1,1),pop(i,rg,6),pop(i,rg,7)];
        else % lab
            pop(i,rg,:)=[pop(i,rg,1),1,randi([1 labSize],1,1),randi([1 6],1,1),randi([1 input.nop],1,1),pop(i,rg,6),pop(i,rg,7)];
        end
    end
    
end

