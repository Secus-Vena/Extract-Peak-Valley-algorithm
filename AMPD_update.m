
function [loc]=AMPD_update(data)
% Method 1.1 AMPD ���°汾��
%  ˵���������������� �����ܼ�����2 1 1 2 ����1 Ϊ��ֵ�����
    % ����������ʼ�� 
    p_data_Peak=zeros(size(data),'like',data);%������ɵ����飬%��������ֵ���� Y ��ͬ���������͡�ϡ��Ⱥ͸��Ӷ�(ʵ�����Ӷ�)��
    p_data_Valley=zeros(size(data),'like',data);
    count=length(data);
    c=mod(count,2);%ȡ��
    d=(count-c)/2;%ȡ�� �԰�ȡdata����
    windowPeak=zeros(d,1);
    windowValley=zeros(d,1);
    
    j=1;
    m=1;
    mmValley=0;
    mmPeak=0;
    Valley_min_index=1;
    Peak_min_index=1;
    %******************************
    for L=1:d %����ǰ����Ĵ� ֵ�����
    for k=L:count-L-1 
       if data(k+1)>data(k-L+1)&& data(k+1)>data(k+L+1) %��ֵ
%    ������������ �����ܼ�����2 1 1 2 ����1 Ϊ��ֵ�����
%����������ɣ�data(k+1)>=data(k-L+1)&& data(k+1)>data(k+L+1)
%�ڵ�һ�������һ���Ⱥţ��൱����ȡֵ 2 1 1 2 ���� ȡ������1
%����Ҳ��
          windowPeak(m)=windowPeak(m)-1; 
       end

       if data(k+1)<data(k-L+1)&& data(k+1)<data(k+L+1) %��ֵ
           windowValley(j)=windowValley(j)-1;
       end
    end

    %% �������1 �����Сֵ �Լ�λ��
    if  mmValley>windowValley(m)
         mmValley=windowValley(m);%����Сֵ ��Ϊ�����Ǽ�ȥ1
         Valley_min_index=m;
    end
    
    if  mmPeak>windowPeak(j)
         mmPeak=windowPeak(j);%����Сֵ
         Peak_min_index=j;
    end
    %%****************************

    m=m+1;
    j=j+1;
    end

%% ����min max ���������� ���������1
%     mmValley=min(windowValley); %���������
%     mmPeak=min(windowPeak);
%     Valley_min_index=find(windowValley==mmValley);%λ��ʵ������������һ����ֵ
%     Peak_min_index=find(windowPeak==mmPeak);%��Ϊ����Ӧ��������ѭ���е���ѭ��
%**************************

for k=1:Valley_min_index %��ֵλ��
    for i=k:count-k-1
         if data(i+1)<=data(i-k+1)&& data(i+1)<data(i+k+1) %��ֵ
             %ͬ�� ���˵Ⱥ�
            p_data_Valley(i+1)=p_data_Valley(i+1)+1;
         end
    end
end
valleyloc=find(p_data_Valley==Valley_min_index);

for k=1:Peak_min_index %��ֵλ��
    for i=k:count-k-1
         if data(i+1)>=data(i-k+1) && data(i+1)>data(i+k+1) %��ֵ
           p_data_Peak(i+1)=p_data_Peak(i+1)+1;
         end
    end
end
peakloc=find(p_data_Peak==Peak_min_index);%������λ��    
loc=[valleyloc;peakloc];%������λ��
end