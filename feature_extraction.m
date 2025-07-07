%=========================================================
%finding features in time and frequency domain
% in the ensembles obtained after preprocessing

%for feature extraction
%Analysis: from 1-D Time Series to 2-D Matrix
%outlier removal
%=============================================================

clear all; close all; clc;

%% Save and load excel data as mat file
%save('');
%load('');


figure;%subplot(311);
plot(Vata_ensembles(:,5),'k-','LineWidth',3.5);
xlabel('Time (ms)','FontSize',18);ylabel('Voltage (mV)','FontSize',18);
%subplot(312);
figure;plot(Pita_ensembles(:,5),'k-','LineWidth',3.5);
xlabel('Time (ms)','FontSize',18);ylabel('Voltage (mV)','FontSize',18);
%subplot(313);
figure;plot(Kapha_ensembles(:,5),'k-','LineWidth',3.5);
xlabel('Time (ms)','FontSize',18);ylabel('Voltage (mV)','FontSize',18);

V=Vata_ensembles;P=Pita_ensembles;K=Kapha_ensembles;
NADI= [V ;P; K];
%%  Shape features

    %% finding the ending of each pulse
    %period
     
    pulse_endv=zeros(1,size(V,2)); % end sample number without nan 
    Tv=zeros(1,size(V,2)); %pulse length
   for pl=1:1:size(V,2)
      pulse_endv = find(isnan(V(:,pl)),1); % first nan index
      
      if pulse_endv~=0   % if nan is present pulse is upto nan
        Tv(1,pl)=pulse_endv-1;  % period of each pulse
      else   %if no nan then it is the full length of pulse
        Tv(1,pl)=length(V(:,pl));
      end
   end

      pulse_endp=zeros(1,size(V,2)); % end sample number without nan 
    Tp=zeros(1,size(V,2)); %pulse length
   for pl=1:1:size(V,2)
      pulse_endp = find(isnan(P(:,pl)),1); % first nan index
      
      if pulse_endp~=0   % if nan is present pulse is upto nan
        Tp(1,pl)=pulse_endp-1;  % period of each pulse
      else   %if no nan then it is the full length of pulse
        Tp(1,pl)=length(P(:,pl));
      end
   end
   
      pulse_endk=zeros(1,size(V,2)); % end sample number without nan 
    Tk=zeros(1,size(V,2)); %pulse length
   for pl=1:1:size(V,2)
      pulse_endk = find(isnan(K(:,pl)),1); % first nan index
      
      if pulse_endk~=0   % if nan is present pulse is upto nan
        Tk(1,pl)=pulse_endk-1;  % period of each pulse
      else   %if no nan then it is the full length of pulse
        Tk(1,pl)=length(K(:,pl));
      end
   end

T=[Tv; Tp ;Tk]/1000;

%% 

PEAKS=zeros(3,size(V,2)); % max of all 3 nadi pulses- ensemble
MEANS=zeros(3,size(V,2));  % mean of nadi- ensemble 
NADI_STD=zeros(3,size(V,2));   %std for nadi pulse- ensemble
NADI_RMS=zeros(3,size(V,2));   % rms values of nadi ensemble avg pulse


for n=1:1:size(V,2)
%[PKS(1,n),LOCS(1,n)]= findpeaks(V(:,n));
 PEAKS(1,n)=max(V(:,n));
 PEAKS(2,n)=max(P(:,n));
 PEAKS(3,n)=max(K(:,n));
 
 MEANS(1,n)=nanmean(V(:,n));
 MEANS(2,n)=nanmean(P(:,n));
 MEANS(3,n)=nanmean(K(:,n));
 
 NADI_STD(1,n)=nanstd(V(:,n));
 NADI_STD(2,n)=nanstd(P(:,n));
 NADI_STD(3,n)=nanstd(K(:,n));
 
 NADI_RMS(1,n)= sqrt(mean(V(:,n) .* V(:,n), 'omitnan'));
 NADI_RMS(2,n)= sqrt(mean(P(:,n) .* P(:,n), 'omitnan'));
 NADI_RMS(3,n)= sqrt(mean(K(:,n) .* K(:,n), 'omitnan'));
  
end



%% PSD Ratio

%% sampling frequency
Fs = 1000;            % Sampling frequency
NADI_PSD=zeros(3,size(V,2));   % psd ratio values of nadi ensemble pulse

