
function [loc]=AMPD_update(data)
% Method 1.1 AMPD 更新版本的
%  说明：这个是问题就是 它不能检测出来2 1 1 2 这种1 为谷值的情况
    % 参数变量初始化 
    p_data_Peak=zeros(size(data),'like',data);%由零组成的数组，%具有与数值变量 Y 相同的数据类型、稀疏度和复杂度(实数或复杂度)。
    p_data_Valley=zeros(size(data),'like',data);
    count=length(data);
    c=mod(count,2);%取余
    d=(count-c)/2;%取商 对半取data长度
    windowPeak=zeros(d,1);
    windowValley=zeros(d,1);
    
    j=1;
    m=1;
    mmValley=0;
    mmPeak=0;
    Valley_min_index=1;
    Peak_min_index=1;
    %******************************
    for L=1:d %这个是把最大的窗 值求出来
    for k=L:count-L-1 
       if data(k+1)>data(k-L+1)&& data(k+1)>data(k+L+1) %峰值
%    这个是问题就是 它不能检测出来2 1 1 2 这种1 为谷值的情况
%如果把这个变成：data(k+1)>=data(k-L+1)&& data(k+1)>data(k+L+1)
%在第一个里面加一个等号，相当于是取值 2 1 1 2 这种 取最后面的1
%下面也是
          windowPeak(m)=windowPeak(m)-1; 
       end

       if data(k+1)<data(k-L+1)&& data(k+1)<data(k+L+1) %谷值
           windowValley(j)=windowValley(j)-1;
       end
    end

    %% 替代方案1 求出最小值 以及位置
    if  mmValley>windowValley(m)
         mmValley=windowValley(m);%求最小值 因为上面是减去1
         Valley_min_index=m;
    end
    
    if  mmPeak>windowPeak(j)
         mmPeak=windowPeak(j);%求最小值
         Peak_min_index=j;
    end
    %%****************************

    m=m+1;
    j=j+1;
    end

%% 假如min max 函数不能用 见替代方案1
%     mmValley=min(windowValley); %这个不能用
%     mmPeak=min(windowPeak);
%     Valley_min_index=find(windowValley==mmValley);%位置实际上是其最大的一个窗值
%     Peak_min_index=find(windowPeak==mmPeak);%因为它对应的是上面循环中的外循环
%**************************

for k=1:Valley_min_index %谷值位置
    for i=k:count-k-1
         if data(i+1)<=data(i-k+1)&& data(i+1)<data(i+k+1) %谷值
             %同上 加了等号
            p_data_Valley(i+1)=p_data_Valley(i+1)+1;
         end
    end
end
valleyloc=find(p_data_Valley==Valley_min_index);

for k=1:Peak_min_index %峰值位置
    for i=k:count-k-1
         if data(i+1)>=data(i-k+1) && data(i+1)>data(i+k+1) %峰值
           p_data_Peak(i+1)=p_data_Peak(i+1)+1;
         end
    end
end
peakloc=find(p_data_Peak==Peak_min_index);%是索引位置    
loc=[valleyloc;peakloc];%是索引位置
end