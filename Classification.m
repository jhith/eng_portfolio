%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Feature Classification 
%% Uncomment as needed
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; close all; clc

 %load('F:\Academic+Rsrch\Nadi Research\14_Features_of_ensembles\FEATURES.mat');
load('F:\Academic+Rsrch\Nadi Research\14_Features_of_ensembles\Feature_space_Nadi.mat');

X=Feature_space_Nadi;
T=[zeros(1,47) ones(1,18)];
%% Train Test split
[m,n] = size(X') ;
P = 0.7 ;
rng(100);
idx = randperm(m)  ;
idx;
X_Train = X(:,idx(1:round(P*m))) ; 
X_Test= X(:,idx(round(P*m)+1:end)) ;
target_train= T(:,idx(1:round(P*m)));  
target_test= T(:,idx(round(P*m)+1:end));
%% NN
% net=feedforwardnet([]);
% net.layers.transferFcn
% %net.layers{1}.transferFcn='tansig'
% %  net.layers.transferFcn
% net.divideParam.trainRatio=1.0
% net.divideParam.valRatio=0.0
% net.divideParam.testRatio=0.0
% net.divideParam
% configure(net,X_Train,target_train);
% view(net)
% net=train(net,X_Train,target_train);
% N_out=net(X_Test);
% 
% figure; subplot(2,1,1);bar(N_out);title('Result for testing set');
% xlabel('Test inputs'); ylabel('Network produced output');
% subplot(2,1,2);bar(target_test);title('Expected outputs for training set ');
% xlabel('Test inputs'); ylabel('Expected output');
% 
% figure;plotconfusion(target_test,round(N_out))
%  
% CONF=confusionmat(target_test,round(N_out));
%  figure;
%  confusionchart(CONF);
% 

%% 

x1=1:1:47; x2=1:1:18;
% 
% figure; 
% scatter(x1,FEATURES(1,1:47),'filled'); hold on;
% scatter(x2,FEATURES(1,48:65),'filled');hold on;
% 
% figure;
% scatter(x1,FEATURES(2,1:47),'filled'); hold on;
% scatter(x2,FEATURES(2,48:65),'filled');hold on;
% figure;
% scatter(x1,FEATURES(3,1:47),'filled'); hold on;
% scatter(x2,FEATURES(3,48:65),'filled');hold on;


% figure; 
% scatter(x1,FEATURES(4,1:47),'filled'); hold on;
% scatter(x2,FEATURES(4,48:65),'filled');hold on;
% figure;
% scatter(x1,FEATURES(5,1:47),'filled'); hold on;
% scatter(x2,FEATURES(5,48:65),'filled');hold on;
% figure;
% scatter(x1,FEATURES(6,1:47),'filled'); hold on;
% scatter(x2,FEATURES(6,48:65),'filled');hold on;


% figure; 
% scatter(x1,FEATURES(7,1:47),'filled'); hold on;
% scatter(x2,FEATURES(7,48:65),'filled');hold on;
% figure;
% scatter(x1,FEATURES(8,1:47),'filled'); hold on;
% scatter(x2,FEATURES(8,48:65),'filled');hold on;
% figure;
% scatter(x1,FEATURES(9,1:47),'filled'); hold on;
% scatter(x2,FEATURES(9,48:65),'filled');hold on;
% 
% figure;
% boxplot(X(:,1:47)'); hold on;
% boxplot(X(:,48:65)'); hold on;

%% classification
%%  PCA applied feature set to NN

%cov automatically remove means 
R=cov(X'); %covariance between each feature
%what if cov between each person will give?
[V,D]=eigs(R,75);
figure; bar(diag(D));
xlabel('Order of eigen values in descending magnitude');ylabel('Eigen value');
title('Largest 20 eigen values');

Potion=diag(D)/sum(diag(D))  % varaince captured by each feature
cumulative=cumsum(diag(D))/sum(diag(D)) % cumulative variance 

X1=X(:,1:47);
X2=X(:,48:65);
X=[X1 X2];
x1=1:1:47; x2=1:1:18;

N1=47;
N2=18;
Y1=X1'*V(:,1:45); %dim reduction to 10?  /  75-- all? eig spaces
Y2=X2'*V(:,1:45);
Y=X'*V(:,1:45);
Yt=[zeros(1,47) ones(1,18)];
Yt2=[ones(1,47) 2*ones(1,18)];

figure;
scatter(Y(1:47,1),Y(1:47,2),'b^','filled');hold on;grid on; axis square;
scatter(Y(48:65,1),Y(48:65,2),'r^','filled');hold on;grid on; axis square;
xlabel('Feature (PC) 1');ylabel('Feature (PC) 2');
title('Dimension Transformed to PCs')

Yt2=[ones(1,47) 2*ones(1,18)];
YYY=[Y' ;Yt2 ];
%% eigen loading
E=repmat(sqrt(diag(D)),[1,75]); % matrix with sqrt of eig vals 
L=abs(V./E');    % finding highest correlated feature and eigen values
L(L<0)=0;   
correlated_ftrnPCs= max(L);
[row,col]=find(L==correlated_ftrnPCs); % rows gives highly correlated feature 
%%
X_back=inv(V(:,1:75))*V(:,1:75)*X;
figure;
scatter(X_back(1,1:47),X_back(2,1:47),'b^','filled');hold on;grid on; axis square;
scatter(X_back(1,48:65),X_back(2,48:65),'r^','filled');hold on;grid on; axis square;
xlabel('Feature (PC) 1');ylabel('Feature (PC) 2');
title('PCs to original axess')



%% Train Test split
[m,n] = size(Y) ;
P = 0.7 ;
rng(100);
idx = randperm(m)  ;
idx;
XX=Y';
X_Train = XX(:,idx(1:round(P*m))) ; 
X_Test= XX(:,idx(round(P*m)+1:end)) ;
target_train= T(:,idx(1:round(P*m)));  
target_test= T(:,idx(round(P*m)+1:end));

%% higher dimension data to 2 dim with t-SNE 

%rng default % for reproducibility
% Z = tsne(YY);
% Z = tsne(YY,'Algorithm','exact','Distance','mahalanobis','Perplexity',65);
%  Z = tsne(X','Algorithm','barneshut','Distance','euclidean','Perplexity',4,'NumDimensions',3);
%  figure;
%  s=scatter3(Z(:,1),Z(:,2),Z(:,3),Yt2,'o','filled');
%Z = tsne(YY,'Algorithm','barneshut','Distance','euclidean','Perplexity',2.5);
 Z = tsne(X','Algorithm','barneshut','Distance','euclidean','Perplexity',6);
figure; gscatter(Z(:,1),Z(:,2),T);
title('2-D Embedding with barneshut algorithm ')
legend({'Healthy', 'Diabetic'});
%For the 'barneshut' algorithm, tsne uses knnsearch to find the nearest neighbors.


%% 5-fold Crossvalidation

%load fisheriris;
y = T';
x = XX';
numFolds = 5;
c = cvpartition(y,'k',numFolds);
% table to store the results 
netAry = {numFolds,1};
perfAry = zeros(numFolds,1);

net = feedforwardnet([5]);
net=configure(net,XX,T);
view(net)
net.layers.transferFcn
  %net.layers{1}.transferFcn='logsig'
%  net.layers.transferFcn
net.divideParam.trainRatio=1.0
net.divideParam.valRatio=0.0
net.divideParam.testRatio=0.0

for i = 1:numFolds
    
    %get Train and Test data for this fold
     trIdx = c.training(i);
     teIdx = c.test(i);
     xTrain = x(trIdx);
     yTrain = y(trIdx);
     xTest = x(teIdx);
     yTest = y(teIdx);
     
     %transform data to columns as expected by neural nets
     xTrain = xTrain';
     xTest = xTest';
     yTrain = dummyvar(grp2idx(yTrain))';
     yTest = dummyvar(grp2idx(yTest))';
     
%     net = feedforwardnet([5 3]);
%     net.layers.transferFcn
%       %net.layers{1}.transferFcn='logsig'
%     %  net.layers.transferFcn
%     net.divideParam.trainRatio=1.0
%     net.divideParam.valRatio=0.0
%     net.divideParam.testRatio=0.0

     
     %train network
     net = train(net,xTrain,yTrain);
     yPred = net(xTest);
     perf = perform(net,yTest,yPred);
     disp(perf);
     figure; plotconfusion(yTest,yPred);
%      CONF=confusionmat(yTest,yPred);
     %figure;    confusionchart(CONF);

     
     
     %store results     
     netAry{i} = net;
     perfAry(i) = perf;
     
end
%take the network with min Loss value
[maxPerf,maxPerfId] = min(perfAry);
bestNet = netAry{maxPerfId};

sum(perfAry, 1)

 %% NN
% net=feedforwardnet([]);
% net.layers.transferFcn
% %net.layers{1}.transferFcn='tansig'
% %  net.layers.transferFcn
% net.divideParam.trainRatio=1.0
% net.divideParam.valRatio=0.0
% net.divideParam.testRatio=0.0
% net.divideParam
% configure(net,X_Train,target_train);
% view(net)
% net=train(net,X_Train,target_train);
% N_out=net(X_Test);
% 
% figure; subplot(2,1,1);bar(N_out);title('Result for testing set');
% xlabel('Test inputs'); ylabel('Network produced output');
% subplot(2,1,2);bar(target_test);title('Expected outputs for training set ');
% xlabel('Test inputs'); ylabel('Expected output');
% 
% figure;plotconfusion(target_test,round(N_out))
%  
% CONF=confusionmat(target_test,round(N_out));
%  figure;
%  confusionchart(CONF);
% 
% 




%% Fisher Discriminent Analysis
% X1=X(:,1:47);
% X2=X(:,48:65);
% X=[X1 X2];
% x1=1:1:47; x2=1:1:18;
% 
% N1=47;
% N2=18;
% 
% 
% mu1=mean(X1')';
% X1=X1- repmat(mu1,1,N1);
% mu2=mean(X2')';
% X2=X2- repmat(mu2,1,N2);
% 
% %X=[X1+repmat(mu1,1,N1) X2+repmat(mu2,1,N2)];
% 
% % calculate the within class scatter matrix
% Sx1=(X1*X1')/(N1-1);
% Sx2=(X2*X2')/(N2-1);
% SW=Sx1+Sx2;
% 
% % calculate the between class scatter matrix
% SB=(mu1-mu2)*(mu1-mu2)';
% 
% 
% % find the eigen vectors and values of Sx
% [V,D]=eigs(inv(SW)*SB);
% %V=inv(SW)*SB;
% 
% Y=V'*X;
% %Y=flipud(Y);
% figure;
% plot3(Y(5,1:47),Y(1,1:47),Y(2,1:47),'*');hold on;
% plot3(Y(5,48:65),Y(1,48:65),Y(2,48:65),'r*');hold on;
% %axis equal;
% grid on;
% 
% figure;
% bar(V(:,3)'*X);
% 
% 
% 
% 
% % using SVM
% 
% 
% 
% %%  using NN
% meas=X';
% species=[zeros(1,47) ones(1,18)]';
% indices = crossvalind('Kfold',species,5);
% cp = classperf(species);
% for i = 1:5
%     test = (indices == i); 
%     train = ~test;
%     class = classify(meas(test,:),meas(train,:),species(train,:));
%     classperf(cp,class,test);
% end
% cp.ErrorRate
% 
% %% 
% % A=randperm(65);
% A=[24 64 6 63 27 44 18 60 8 31 43 35 9 16 55 25 5 50 26 40 13 65 49 48 30 46 42 36 47 53 10 61 7 51 38 20 14 59 62 32 11 34 37 4 23 28 45 3 57 22 17 29 33 2 58 41 19 56 15 54 1 12 21 39 52];
% X_Train=X(:,sort(A(14:65)));
% X_Test=X(:,sort(A(1:13)));
% target_train= T(1,sort(A(14:65)));
% target_test= T(1,sort(A(1:13))); 
% 
% %%  create net and set Test and Validation to zero in the input data
% %net = patternnet(10);
%    
% net = feedforwardnet([2]);
% net.layers.transferFcn
%   %net.layers{1}.transferFcn='logsig'
% %  net.layers.transferFcn
% net.divideParam.trainRatio=1.0
% net.divideParam.valRatio=0.0
% net.divideParam.testRatio=0.0
% 
% configure(net,X_Train,target_train);
% net = train(net,X_Train,target_train);
% view(net)
% y = net(X_Train);
% perf = perform(net,X_Test,target_test)
% N_out=net(X_Test);
% plotconfusion(target_test,N_out)
% 
% %% 
% 
% 
% figure; subplot(2,1,1);bar(N_out);title('Result for testing set ');
% xlabel('Test inputs'); ylabel('Network produced output');
% subplot(2,1,2);bar(target_test);title('Target outputs');
% Results=[target_test' round(N_out')]
% xlabel('Test inputs'); ylabel('Expected output');
% 
%  

%%
 % save and loading net
%  save ('F:\Academic+Rsrch\Nadi Research\14_Features_of_ensembles\net')
%  load ('F:\Academic+Rsrch\Nadi Research\14_Features_of_ensembles\net')



