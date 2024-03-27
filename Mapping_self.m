%% 栅格地图创建 %%
%% 关注微信公众号：启发式算法讨论 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
clear
clc
 
%% 生成m×n的栅格图障碍物环境
m=30; n=30;
 
% 规定每个坐标中的对象
matrix=(ones(m,n)); % 地图矩阵
imshow(matrix,'InitialMagnification','fit')
[Row,Column] = size(matrix);     % 获取图像的大小
 
% 产生网格
x = 0.5:1:Column+1;
y = 0.5:1:Row+1;
M = meshgrid(x,y);
N = meshgrid(y,x);
hold on
 
plot(x,N,'b');   % 画出水平横线
plot(M,y,'b');   % 画出垂直竖线
pause(1);
 
% 构建一个对话框
zuo=msgbox('利用鼠标左键定义障碍物位置，定义完成后右键定义最后一个障碍物结束定义');
uiwait(zuo,10);
if ishandle(zuo) == 1
    delete(zuo);
end
 
% 设置横坐标题目, 再次提醒
xlabel('利用鼠标左键定义障碍物位置，定义完成后右键定义最后一个障碍物结束定义','Color','red');
 
ob = 1;
while ob == 1
    [xval,yval,ob] = ginput(1);
    xval=floor(xval + 0.5);
    yval=floor(yval + 0.5);
    matrix(yval,xval)=0;    % 设置障碍物
    imshow(matrix,'InitialMagnification','fit')
    plot(x,N,'b');          % 画出水平横线
    plot(M,y,'b');          % 画出垂直竖线
end
hold off
 
figure
imshow(matrix,'InitialMagnification','fit') % 画出最终栅格图
save('MAP.mat','MAP');                      % 存储栅格地图的矩阵