clear
clc
 
%% 以"Probability"的概率生成m×n的栅格图障碍物环境
Probability=0.2; % 设置障碍区概率(可自行更改)
m=30;n=30;       % 设置地图的大小(可自行更改)
 
R=rand(m,n);   % 初始化一个m×n的[0,1]之间随机矩阵，用来生成矩阵G
G=zeros(m,n);  % 初始化一个m×n的零矩阵，后续用来存储地图
for i=1:m
    for j=1:n
        if R(i,j)<=0.2
            G(i,j)=1;  % 1表示障碍物
        else
            G(i,j)=0;  % 0表示无障碍
        end
    end
end
 
% 规定起点和终点(可自行更改)
G(1,1)=0;
G(m,n)=0; 
 
%% 画栅格地图
figure;
axis([0,m,0,n]);
for i=1:m
    for j=1:n
 
        % 计算小方框的四个顶点的横、纵坐标
        x1=j-1;y1=n-i;
        x2=j;y2=n-i;
        x3=j;y3=n-i+1;
        x4=j-1;y4=n-i+1;
 
        % 绘制栅格图
        if G(i,j)==1
            fill([x1,x2,x3,x4],[y1,y2,y3,y4],[0,0,0]);
            hold on
        else
            fill([x1,x2,x3,x4],[y1,y2,y3,y4],[1,1,1]);
            hold on
        end
    end
end
 
% 画起点图标(可自行更改)
fill([0,1,1,0],[n-1,n-1,n,n],[1,0,0]);
% 画终点图标(可自行更改)
fill([m-1,m,m,m-1],[0,0,1,1],[0,0,1]);