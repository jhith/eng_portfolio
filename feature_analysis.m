%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Feature space analysis for Nadi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc;
%save('F:\Academic+Rsrch\Nadi Research\14_Features_of_ensembles\Feature_space_Nadi.mat','Feature_space_Nadi');

load('D:\Nadi Research\14_Features_of_ensembles\Feature_space_Nadi.mat');

%%
 X=Feature_space_Nadi;
 X1=X(:,1:47);  % healthy set of features
 X2=X(:,48:65);  % Diabetic
 target=[zeros(1,47) ones(1,18)];
 Index=[1:1:65];
 
 %% All features
%  Feature_1=X(1,:); Feature_2=X(2,:); Feature_3=X(3,:); % Vata, pita kapha PSD ratios
%  Feature_4=X(4,:); Feature_5=X(5,:); Feature_6=X(6,:); % Vata, pita kapha CF
%  Feature_7=X(7,:); Feature_8=X(8,:); Feature_9=X(9,:); % Vata, pita kapha period
%  
%  Feature_10=X(10,:); Feature_11=X(11,:); Feature_12=X(12,:); Feature_13=X(13,:);
%  Feature_14=X(14,:); Feature_15=X(15,:); % Vata D1-6 
%  
%  Feature_16=X(16,:); Feature_17=X(17,:); Feature_18=X(18,:); Feature_19=X(19,:);
%  Feature_20=X(20,:); Feature_21=X(21,:); % Pita D1-6 
%  
%  Feature_22=X(22,:); Feature_23=X(23,:); Feature_24=X(24,:); Feature_25=X(25,:); 
%  Feature_26=X(26,:); Feature_27=X(27,:); %  Kapha D1-6
%  
%  Feature_28=X(28,:); Feature_29=X(29,:); Feature_30=X(30,:); % Vata gaussfit SSE, R-square and RMSE
%  Feature_31=X(31,:); Feature_32=X(32,:); Feature_33=X(33,:); % Pita gaussfit SSE, R-square and RMSE
%  Feature_34=X(34,:); Feature_35=X(35,:); Feature_36=X(36,:); % Kapha gaussfit SSE, R-square and RMSE
%  
 
%% 1. scatter plots
%  figure;
%  subplot(3,1,1);gscatter(Feature_7,Index,target);title('Sample scattering of 1st feature - CF VATA')
%  subplot(3,1,2);gscatter(Feature_8,Index,target);title('Sample scattering of 2nd feature - CF PITA')
%  subplot(3,1,3);gscatter(Feature_9,Index,target);title('Sample scattering of 3rd feature - CF KAPHA')

 x1=1:1:47; x2=1:1:18;
