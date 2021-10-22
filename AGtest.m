%主函数
clear all 
close all
clc

N=30; % 种群数量

Function_name='F5'; % 适应度函数

T=500; % 最大迭代次数

dimSize = 30;   %维度


[lb,ub,dim,fobj]=Get_Functions(Function_name,dimSize);


% SMA
[Destination_fitness,bestPositions,Convergence_curve]=SMA(N,T,lb,ub,dim,fobj);

%HHO
[Rabbit_Energy,Rabbit_Location,CNVG]=HHO(N,T,lb,ub,dim,fobj);

%SMAOPT
[Destination_fitness_SMAOPT,bestPositions_SMAOPT,Convergence_curve_SMAOPT]=SMAOPT(N,T,lb,ub,dim,fobj);
% PSO
% [fym,ym,record]=PSO(N,T,lb,ub,dim,fobj);

%Draw objective space
figure,
hold on
semilogy(Convergence_curve,'Color','b','LineWidth',1);
semilogy(CNVG,'Color','r','LineWidth',1);
% semilogy(record,'Color','g','LineWidth',1);
semilogy(Convergence_curve_SMAOPT,'Color','yellow','LineWidth',1);
title('Convergence curve')
xlabel('Iteration');
ylabel('Best fitness obtained so far');
axis tight
grid off
box on
legend('SMA','HHO','SMAOPT')

display(['SMA最优种群： ', num2str(bestPositions)]);
display(['SMA最优适应度 ', num2str(Destination_fitness)]);

display(['HHO最优种群: ', num2str(Rabbit_Location)]);
display(['HHO最优适应度: ', num2str(Rabbit_Energy)]);
        
display(['SMAOPT最优种群: ', num2str(bestPositions_SMAOPT)]);
display(['SMAOPT最优适应度: ', num2str(Destination_fitness_SMAOPT)]);

% display(['PSO最优种群: ', num2str(ym)]);
% display(['PSO最优适应度: ', num2str(fym)]);
