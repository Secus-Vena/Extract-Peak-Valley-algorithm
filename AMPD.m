%% 峰值滤波算法 试验
%% 可以对峰值滤波 对峰谷滤波
%参考链接：https://blog.csdn.net/qq_54875519/article/details/129112633

function [locs]=AMPD(data)
p_data=zeros(size(data),'like',data);%由零组成的数组，
%具有与数值变量 Y 相同的数据类型、稀疏度和复杂度(实数或复杂度)。
count=length(data);
arr_rowsum=[];
c=mod(count,2);%取余
d=(count-c)/2;%取商 对半取data长度
for k=1:d
    row_num=0;
    for i=k:count-k-1
%         if data(i+1)>data(i-k+1)&& data(i+1)>data(i+k+1) %峰值
       if data(i+1)<data(i-k+1)&& data(i+1)<data(i+k+1) %谷值
            row_num=row_num-1;
        end
    end
    arr_rowsum=[arr_rowsum,row_num];
end
mm=min(arr_rowsum);
min_index=find(arr_rowsum==mm);
max_window_length=min_index;
for k=1:max_window_length
    for i=k:count-k-1
%          if data(i+1)>data(i-k+1) && data(i+1)>data(i+k+1) %峰值
         if data(i+1)<data(i-k+1)&& data(i+1)<data(i+k+1) %谷值
            p_data(i+1)=p_data(i+1)+1;
         end
    end
end
locs=find(p_data==max_window_length);
end