% 
% figure; 
% subplot(1,3,1);
% scatter(x1,Feature_1(1,1:47),'filled'); hold on;
% scatter(x2,Feature_1(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 1');
% title('Sample scattering of 1st feature- Vata - PSD ratios')
% subplot(1,3,2);
% scatter(x1,Feature_2(1,1:47),'filled'); hold on;
% scatter(x2,Feature_2(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 2');
% title('Sample scattering of 2nd feature- Pita - PSD ratios')
% subplot(1,3,3);
% scatter(x1,Feature_3(1,1:47),'filled'); hold on;
% scatter(x2,Feature_3(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 3');
% title('Sample scattering of 3rd feature- Kapha - PSD ratios')
% legend({'Healthy','Diabetic'});
% 
% figure; 
% subplot(1,3,1);
% scatter(x1,Feature_4(1,1:47),'filled'); hold on;
% scatter(x2,Feature_4(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 4');
% title('Sample scattering of 4th feature- Vata - Crest Factor')
% subplot(1,3,2);
% scatter(x1,Feature_5(1,1:47),'filled'); hold on;
% scatter(x2,Feature_5(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 5');
% title('Sample scattering of 5th feature- Pita - Crest Factor')
% subplot(1,3,3);
% scatter(x1,Feature_6(1,1:47),'filled'); hold on;
% scatter(x2,Feature_6(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 6');
% title('Sample scattering of 6th feature- Kapha - Crest Factor')
% legend({'Healthy','Diabetic'});
% 
% figure; 
% subplot(1,3,1);
% scatter(x1,Feature_7(1,1:47),'filled'); hold on;
% scatter(x2,Feature_7(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 7');
% title('Sample scattering of 7th feature- Vata - Period (T)')
% subplot(1,3,2);
% scatter(x1,Feature_8(1,1:47),'filled'); hold on;
% scatter(x2,Feature_8(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 8');
% title('Sample scattering of 8th feature- Pita - Period (T)')
% subplot(1,3,3);
% scatter(x1,Feature_9(1,1:47),'filled'); hold on;
% scatter(x2,Feature_9(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 9');
% title('Sample scattering of 9th feature- Kapha - Period (T)')
% legend({'Healthy','Diabetic'});
% %%
% figure; 
% subplot(2,3,1);
% scatter(x1,Feature_10(1,1:47),'filled'); hold on;
% scatter(x2,Feature_10(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 10');
% title('Scattering of 10th feature- Vata - non-periodic direction 1')
% 
% subplot(2,3,2);
% scatter(x1,Feature_11(1,1:47),'filled'); hold on;
% scatter(x2,Feature_11(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 11');
% title('Scattering of 11th feature- Vata - non-periodic direction 2')
% 
% subplot(2,3,3);
% scatter(x1,Feature_12(1,1:47),'filled'); hold on;
% scatter(x2,Feature_12(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 12');
% title('Scattering of 12th feature- Vata - non-periodic direction 3')
% 
% subplot(2,3,4);
% scatter(x1,Feature_13(1,1:47),'filled'); hold on;
% scatter(x2,Feature_13(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 13');
% title('Scattering of 13th feature- Vata - non-periodic direction 4')
% 
% subplot(2,3,5);
% scatter(x1,Feature_14(1,1:47),'filled'); hold on;
% scatter(x2,Feature_14(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 14');
% title('Scattering of 14th feature- Vata - non-periodic direction 5')
% 
% subplot(2,3,6);
% scatter(x1,Feature_15(1,1:47),'filled'); hold on;
% scatter(x2,Feature_15(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 15');
% title('Scattering of 15th feature- Vata - non-periodic direction 6')
% legend({'Healthy','Diabetic'});
% %%
% figure; 
% subplot(2,3,1);
% scatter(x1,Feature_16(1,1:47),'filled'); hold on;
% scatter(x2,Feature_16(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 16');
% title('Scattering of 16th feature- Pita - non-periodic direction 1')
% 
% subplot(2,3,2);
% scatter(x1,Feature_17(1,1:47),'filled'); hold on;
% scatter(x2,Feature_17(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 17');
% title('Scattering of 17th feature-Pita - non-periodic direction 2')
% 
% subplot(2,3,3);
% scatter(x1,Feature_18(1,1:47),'filled'); hold on;
% scatter(x2,Feature_18(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 18');
% title('Scattering of 18th feature- Pita - non-periodic direction 3')
% 
% subplot(2,3,4);
% scatter(x1,Feature_19(1,1:47),'filled'); hold on;
% scatter(x2,Feature_19(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 19');
% title('Scattering of 19th feature- Pita - non-periodic direction 4')
% 
% subplot(2,3,5);
% scatter(x1,Feature_20(1,1:47),'filled'); hold on;
% scatter(x2,Feature_20(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 20');
% title('Scattering of 20th feature- Pita - non-periodic direction 5')
% 
% subplot(2,3,6);
% scatter(x1,Feature_21(1,1:47),'filled'); hold on;
% scatter(x2,Feature_21(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 21');
% title('Scattering of 21st feature- Pita- non-periodic direction 6')
% legend({'Healthy','Diabetic'});
% %%
% figure; 
% subplot(2,3,1);
% scatter(x1,Feature_22(1,1:47),'filled'); hold on;
% scatter(x2,Feature_22(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 22');
% title('Scattering of 22nd feature- Kapha - non-periodic direction 1')
% 
% subplot(2,3,2);
% scatter(x1,Feature_23(1,1:47),'filled'); hold on;
% scatter(x2,Feature_23(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 23');
% title('Scattering of 23rd feature-Kapha - non-periodic direction 2')
% 
% subplot(2,3,3);
% scatter(x1,Feature_24(1,1:47),'filled'); hold on;
% scatter(x2,Feature_24(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 24');
% title('Scattering of 24th feature- Kapha - non-periodic direction 3')
% 
% subplot(2,3,4);
% scatter(x1,Feature_25(1,1:47),'filled'); hold on;
% scatter(x2,Feature_25(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 25');
% title('Scattering of 25th feature- Kapha - non-periodic direction 4')
% 
% subplot(2,3,5);
% scatter(x1,Feature_26(1,1:47),'filled'); hold on;
% scatter(x2,Feature_26(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 26');
% title('Scattering of 26th feature- Kapha - non-periodic direction 5')
% 
% subplot(2,3,6);
% scatter(x1,Feature_27(1,1:47),'filled'); hold on;
% scatter(x2,Feature_27(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 27');
% title('Scattering of 27th feature-Kapha- non-periodic direction 6')
% legend({'Healthy','Diabetic'});
% %%
% 
% figure; 
% subplot(1,3,1);
% scatter(x1,Feature_28(1,1:47),'filled'); hold on;
% scatter(x2,Feature_28(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 28');
% title('Sample scattering of 28th feature- Vata- SSE')
% subplot(1,3,2);
% scatter(x1,Feature_29(1,1:47),'filled'); hold on;
% scatter(x2,Feature_29(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 29');
% title('Sample scattering of 29th feature- Vata -R-square')
% subplot(1,3,3);
% scatter(x1,Feature_30(1,1:47),'filled'); hold on;
% scatter(x2,Feature_30(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 30');
% title('Sample scattering of 30th feature- Vata -RMSE')
% legend({'Healthy','Diabetic'});
% 
% %%
% 
% 
% figure; 
% subplot(1,3,1);
% scatter(x1,Feature_31(1,1:47),'filled'); hold on;
% scatter(x2,Feature_31(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 31');
% title('Sample scattering of 31st feature- Pita- SSE')
% subplot(1,3,2);
% scatter(x1,Feature_32(1,1:47),'filled'); hold on;
% scatter(x2,Feature_32(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 32');
% title('Sample scattering of 32nd feature- Pita -R-square')
% subplot(1,3,3);
% scatter(x1,Feature_33(1,1:47),'filled'); hold on;
% scatter(x2,Feature_33(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 33');
% title('Sample scattering of 33rd feature- Pita -RMSE')
% legend({'Healthy','Diabetic'});
% 
% %%
% 
% 
% figure; 
% subplot(1,3,1);
% scatter(x1,Feature_34(1,1:47),'filled'); hold on;
% scatter(x2,Feature_34(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 34');
% title('Sample scattering of 34th feature- Kapha- SSE')
% subplot(1,3,2);
% scatter(x1,Feature_35(1,1:47),'filled'); hold on;
% scatter(x2,Feature_35(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 35');
% title('Sample scattering of 35th feature- Kapha-R-square')
% subplot(1,3,3);
% scatter(x1,Feature_36(1,1:47),'filled'); hold on;
% scatter(x2,Feature_36(1,48:65),'filled');
% xlabel('Index'); ylabel('Feature 36');
% title('Sample scattering of 36th feature- Kapha -RMSE')
% legend({'Healthy','Diabetic'});


%% try 2d and 3d scatter plots!
%  x1=1:1:47; x2=1:1:18;
% 
% figure; 
% 
% scatter3(Feature_1(1,1:47),Feature_2(1,1:47),Feature_3(1,1:47),'filled'); hold on;
% scatter3(Feature_1(1,48:65),Feature_2(1,48:65),Feature_3(1,48:65),'filled');
% xlabel('Feature 1'); ylabel('Feature 2');zlabel('Feature 3');
% title('Sample scattering of features- V P K PSD ratios')
% legend({'Healthy','Diabetic'});
% 
% figure; 
% scatter3(Feature_4(1,1:47),Feature_5(1,1:47),Feature_6(1,1:47),'filled'); hold on;
% scatter3(Feature_4(1,48:65),Feature_5(1,48:65),Feature_6(1,48:65),'filled');
% xlabel('Feature 4'); ylabel('Feature 5');zlabel('Feature 6');
% title('Sample scattering of features- CF')
% legend({'Healthy','Diabetic'});
% 
% figure; 
% scatter3(Feature_7(1,1:47),Feature_8(1,1:47),Feature_9(1,1:47),'filled'); hold on;
% scatter3(Feature_7(1,48:65),Feature_8(1,48:65),Feature_9(1,48:65),'filled');
% xlabel('Feature 7'); ylabel('Feature 8');zlabel('Feature 9');
% title('Sample scattering of features- Period')
% legend({'Healthy','Diabetic'});
% 
% 
% figure; 
% scatter3(Feature_10(1,1:47),Feature_11(1,1:47),Feature_12(1,1:47),'filled'); hold on;
% scatter3(Feature_10(1,48:65),Feature_11(1,48:65),Feature_12(1,48:65),'filled');
% xlabel('Feature 10'); ylabel('Feature 11');zlabel('Feature 12');
% 
% figure; 
% scatter3(Feature_16(1,1:47),Feature_17(1,1:47),Feature_18(1,1:47),'filled'); hold on;
% scatter3(Feature_16(1,48:65),Feature_17(1,48:65),Feature_18(1,48:65),'filled');
% xlabel('Feature 16'); ylabel('Feature 17');zlabel('Feature 18');
% 
% figure; 
% scatter3(Feature_22(1,1:47),Feature_23(1,1:47),Feature_24(1,1:47),'filled'); hold on;
% scatter3(Feature_22(1,48:65),Feature_23(1,48:65),Feature_24(1,48:65),'filled');
% xlabel('Feature 22'); ylabel('Feature 23');zlabel('Feature 24');
% 
% figure; 
% scatter3(Feature_28(1,1:47),Feature_29(1,1:47),Feature_30(1,1:47),'filled'); hold on;
% scatter3(Feature_28(1,48:65),Feature_29(1,48:65),Feature_30(1,48:65),'filled');
% xlabel('Feature 28'); ylabel('Feature 29');zlabel('Feature 30');
% 
% figure; 
% scatter3(Feature_31(1,1:47),Feature_32(1,1:47),Feature_33(1,1:47),'filled'); hold on;
% scatter3(Feature_31(1,48:65),Feature_32(1,48:65),Feature_33(1,48:65),'filled');
% xlabel('Feature 31'); ylabel('Feature 32');zlabel('Feature 33');
% 
% figure; 
% scatter3(Feature_34(1,1:47),Feature_35(1,1:47),Feature_36(1,1:47),'filled'); hold on;
% scatter3(Feature_34(1,48:65),Feature_35(1,48:65),Feature_36(1,48:65),'filled');
% xlabel('Feature 34'); ylabel('Feature 35');zlabel('Feature 36');
% 
% 
% figure; 
% scatter3(Feature_34(1,1:47),Feature_31(1,1:47),Feature_28(1,1:47),'filled'); hold on;
% scatter3(Feature_34(1,48:65),Feature_31(1,48:65),Feature_28(1,48:65),'filled');
% xlabel('Feature 34'); ylabel('Feature 31');zlabel('Feature 28');
% 
%
%% 3 D scatter
figure; 
scatter3(X(40,1:47),X(42,1:47),X(43,1:47),'filled'); hold on;
scatter3(X(40,48:65),X(42,48:65),X(43,48:65),'filled');
xlabel('Inst amplitude vata'); ylabel('Inst amplitude Pita');zlabel('Inst amplitude Kapha');


%% 2. histogram
%  figure;
%  subplot(3,1,1);histogram(Feature_1,10);title('Histogram of 1st feature space');
%  subplot(3,1,2);histogram(Feature_2,10);title('Histogram of 2nd feature space');
%  subplot(3,1,3);histogram(Feature_3,10);title('Histogram of 3rd feature space');
 
 %%
 
%% 3. boxplot
% figure;
% subplot(1,3,1);
% boxplot(Feature_1(1,1:47)); hold on;boxplot(Feature_1(1,48:65));
% title('Boxplot for 1st feature');ylabel('Feature_1');xlabel('PSD ratios - vata');
% subplot(1,3,2);
% boxplot(Feature_2(1,1:47)); hold on;boxplot(Feature_2(1,48:65));
% title('Boxplot for 2nd feature');ylabel('Feature_2');xlabel('PSD ratios - Pita');
% subplot(1,3,3);
% boxplot(Feature_3(1,1:47)); hold on;boxplot(Feature_3(1,48:65));
% title('Boxplot for 3rd feature');ylabel('Feature_3');xlabel('PSD ratios - Kapha');

% figure;
% subplot(1,3,1);
% boxplot(Feature_4(1,1:47)); hold on;boxplot(Feature_4(1,48:65));
% title('Boxplot for 4th feature');ylabel('Feature_4');xlabel('Creast Factor - vata');
% subplot(1,3,2);
% boxplot(Feature_5(1,1:47)); hold on;boxplot(Feature_5(1,48:65));
% title('Boxplot for 5th feature');ylabel('Feature_5');xlabel('Creast Factor - Pita');
% subplot(1,3,3);
% boxplot(Feature_6(1,1:47)); hold on;boxplot(Feature_6(1,48:65));
% title('Boxplot for 6th feature');ylabel('Feature_6');xlabel('Creast Factor - Kapha');

% figure;
% subplot(1,3,1);
% boxplot(Feature_7(1,1:47)); hold on;boxplot(Feature_7(1,48:65));
% title('Boxplot for 7th feature');ylabel('Feature_7');xlabel('Period (T) - vata');
% subplot(1,3,2);
% boxplot(Feature_8(1,1:47)); hold on;boxplot(Feature_8(1,48:65));
% title('Boxplot for 8th feature');ylabel('Feature_8');xlabel('Period (T) - Pita');
% subplot(1,3,3);
% boxplot(Feature_9(1,1:47)); hold on;boxplot(Feature_9(1,48:65));
% title('Boxplot for 9th feature');ylabel('Feature_9');xlabel('Period (T) - Kapha');
% 
% 
%% 4. Gaussian distribution for each feature
%  xx=0:0.001:10;
%  gw1=gaussmf(xx, [std(Feature_1), mean(Feature_1)])/(sqrt(2*pi)*std(Feature_1)); %defnition
%  gw2=gaussmf(xx, [std(Feature_2), mean(Feature_2)])/(sqrt(2*pi)*std(Feature_2)); %defnition
%  gw3=gaussmf(xx, [std(Feature_3), mean(Feature_3)])/(sqrt(2*pi)*std(Feature_3)); %defnition
%  gw4=gaussmf(xx, [std(Feature_4), mean(Feature_4)])/(sqrt(2*pi)*std(Feature_4)); %defnition
%  gw5=gaussmf(xx, [std(Feature_5), mean(Feature_5)])/(sqrt(2*pi)*std(Feature_5)); %defnition
%  gw6=gaussmf(xx, [std(Feature_6), mean(Feature_6)])/(sqrt(2*pi)*std(Feature_6)); %defnition
%  gw7=gaussmf(xx, [std(Feature_7), mean(Feature_7)])/(sqrt(2*pi)*std(Feature_7)); %defnition
%  gw8=gaussmf(xx, [std(Feature_8), mean(Feature_8)])/(sqrt(2*pi)*std(Feature_8)); %defnition
%  gw9=gaussmf(xx, [std(Feature_9), mean(Feature_9)])/(sqrt(2*pi)*std(Feature_9)); %defnition
%  gw10=gaussmf(xx, [std(Feature_10), mean(Feature_10)])/(sqrt(2*pi)*std(Feature_10)); %defnition
%  
%  G=[gw1; gw2; gw3; gw4 ;gw5; gw6; gw7; gw8; gw9; gw10 ];
%  Gm=mean(G);
%  figure;
%  for i=1:10
%  plot(G(i,:),'r');hold on;
%  end
% plot(gw1,'r');hold on;
 %% 5. kurtosis
%  KURTOSIS=[ kurtosis(Feature_1); kurtosis(Feature_2);kurtosis(Feature_3);kurtosis(Feature_4);
%   kurtosis(Feature_5); kurtosis(Feature_6);kurtosis(Feature_7);kurtosis(Feature_8);
%   kurtosis(Feature_9); kurtosis(Feature_10);kurtosis(Feature_11);kurtosis(Feature_12);
%  kurtosis(Feature_13); kurtosis(Feature_14);kurtosis(Feature_15);kurtosis(Feature_16);
%   kurtosis(Feature_17); kurtosis(Feature_18);kurtosis(Feature_19);kurtosis(Feature_20);
%   kurtosis(Feature_21); kurtosis(Feature_22);kurtosis(Feature_23);kurtosis(Feature_24); 
%   kurtosis(Feature_25); kurtosis(Feature_26);kurtosis(Feature_27);kurtosis(Feature_28);
%   kurtosis(Feature_29); kurtosis(Feature_30);kurtosis(Feature_31);kurtosis(Feature_32);
%   kurtosis(Feature_33); kurtosis(Feature_34);kurtosis(Feature_35);kurtosis(Feature_36);]
% 
% 

%% Dimension reduction
%cov automatically remove means 
R=cov(X'); %covariance between each feature

[V,D]=eigs(R,75);
figure; plot(diag(D),'LineWidth',4);xlabel('PC number','FontSize',12);ylabel('Eigen value','FontSize',12);
title('Scree plot','FontSize',12);
figure; bar(diag(D));%xlabel('PC number');ylabel('Eigen value');
xlim([0 20]);
xlabel('Order of eigen values in descending magnitude','FontSize',12);ylabel('Eigen value','FontSize',12);
title('Scree plot - 10 Largest eigen values','FontSize',12);

%% portion of variance captured by each PC

Potion=diag(D)/sum(diag(D))  % varaince captured by each feature
cumulative=cumsum(diag(D))/sum(diag(D)) % cumulative variance 

%% 10 PC s has 99.39% data - thus reduce to 10 PCs !
%% 20 PCs has 99.98% data variance
% try same with 4 pcs and get the classification results 
%% map the ft space to new space
%X=X'; X1=X1'; X2=X2';

%class Healthy
Y1=X1'*V(:,1:50); %dim reduction to 10?  /  75-- all? eig spaces
%class Diabetic
Y2=X2'*V(:,1:50);

% figure;
% scatter3(Y1(:,7),Y1(:,8),Y1(:,2),'filled'); hold on;
% scatter3(Y2(:,7),Y2(:,8),Y2(:,2),'filled'); hold on;
% xlabel('PC 1');ylabel('PC 2');zlabel('PC 3');
% 
% figure;
% scatter3(Y1(:,4),Y1(:,5),Y1(:,6),'filled'); hold on;
% scatter3(Y2(:,4),Y2(:,5),Y2(:,6),'filled'); hold on;
% xlabel('PC 4');ylabel('PC 5');zlabel('PC 6');
% 
% figure;
% scatter3(Y1(:,6),Y1(:,4),Y1(:,2),'filled'); hold on;
% scatter3(Y2(:,6),Y2(:,4),Y2(:,2),'filled'); hold on;
% xlabel('PC 6');ylabel('PC 4');zlabel('PC 2');

%% FDA

%% map the ft space to new space
YY=[Y1;Y2]; Yt=[zeros(1,47) ones(1,18)];
Yt2=[ones(1,47) 2*ones(1,18)];
XX1=Y1'; XX2=Y2';
m1=mean(XX1,2);
m2=mean(XX2,2);

figure;
scatter(XX2(1,:),XX2(2,:),'ro','filled');hold on;grid on; axis square;
scatter(XX1(1,:),XX1(2,:),'bo','filled');hold on;grid on; axis square;

xlabel('feature 1'); ylabel('feature 2');
title('Before and after application of FDA');

plot(m1(1,1),m1(2,1),'bx','MarkerSize',15); hold on;
plot(m2(1,1),m2(2,1),'rx','MarkerSize',15); hold on;


% m1=m1'; m2=m2';
sb= (m1-m2)*(m1-m2)';   %class separation
sw=cov(XX1')+cov(XX2');   %class scatter / Spread

S=inv(sw)*sb;  % FDR ratio maximizing

[VV,DD]=eigs(S);
YY1=VV'*XX1;
YY2=VV'*XX2;
figure;
scatter(YY2(1,:),YY2(2,:),'r^','filled');hold on;grid on; axis square;
scatter(YY1(1,:),YY1(2,:),'b^','filled');hold on;grid on; axis square;
xlabel('Feature (PC) 1');ylabel('Feature (PC) 2');
title('FDA results for the dataset without Dimension reduction')

Yt2=[ones(1,47) 2*ones(1,18)];
YYY=[YY1 YY2 ;Yt2 ];

%% how to map the PCs back to original axes to find which is better?



%% higher dimension data to 2 dim with t-SNE 

%rng default % for reproducibility
% Z = tsne(YY);
% Z = tsne(YY,'Algorithm','exact','Distance','mahalanobis','Perplexity',65);
% Z = tsne(YY,'Algorithm','exact','Distance','cosine','Perplexity',65);
 %Z = tsne(YY,'Algorithm','exact','Distance','euclidean','Perplexity',2.5);
 Z = tsne(X','Algorithm','exact','Distance','euclidean','Perplexity',48);
 figure;gscatter(Z(:,1),Z(:,2),Yt2)