for i=1:1:size(V,2)  
t = 0:1/Fs:Tv(1,i)/1000;
[Pxx,W]=pwelch(V(1:length(t)-1,i),[],[],[],Fs,'onesided');
%stem(Pxx);hold on;
NADI_PSD(1,i)=Pxx(1)/Pxx(2);
end

for i=1:1:size(V,2)  
t = 0:1/Fs:Tp(1,i)/1000;
[Pxx,W]=pwelch(P(1:length(t)-1,i),[],[],[],Fs,'onesided');
%stem(Pxx);hold on;
NADI_PSD(2,i)=Pxx(1)/Pxx(2);
end

for i=1:1:size(V,2)  
t = 0:1/Fs:Tk(1,i)/1000;
[Pxx,W]=pwelch(K(1:length(t)-1,i),[],[],[],Fs,'onesided');
%stem(Pxx);hold on;
NADI_PSD(3,i)=Pxx(1)/Pxx(2);
end

%% Intra-class distance
%% for healthy and daibetic-----not the individual and disease spaces!!!!!!
% healthy=47,   diabetic=18; total= 65; 

%% for Vata
%inter-class distance Sb
M1= nanmean(V(:,1:47),2);   % healthy
M2= nanmean(V(:,48:65),2); % diabetic
Sb=(M1-M2)*(M1-M2)';

% intra-class scatter matrix Si
Sx1=(V(:,1:47)*V(:,1:47)')/(47-1);
Sx2=(V(:,48:65)*V(:,48:65)')/(18-1);
SW=Sx1+Sx2;
% Si=  nansum((V(:,1:47)-repmat(M1,1,47))*(V(:,1:47)-repmat(M1,1,47)));
% Sw=sum(Si);
%intra-class distance
Lv=diag(SW)/65;

%% for Pita

M1= nanmean(P(:,1:47),2);   % healthy
M2= nanmean(P(:,48:65),2); % diabetic
Sb=(M1-M2)*(M1-M2)';
% intra-class scatter matrix Si

Sx1=(P(:,1:47)*P(:,1:47)')/(47-1);
Sx2=(P(:,48:65)*P(:,48:65)')/(18-1);
SW=Sx1+Sx2;
% Si=  nansum((V(:,1:47)-repmat(M1,1,47))*(V(:,1:47)-repmat(M1,1,47)));
% Sw=sum(Si);
%intra-class distance
Lp=diag(SW)/65;
 

%% for Kapa

M1= nanmean(K(:,1:47),2);   % healthy
M2= nanmean(K(:,48:65),2); % diabetic
Sb=(M1-M2)*(M1-M2)';
% intra-class scatter matrix Si

Sx1=(K(:,1:47)*K(:,1:47)')/(47-1);
Sx2=(K(:,48:65)*K(:,48:65)')/(18-1);
SW=Sx1+Sx2;
% Si=  nansum((V(:,1:47)-repmat(M1,1,47))*(V(:,1:47)-repmat(M1,1,47)));
% Sw=sum(Si);
%intra-class distance
Lk=diag(SW)/65;


%% ratios   form factor,  crest factor and psd ratio

% Crest factor  V_peak/V_rms

NADI_CF=zeros(3,size(V,2));
NADI_CF=PEAKS./NADI_RMS;

%%
FEATURES=[NADI_PSD; NADI_CF; T];
%save('F:\Academic+Rsrch\Nadi Research\14_Features_of_ensembles\FEATURES.mat','FEATURES');

%% Fitting a gaussian mixture model
% k=2;
% GMModel = fitgmdist(V(:,1),k);
% 
% mu1 = [.5 0.040];
% Sigma1 = [ 0.08 0; 0 2.7985e-05];
% mu2 = [-3 -5];
% Sigma2 = [1 0;0 1];
% rng(1); % For reproducibility
% X = [mvnrnd(mu1,Sigma1,1000); mvnrnd(mu2,Sigma2,1000)];
% figure
% y = [zeros(1000,1);ones(1000,1)];
% %h = gscatter(X(:,1),X(:,2),y);
% hold on
% gmPDF = @(x,y) arrayfun(@(x0,y0) pdf(GMModel,[x0 y0]),x,y);
% g = gca;
% fcontour(gmPDF,[g.XLim g.YLim])
% title('{\bf Scatter Plot and Fitted Gaussian Mixture Contours}')
% legend(h,'Model 0','Model1')
% hold off


