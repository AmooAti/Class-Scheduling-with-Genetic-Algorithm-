clc;
clear;
close all;

%% ga parameters
n=20; %  pop size
iter=100; %  iterations
pc=0.8; 
pm=0.2;

%% 

input.nop=6; %number of time slots in a day
class=false;
lab=true;

%% doros
% input.p(count,:)=[class ya lab, tedad daneshjoyan, tedad class dar hafte, id ostad, id dars]
input.p(1,:)=[class,20,2,1,1];
input.p(2,:)=[class,50,1,1,2];
input.p(3,:)=[lab,15,1,1,3];
input.p(4,:)=[class,30,2,2,4];
input.p(5,:)=[class,30,1,2,5];
input.p(6,:)=[lab,20,1,2,6];
input.p(7,:)=[class,40,2,2,2];
input.p(8,:)=[class,50,3,2,2];
input.p(9,:)=[class,40,2,1,7];
input.p(10,:)=[class,20,4,1,15];

%% class ha
% input.c(count,:)=zarfiyate class;
% input.l(count,:)=zarfiyate azmayeshgah;
input.c(1,:)=30;
input.c(2,:)=50;
input.l(1,:)=30;

%% asatid (ba time haye pishnahadi)
% input.t(count,:,:)={[roz, saat]};
input.t(1,:,:)={[1,1;2,4]};
input.t(2,:,:)={[2,2;5,4;3,1]};

%% generating first population
pop = firstGeneration(input,n);

%% calculate first generation fitness
fit=fitness(input,pop,n);

%% 

numberOfTimes=size(pop(1,:,:),2);
classSize=size(input.c,1);
labSize=size(input.l,1);
best_so_far = NaN(1,iter);
average_fitness = NaN(1,iter);
%% Ga Main loop

for it=1:iter
    
    %% crossover
    [pop] = crossover(fit,n,pop,pc,numberOfTimes);
    
    %% mutation
    [pop] = mutation(input,pop,n,numberOfTimes,pm,classSize,labSize);
        
    %% calculate fitness
    fit=fitness(input,pop,n);
        
    %% best solution & fitness util current iteration
    [max_fit,max_loc_ind]=max(fit);
    
    
    if it==1 || max_fit > best_so_far(it-1)
        best_so_far(it)=max_fit;
        best_ans(:,:)=pop(max_loc_ind,:,:);
    else
        best_so_far(it) = best_so_far(it-1);
    end
    
    %% average fitness in every iteration
    average_fitness(it)=mean(fit);
      
    
end

numberOfTimes=size(best_ans,1);

showResults(input,best_ans,best_so_far,average_fitness,numberOfTimes,classSize,labSize,iter);