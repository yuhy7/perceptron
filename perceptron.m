n=0.1;                              %设定学习速率为0.5
count=1;
w=rand(1,3);                         %随机产生初始权值
x = [-9 1 -12 -4 0 5; 15 -8 4 5 11 9];           %训练样本输入
d = [0 1 0 0 0 1];                          %期望输出
X = [ones(1,6); x];         %为了计算方便，添加一行单位向量
y=w*X;                                % y=w0+w1x1+w2x2
for j=1:6
if y(j)<0
y(j)=0;
else
y(j)=1;
end
end                                 %对y应用激活函数
e=d-y;                               %计算误差
while any(e)                    %当误差不为零时执行循环
count=count+1;
for i=1:6
for k=1:3
w(k)=w(k)+n*e(i)*X(k,i);                 %更新权值
end
end
y=w*X;
for j=1:6
if y(j)<0
y(j)=0;
else
y(j)=1;
end
end
e=d-y;                               %重新计算误差
end
b=w(:,1);                             %将w0存入变量b
W(:,1)=w(:,2);
W(:,2)=w(:,3);                       %将w1，w2存入向量W
plotpv(x,d);                           %画出训练样本点
plotpc(W,b);
hold on;
