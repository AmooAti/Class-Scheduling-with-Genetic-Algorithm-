function [fit,selection_probability] = fitness(input,pop,n)
    fit = NaN(n,1);
    numberOfTimes=size(pop(1,:,:),2);
    TimeNahatrNamaz=floor(input.nop/2);
    for i=1:n
        
        r4=0; % yek noee yek idclass yek roz yek saat 
        r3=0; % yek roz yek zaman yek ostad
        r2=0; % yek dars yek noee yek roz yek ostad 
        r6=0; %check kardane zarfiyate class va zarfiyate moteghaziyan
        r9=0; % to roz hich kelasi nabashe
        r10=0;  % ekhtelaf kelas haye yek hafte 3 ta bishtar bashe yani motevazen
        r12=0; % age class toye time mid bood 
        r14=0; % zarfiyate class chandtaei bishtar az sabt nam shode ha bashe
        r15=0; % toye ye shift class nabashe
        ar3=0; % time haye prefer ostada reaayat shode ya na
        ar2=0; %yek roz yek ostad yek dars

        
        days=zeros(6,1);
        beforeMid=0;
        afterMid=0;
        for j=1:numberOfTimes
            for k=j+1:numberOfTimes
                
                if(pop(i,j,2)==pop(i,k,2)&&pop(i,j,3)==pop(i,k,3)&&pop(i,j,4)==pop(i,k,4)&&pop(i,j,5)==pop(i,k,5))
                    r4=r4+1;
                end
                
                if(pop(i,j,1)==pop(i,k,1)&&pop(i,j,2)==pop(i,k,2)&&pop(i,j,4)==pop(i,k,4)&&pop(i,j,6)~=pop(i,k,6))
                    r2=r2+1;
                end
                
                if(pop(i,j,4)==pop(i,k,4) && pop(i,j,5)==pop(i,k,5) && pop(i,j,6)==pop(i,k,6))
                    r3=r3+1;
                end
                
                if(pop(i,j,4)==pop(i,k,4)&& pop(i,j,6)==pop(i,k,6) && pop(i,j,1)==pop(i,k,1))
                    ar2=ar2+1;
                end
                
            end
            
            if(pop(i,j,2)==0) %class
                if(input.c(pop(i,j,3))<input.p(pop(i,j,7),2))
                    r6=r6+1;
                end
                if((input.c(pop(i,j,3))-input.p(pop(i,j,7),2))>10)
                    r14=r14+1;
                end
            else %lab
                if(input.l(pop(i,j,3))<input.p(pop(i,j,7),2))
                    r6=r6+1;
                end
                if((input.l(pop(i,j,3))-input.p(pop(i,j,7),2))>10)
                    r14=r14+1;
                end
            end
           
            if(pop(i,j,5)==TimeNahatrNamaz)
                r12=r12+1;
            elseif(pop(i,j,5)>TimeNahatrNamaz)
                afterMid=afterMid+1;
            else
                beforeMid=beforeMid+1;
            end
            
            days(pop(i,j,4),1)=days(pop(i,j,4),1)+1;
           
            pdays=input.t{pop(i,j,6)};
            psize=size(pdays,1);
            for c=1:psize
                if(pdays(c,1)==pop(i,j,4) && pdays(c,2)==pop(i,j,5))
                    ar3=ar3+1; % cheghadr time haye prefer doros boode
                end
            end
        end
        
        
        for k=1:6
            if(days(k,1)<=1)
                r9=r9+1;
            end
        end
        if((max(max(days))-min(min(days)))>3)
            r10=1;
        end
        
        if(abs(afterMid-beforeMid)>3)
            r15=1;
        end

        ar3=max(0,(input.nop-ar3)); % cheghadr az time haye prefer baravarde nashode
        fit(i,1)=(-1*(((r2+r4+r6+r3)*20)+((r9+r10+r12)*2)+(r14+r15+ar2+ar3)));
    end
selection_probability = fit/sum(fit);
end