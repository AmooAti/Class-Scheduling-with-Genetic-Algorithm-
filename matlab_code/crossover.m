function [pop] = crossover(fit,n,pop,pc,numberOfTimes)
%% selection
[~,ind]=sort(fit);
%% crossover
c = round(n/2);
vector = randperm(n/2)+c;
for i=1:2:c
        p1=vector(i);
        p2=vector(i+1);
    
    if(rand()<=pc)
        
        rg=randi([1 numberOfTimes],1,1);

        pop(ind(i),:,:)=pop(ind(p1),:,:);
        pop(ind(i),rg,:)=pop(ind(p2),rg,:);
    end  
end
return;

