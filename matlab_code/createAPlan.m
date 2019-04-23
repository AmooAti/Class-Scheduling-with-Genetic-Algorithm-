function [pop] = createAPlan(input)
    courseSize=size(input.p,1);
    classSize=size(input.c,1);
    labSize=size(input.l,1);

    numberOfTimes=0; % tedad timehaye kole kelasa
    for i=1:courseSize % tedad dars
        for t=1:input.p(i,3) % tedad dars dar hafte
            numberOfTimes=numberOfTimes+1; % 
            if(input.p(i,1)==false)
                pop(numberOfTimes,:)=[input.p(i,5),0,randi([1 classSize(1)],1,1),randi([1 6],1,1),randi([1 input.nop],1,1),input.p(i,4),i];
            else
                pop(numberOfTimes,:)=[input.p(i,5),1,randi([1 labSize(1)],1,1),randi([1 6],1,1),randi([1 input.nop],1,1),input.p(i,4),i];
            end
        end
    end
end

