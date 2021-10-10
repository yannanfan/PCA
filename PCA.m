%% PCA��ά
%% ��������
load fisheriris;
X = meas';  
%% PCA��ά
% ���Ļ�
meanX = repmat(mean(X,2),1,size(X,2));
center_X = X - meanX;

% ��Э�������
C = 1/size(X,2) * (center_X * center_X');	

% ������ֵ����������
[W, Lambda] = eig(C); 
sum(W.*W, 1)    % ������֤ÿ������������Ԫ�ص�ƽ���;�Ϊ1
feature = diag(Lambda)';
feature = feature(:,end:-1:1);

% ȡǰ��������ֵ��Ӧ����������
W = W(:,end:-1:1);
W_pca = W(:, 1:2);

%�����ά�������
Y =  W_pca'*center_X;  
%% ������ӻ�
figure;
    stairs(cumsum(feature)/sum(feature), 'LineWidth',1.5);
    xlabel('ȡǰk����������');
    ylabel('������');
    set(gca,'XTick',[1 2 3 4]);
figure;
    scatter(X(1,:), X(2,:),500, categorical(species), '.');
    xlabel('ά��1');
    ylabel('ά��2');
    title('ȡԭʼ���ݵ�ǰ��ά��ͼ');
figure;
    scatter(Y(1,:), Y(2,:), 500, categorical(species), '.');
    xlabel('Principal Component 1');
    ylabel('Principal Component 2');
    title('ȡ��ά���ǰ��ά��ͼ');
