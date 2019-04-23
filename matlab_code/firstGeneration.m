function [pop] = firstGeneration(input,n)
for i=1:n
    pop(i,:,:)=createAPlan(input);
end
end

