
%% Method 2 ��3 ����Ҫ�������ϸ�����������߸�����
%% Method 2 Error��һ�� ���������ֵ ���������
for k=1:length(data)-2
            if Data(k)>Data(k+1) && Data(k+1)<Data(k+2) 
                %���ֱȽϷ�������©�� ��Ϊ��Ҫ���߹⻬
                minloc(j)=k+1;
                j=j+1;
            end
            
            if Data(k)<Data(k+1) && Data(k+1)>Data(k+2) 
                %���ֱȽϷ�������©�� ��Ϊ��Ҫ���߹⻬
                maxloc(m)=k+1;
                m=m+1;
            end
       end
loc=[minloc(1:j-1);maxloc(1:m-1)];%j-1 m-1��ʵ�ʼ�¼������
%%**********************       
   
%% Method 3 Error �˲� �õ���ֵ����ֵ 
%     maxloc=find(diff(sign(diff(Data)))==-2)+1;%��ֵ%������ �����̫׼
%     minloc=find(diff(sign(diff(Data)))==2)+1;%��ֵ%������ λ��
%%*****************************************