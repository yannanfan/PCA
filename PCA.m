%% PCA降维
%% 加载数据
load fisheriris;
X = meas';  
%% PCA降维
% 中心化
meanX = repmat(mean(X,2),1,size(X,2));
center_X = X - meanX;

% 求协方差矩阵
C = 1/size(X,2) * (center_X * center_X');	

% 求特征值并降序排序
[W, Lambda] = eig(C); 
sum(W.*W, 1)    % 可以验证每个特征向量各元素的平方和均为1
feature = diag(Lambda)';
feature = feature(:,end:-1:1);

% 取前两个特征值对应的特征向量
W = W(:,end:-1:1);
W_pca = W(:, 1:2);

%输出降维后的数据
Y =  W_pca'*center_X;  
%% 结果可视化
figure;
    stairs(cumsum(feature)/sum(feature), 'LineWidth',1.5);
    xlabel('取前k个特征向量');
    ylabel('贡献率');
    set(gca,'XTick',[1 2 3 4]);
figure;
    scatter(X(1,:), X(2,:),500, categorical(species), '.');
    xlabel('维度1');
    ylabel('维度2');
    title('取原始数据的前两维作图');
figure;
    scatter(Y(1,:), Y(2,:), 500, categorical(species), '.');
    xlabel('Principal Component 1');
    ylabel('Principal Component 2');
    title('取降维后的前两维作图');
