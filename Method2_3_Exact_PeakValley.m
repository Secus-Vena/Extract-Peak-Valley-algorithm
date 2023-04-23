
%% Method 2 和3 都需要数据是严格得正增长或者负增长
%% Method 2 Error另一个 假设的求峰谷值 这个有问题
for k=1:length(data)-2
            if Data(k)>Data(k+1) && Data(k+1)<Data(k+2) 
                %这种比较方法存在漏洞 因为需要曲线光滑
                minloc(j)=k+1;
                j=j+1;
            end
            
            if Data(k)<Data(k+1) && Data(k+1)>Data(k+2) 
                %这种比较方法存在漏洞 因为需要曲线光滑
                maxloc(m)=k+1;
                m=m+1;
            end
       end
loc=[minloc(1:j-1);maxloc(1:m-1)];%j-1 m-1是实际记录的数字
%%**********************       
   
%% Method 3 Error 滤波 得到峰值、谷值 
%     maxloc=find(diff(sign(diff(Data)))==-2)+1;%峰值%列向量 这个不太准
%     minloc=find(diff(sign(diff(Data)))==2)+1;%谷值%列向量 位置
%%*****************************************