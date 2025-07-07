%=========================================================
%finding features in time and frequency domain
%preprocessing according to:
%preprocessing of wrist pulse analysis
%for features 
%Analysis: from 1-D Time Series to 2-D Matrix
%=============================================================

clear all; close all; clc;

%load NDB;  % all signals with healthy and Diabetic vpk 25001x177
%load TestDB;  % testing set 25001x78
load EDITED_NADI;  % all signals with healthy and Diabetic vpk 25001x195 (clear data)
NADI_DB=Edited_Nadi;  

%% preprocessing

% x=V(:,14);
% scal = 'one';lev=4; % Use model assuming standard Gaussian white noise.
% xd = wden(x,'heursure','s',scal,lev,'sym8');
% Nx = length(x);
% subplot(2,1,1),plot(x), xlim([1 Nx])
% title('Noisy Signal')
% subplot(2,1,2),plot(xd), xlim([1 Nx])
% title('De-noised Signal')

X=NADI_DB;
scal = 'one';lev=4; % Use model assuming standard Gaussian white noise.
Nx = size(X,1);
ND_nw=[];
for i=1:1:195
xd = wden(X(:,i),'heursure','s',scal,lev,'sym8');
ND_nw=[ND_nw xd];  % concatanate   
 end
% figure;
% subplot(2,1,1),plot(X(:,1)), xlim([1 Nx])
% title('Noisy Signal')
% subplot(2,1,2),plot(ND_nw(:,1)), xlim([1 Nx])
% title('De-noised Signal')

t=[1:25001]'/1000;  % time vector after smoothing

%% plots 
% figure; subplot(321); plot(t,NADI_DB(:,10));
% xlabel('Time/s'); ylabel('Voltage/mV');xlim([0 25]);
% title('Original Raw Signal-Vata');
% 
% subplot(322); plot(t,ND_nw(:,10));
% title('De-noised with wavelet method -Vata');
% xlabel('Time/s'); ylabel('Voltage/mV');
% xlim([0 25]);
% %figure; 
% subplot(323); plot(t,NADI_DB(:,11));
% xlabel('Time/s'); ylabel('Voltage/mV');xlim([0 25]);
% title('Original Raw Signal-Pita');
% 
% subplot(324); plot(t,ND_nw(:,11));
% title('De-noised with wavelet method -Pita');
% xlabel('Time/s'); ylabel('Voltage/mV');xlim([0 25]);
% %figure;
% subplot(325); plot(t,NADI_DB(:,12));
% xlabel('Time/s'); ylabel('Voltage/mV');xlim([0 25]);
% title('Original Raw Signal-Kapa');
% subplot(326); plot(t,ND_nw(:,12));
% title('De-noised with wavelet method -Kapa');
% xlabel('Time/s'); ylabel('Voltage/mV');xlim([0 25]);
% 

%% smoothing using a gaussian filter 
% bt = 0.3;
% span = 4;
% sps = 8;
% h = gaussdesign(bt,span,sps);
% fvtool(h,'impulse')
% t1=[1:24001]'/1000;  % time vector after smoothing
% 
% filteredSignal = conv(h,ND_nw(:,1)); 
% figure;
% plot(filteredSignal);hold on;
% plot(t,ND_nw(:,1));
% %filteredSignal = conv(originalSignal, gaussianWindow); 
% % after designing the filter convolve with the original signal
% figure;
% histogram(ND_nw(:,1)); hold on;
% histogram(filteredSignal(:,1));
% 

%% gaussian window
N = 64;
n = -(N-1)/2:(N-1)/2;
alpha = 2;   % inverse of std
w = gausswin(N,alpha);
stdev = (N-1)/(2*alpha);
%(1/sqrt(2*pi)*
y=(1/alpha)*exp(-1/2*(n/stdev).^2);

% figure;  % plot of the used gaussian window
% plot(n,w)
% hold on
% plot(n,y,'.')
% hold off
% xlabel('Samples')
% title('Gaussian Window, N = 64')
% 
ND_nw1=[];  % smoothing all nadi signals
for i=1:1:195 
    z=ND_nw(:,i)';    %-mean(V');
    z=conv(z,y);
    ND_nw1=[ND_nw1 ;z];
end
    ND_DN=ND_nw1(:,500:24500); % denoised
%     figure;plot(z);hold on
%     plot(ND_nw1(1,:),'r');hold on; 
%     plot(ND_DN(255,:));
%   figure;
%   subplot(211);plot(ND_nw1(1,:)); subplot(212);plot(ND_nw(:,1));
t1=[1:24001]'/1000;  % time vector after smoothing

%% plots 
% figure; subplot(321); plot(t,NADI_DB(:,10),'LineWidth',2);
% xlabel('Time(s)','fontweight','bold','Fontsize',16); 
% ylabel('Voltage(mV)','fontweight','bold','Fontsize',16);
% title('Raw Signal-Vata','Fontsize',18);xlim([0 10]);
% subplot(322); plot(t1,ND_DN(10,:),'LineWidth',2);xlim([0 10]);
% xlabel('Time(s)','fontweight','bold','Fontsize',16); 
% ylabel('Voltage(mV)','fontweight','bold','Fontsize',16);
% title('After cascaded filtering -Vata','Fontsize',18);

% figure; 
% subplot(323); plot(t,NADI_DB(:,11),'LineWidth',2);
% xlabel('Time(s)','fontweight','bold','Fontsize',16); 
% ylabel('Voltage(mV)','fontweight','bold','Fontsize',16);
% title('Raw Signal-Pita','Fontsize',18);xlim([0 10]);
% subplot(324); plot(t1,ND_DN(11,:),'LineWidth',2);xlim([0 10]);
% xlabel('Time(s)','fontweight','bold','Fontsize',16);
% ylabel('Voltage(mV)','fontweight','bold','Fontsize',16);
% title('After cascaded filtering -Pita','Fontsize',18);
% % 
% %figure;
% subplot(325); plot(t,NADI_DB(:,12),'LineWidth',2);
% title('Raw Signal-Kapha','Fontsize',18);xlim([0 10]);
% xlabel('Time(s)','fontweight','bold','Fontsize',16);
% ylabel('Voltage(mV)','fontweight','bold','Fontsize',16);
% subplot(326); plot(t1,ND_DN(12,:),'LineWidth',2);xlim([0 10]);
% xlabel('Time(s)','fontweight','bold','Fontsize',16);
% ylabel('Voltage(mV)','fontweight','bold','Fontsize',16);
% title('After cascaded filtering -Kapha','Fontsize',18');
% 

%% sampling frequency
Fs = 1000;            % Sampling frequency
T = 1/Fs;             % Sampling period
L = 25001;             % Length of signal
t = (0:L-1)*T;        % Time vector
f = Fs*(0:(L/2))/L;
t1=[1:24001]'/1000;  % time vector after smoothing

%% one sided fft to determine the range
Y = fft(ND_DN(1,:)');
P2 = abs(Y/L);
P1 = P2(1:ceil(L/2)+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(ceil(L/2)))/L;
% figure;
% plot(f,P1)
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)');
% ylabel('|P1(f)|');
% xlim([0 20]);
% 
% figure;
% plot(abs(fft(ND_DN')));
% xlim([0 20]);

%% separating Vata Pita and Kapa total lenght signal 
%% (24001 samples- 24 s ... after smoothing with gaussian window)
V=[];
P=[];
K=[];
ND_nw2=ND_DN';  %denoised signals separating
for i=1:3:193     %59 each (255 training and testing)
    
VV=ND_nw2(:,i);  % full length signal 25001 samples 
PP=ND_nw2(:,i+1);
KK=ND_nw2(:,i+2);

V=[V VV];  % concatanate 
P=[P PP];
K=[K KK];

end
K=K/10;

%% Approximate entropy for the denoised time series data (Nadi)
% 
% APE_V=zeros(1,65);
% APE_P=zeros(1,65);
% APE_K=zeros(1,65);
% for i=1:1:65     %59 each (255 training and testing)
%     
% APE_V(1,i)=approximateEntropy(V(:,i));  % full length signal 25001 samples 
% APE_P(1,i)=approximateEntropy(P(:,i));
% APE_K(1,i)=approximateEntropy(K(:,i));
% end
%% Hilbert Huang Transform (HHT)

fs=1000;
[imf,residual,info] = emd(K(:,65)','Interpolation','spline');
[hs,f,t,imfinsf,imfinse] = hht(imf);  % imfinsf- inst freq,  imfinse- ins energy
% [ifq,t] = instfreq(V(:,2)',fs) % instantaneous frequency
%hht(imf,fs,'FrequencyLimits',[0 20]);  %hilbert spectrum  
%emd(P(:,1)');% Empirical mode decomposition - IMFs -(Intrinsic mode functions)

% figure;
% hht(imf(:,1),fs,'FrequencyLimits',[0 20])

N= size(imf,2)-1;   % no of IMFs, last one is the residual
l=size(imf,1);  %size of the IMFs (time axis)

avg_inst_amp=(sum(imf)/l)';   % average instantaneous amplitude for IMFs
avg_inst_freq= (sum(imf.* imfinsf)./sum(imf))';   % average instantaneous freq for IMFs
pwr= (sum(abs(imfinse).^2)./sqrt(sum(sum(abs(imfinse).^2))))'; % power for each IMF

% take first 4 IMF features -inst amplitude, freq and power

%% direction positive and negative nadi examples
% figure;
% subplot(2,1,1);
% plot(t1,V(:,9),'LineWidth',2);
% xlabel('Time (s)    [a]','fontweight','bold','Fontsize',16);
% ylabel('Voltage (mV) ','fontweight','bold','Fontsize',16);
% xlim([0 10]);
% title('Vata signal positive assumed direction ','Fontsize',18);
% subplot(2,1,2);
% plot(t1,-V(:,6),'LineWidth',2);
% xlabel('Time (s)   [b]','fontweight','bold','Fontsize',16);
% ylabel('Voltage (mV) ','fontweight','bold','Fontsize',16);
% xlim([0 10]);
% title('Vata signal negative assumed direction ','Fontsize',18);
%% Peak detection, baseline wander removal & pulse segmentation
%(for Vata)
ENSEMBLES=zeros(65,1000);

for n=1:1:1 %max=65
      n=65;
     V=K;
    [pks,locs,W,p] = findpeaks(V(:,n),'MinPeakDistance',500); % locs in indices instead of seconds
    %name2={'Vata signal with peak locations','Pita signal with peak locations','Kapha signal with peak locations'};
%      figure;
%      subplot(2,1,1);
%      plot(t1,V(:,n));hold on;
%      stem(locs/1000,pks); %pks plotted in {location/1000+t1(1)} intervals
%     title('Vata smoothed signal and peak locations');
%     %title(name2(n));
%      xlabel('Time/s');
%      ylabel('Voltage /mV ');
%      legend('Vata signal- de-noised', 'Peaks');

    [pks1,locs1,W1,p1] = findpeaks(-V(:,n),'MinPeakDistance',500); % locs in indices instead of seconds
%      subplot(2,1,2);
%      plot(t1,-V(:,n)); hold on;
%      stem(locs1/1000,pks1);
%      xlabel('Time/s');
%      ylabel('Voltage /mV ');
%      title('Negated Vata smoothed signal and valley locations');
%      legend('Negated Vata signal- de-noised', 'Valleys');
%     
%      figure(100);
%      subplot(2,1,1);
%      plot(t1,V(:,n)); hold on;
%      xlabel('valleys');
%      ylabel('Voltage /mV ');
%      title('Pita smoothed signal before direction adjustment');
%      
   
 %% finding Pulse Direction
 
% l1=length(locs);l2=length(locs1);
% sum1=0; sum2=0;
%    if (l1<l2)
%          for i=2:min(l1,l2)-1
%             if (locs(i-1)<locs1(i)<locs(i))
%                   sum1=sum1+(locs1(i)-locs(i-1));
%                   %sum1=sum1+min((locs1(i+1)-locs(i)),(locs1(i+2)-locs(i)))   ;
%                   sum2=sum2+(locs(i-1)-locs1(i-1));
%                   %sum2=sum2+max((locs(i)-locs1(i)),(locs(i)-locs1(i+1))); 
%             else
%                 i=i+1;
%             end    
%          end   
%     else 
%                   for i=2:min(l1,l2)-1
%                         if (locs1(i-1)<locs(i)<locs1(i))
%                                sum1=sum1+(locs(i)-locs1(i-1));
%                                %sum1=sum1+min((locs(i+1)-locs1(i)),(locs(i+1)-locs1(i-1)))   ;
%                                sum2=sum2+(locs1(i-1)-locs(i-1));
%                                %sum2=sum2+max((locs1(i)-locs(i)),(locs1(i)-locs(i+1)));   
%                         else
%                                 i=i+1;
%                                 
%                         end        
%                   end
%    end

    %% pulse direction method 3
    l1=length(locs);l2=length(locs1);
    sum1=0; % right side of the pulse from peak
    sum2=0;  % left side of the pulse from peak
    pulse_vlocs=[];  % start and end of pulses with valley as the onset
    pulse_plocs=[];
    if (l1<=l2) % assuming lesser number is acually peaks and other is valleys
        for e=1:l2-1  %valleys
            for f=1:l1-1 % peaks
                if (locs1(e)<locs(f)<locs1(e+1))
                    sum1=sum1+(locs1(e+1)-locs(f));
                    sum2=sum2+(locs(f)-locs1(e));
                    pulse_vlocs=[pulse_vlocs; locs1(e) locs1(e+1)]; % from valley to valley
                    pulse_plocs=[pulse_plocs; locs(f) locs(f+1)];  %from peak to peak
                else
                    e=e+1;
                    f=f+1;
                end 
            end 
        end
        Direction= (1/(l1-1))*sum1-(1/l1)*sum2;
    else    % if the valleys are less(i.e now the peaks are @ locs1)
         for e=1:l1-1  % valleys
             for f=1:l2-1  %peaks
                if (locs(e)<locs1(f)<locs(e+1))
                    sum1=sum1+(locs(e+1)-locs1(f));
                    sum2=sum2+(locs1(f)-locs(e));
                    pulse_vlocs=[pulse_vlocs; locs(e) locs(e+1)];  % from valley to valley
                    pulse_plocs=[pulse_plocs; locs1(f) locs1(f+1)];  %from peak to peak
                else
                    e=e+1;
                    f=f+1;
                end    
             end
         end
          Direction= (1/(l2-1))*sum1-(1/l2)*sum2;
    end
    
%     %% finding Pulse Direction
%      l1=length(locs);l2=length(locs1);
%      sum1=0; % right side of the pulse from peak
%      sum2=0;  % left side of the pulse from peak
%      if (l1<l2)   % assuming lesser number is acually peaks and other is valleys
%          for i=2:l1-2
%            %s1=locs1(i+1)-locs(i);
%            sum1=sum1+min((locs1(i+1)-locs(i)),(locs1(i+2)-locs(i)))   ;
%            %s2=locs(i)-locs1(i);
%            sum2=sum2+max((locs(i)-locs1(i)),(locs(i)-locs1(i+1)));   
%          end
%      else 
%          for i=2:min(l1,l2)-2
%            %s1=locs1(i+1)-locs(i);
%            sum1=sum1+min((locs(i+1)-locs1(i)),(locs(i+1)-locs1(i-1)))   ;
%            %s2=locs(i)-locs1(i);
%            sum2=sum2+max((locs1(i)-locs(i)),(locs1(i)-locs(i+1)));   
%          end
%          
%      end
     
    
     D=sign(Direction);
%      if (D==-1)
%          D=-1;
%          V(:,n)= -V(:,n);
%      else 
%          D=1;
%      end
     %% pulse direction adjustment
    Y=D*V(:,n)+((1-D)/25001)*sum(V(:,n));
    V(:,n)=Y;   % assign back into matrix after direction adjustment
      
     
     %% cubic spline interpolation to estimate the baseline
    if D>0 % if direction of signal is correct
         x = [locs1];
         y = [-pks1];
         px=[locs]; py=[pks];
    else  %if direction is wrong
        x = [locs];
        y = [-pks];
        px=[locs1]; py=[-pks1];
       % V(:,n)= -V(:,n);
    end
    %n=19;
  %% baseline and after removing plot
     xx = linspace(0,24001,24001);
%     figure;subplot(211); plot(V(:,n),'LineWidth',2);hold on;
%     plot(xx,csapi(x,y,xx),'k-',x,y,'ro','LineWidth',2); 
%     title('Interpolant with valleys','Fontsize',18);
%     xlabel('Sample points    [a] ','fontweight','bold','Fontsize',16);
%     ylabel('Voltage (mV)','fontweight','bold','Fontsize',16); 
%     legend('Nadi signal','Baseline');
%     subplot(212);
%     
    Nadi_bremoved=V(:,n)-csapi(x,y,xx)';
%     plot(t1, Nadi_bremoved,'LineWidth',2);
%     title('After baseline removal','Fontsize',18);
%     xlabel('Time (s)    [b]','fontweight','bold','Fontsize',16);
%     ylabel('Voltage (mV)','fontweight','bold','Fontsize',16); 
%     
%%     
%     figure(100);   subplot(2,1,2);
%    plot( t1,Nadi_bremoved);
%      xlabel('Time');
%      ylabel('Voltage /mV ');
%     title('After Direction Adjustment');
    %% period segmentation and normalization
    
    %% segmenting according valleys
     
%     [Pulse_onsets,IA,IC] = unique(pulse_vlocs,'rows');  % to get the onsets and offset of the pulses with valleys
% 
%     for i=1:size(Pulse_onsets,1)
%         pulse=Nadi_bremoved(Pulse_onsets(i,1):Pulse_onsets(i,2));
%         pulse_segments(1:length(pulse),i)=pulse;
%      end
%      
%       pulse_segments(pulse_segments==0)=NaN;   
%       figure;
%       plot( pulse_segments); hold on;
%       title('Segmenting with valleys as onset');
%      % Ensemble_average=nanmean(pulse_segments');   % ensemble average
%      % figure; plot(Ensemble_average,'k', 'MarkerSize',50);
%       
%       NumOfPulses= size(pulse_segments,2);
%       Time_axis=zeros(size(pulse_segments));
%       
        %% segmenting according to peaks
%     
%     [Pulse_ponsets,IB,ID] = unique(pulse_plocs,'rows');  % to get the onsets and offset of the pulses with valleys
%         
%     for i=1:size(Pulse_ponsets,1)
%         pulse=Nadi_bremoved(Pulse_ponsets(i,1):Pulse_ponsets(i,2));
%         pulse_segmentsp(1:length(pulse),i)=pulse;
%      end
%     
%       pulse_segmentsp(pulse_segmentsp==0)=NaN;   
%       figure;
%       plot( pulse_segmentsp);
%        title('Segmenting with peaks as onset');
%       NumOfPulses= size(pulse_segmentsp,2);
%       Time_axis=zeros(size(pulse_segmentsp));
      
      
    %%  segmenting with first derivative as the onset
    
      df1=diff( Nadi_bremoved); 
     [pks2,locs2,W2,p2] = findpeaks(df1,'MinPeakDistance',500); % locs od local maximums
    
%       figure; 
%       plot( Nadi_bremoved);hold on;
%       plot(df1); hold on;
%       stem(locs2,pks2);
%       xlabel('Sampling Points'); ylabel('Voltage/mV');
%       title('signal, first derivative and local maximum locations');
%       legend('Baseline wander removed signal','first derivative','local maximums');
%       
       xf=[locs2]; 
    for i=1:(length(locs2)-1)
        pulse=Nadi_bremoved(xf(i):xf(i+1));
        pulse_segments_df(1:length(xf(i):xf(i+1)),i)=pulse;
    end
      pulse_segments_df(pulse_segments_df==0)=NaN;   
      %% plot of pulse segments
%       
%       figure;
%       plot( pulse_segments_df,'color','b','LineWidth',2);
%       xlabel('Time (ms)','fontweight','bold','Fontsize',16);
%       ylabel('Voltage (mV)','fontweight','bold','Fontsize',16);
%       title('Pulse segments with first derivative local maximums as onset','Fontsize',18);
%       hold on;
%       pulse_segments_df(isnan(pulse_segments_df))=0;
%       plot(mean(pulse_segments_df'),'color','r','LineWidth',4);
%       
      
     %%
      pulse_segments=pulse_segments_df;
      NumOfPulses= size(pulse_segments_df,2);
      Time_axis=zeros(size(pulse_segments_df));
      
      
      %% extracting time length of each pulse 
     
      pulse_lengths=zeros(1,NumOfPulses);
      pulse_end=zeros(1,NumOfPulses); 
      
      % finding the ending of each pulse
   for pl=1:1:NumOfPulses
      pulse_end = find(isnan(pulse_segments(:,pl)),1); % first nan index
      if pulse_end~=0   % if nan is present pulse is upto nan
        pulse_lengths(:,pl)=pulse_end-1;
      else   %if no nan then it is the full length of pulse
        pulse_lengths(:,pl)=length(pulse_segments(:,pl));
      end
   end
 
%% drop segments with very small pulse lengths

drop=find(pulse_lengths<=1);
for d=1:1:length(drop)
pulse_lengths(:,drop)=[];
pulse_segments(:,drop)=[];


end
   
   %%
   
    pulse_lengths  %=ceil(pulse_lengths)
%       figure;boxplot(pulse_lengths);
     M= median(pulse_lengths)
     mn=mean( pulse_lengths) 
     mode1=mode(pulse_lengths)
    % mode1=1000;
  %% pulse rotation to get them horizontal   
      NumOfPulses= size(pulse_segments,2);
      RotatedPulse=zeros(size(pulse_segments));
      Time_axis=zeros(size(pulse_segments));
%       figure;
%       plot(pulse_segments(:,1:NumOfPulses));   
      Time_axis=[]; RotatedPulse=[];
      
      for r=1:1:NumOfPulses
                %p=10;
              pulse_end =ceil( pulse_lengths(1,r)) ;
                     %finding rotation angle
              theta_y= (pulse_segments(pulse_end,r)-pulse_segments(1,r));
              theta_x= pulse_end/1000;
              theta= atan(theta_y/theta_x);  % radians
              pulse_t=[0:1:pulse_end-1]'/1000;  % length of a single pulse
            
              Rotation=[cos(theta) -sin(theta); sin(theta) cos(theta)];
              PulseBeforeRotation=[pulse_t  pulse_segments(1:pulse_end,r)];
             
              PulseAfterRotation = PulseBeforeRotation*Rotation;
             
              RotatedPulse(1:size( PulseAfterRotation,1),r)= PulseAfterRotation(:,2);  
              Time_axis(1:size( PulseAfterRotation,1),r)=PulseAfterRotation(:,1);
      end
      
%        figure;
%       plot( Time_axis(:,1),RotatedPulse(:,1));
    %  t_rot=[1:1:size(RotatedPulse(:,1),1)]/1000;
    
%       figure;%subplot(211);
%        plot(pulse_segments_df(:,:),'r');hold on;
       
%       xlabel('Time/ mS'); ylabel('Amplitude/ mV ');
%       title('Pulse segments before rotation trnsformation');
      %subplot(212);
      
%       plot(RotatedPulse(:,:),'b');
%       title('Pulse segments after axis rotation');
%       xlabel('Samples'); ylabel('Amplitude/ mV ')
      %legend('After Rotation','Before Rotation');
      
      %% DTW for downsampling
%       RotatedPulse(RotatedPulse==0)=NaN;
%       
%        D=zeros(NumOfPulses,NumOfPulses);
%       
%       for  i=1:1:NumOfPulses
%           for j=1:1:NumOfPulses
%           D(i,j)=dtw(RotatedPulse(1:pulse_lengths(1,i),i),RotatedPulse(1:pulse_lengths(1,j),j));
%           end
%       end
%        figure; dtw(RotatedPulse(1:pulse_lengths(1,1),1),RotatedPulse(1:pulse_lengths(1,2),2));
%      
      
     %% downsampling 
     
%      figure;  plot(RotatedPulse(:,:));

     % using linear interpolation
     
%      RotatedPulse=pulse_segments;
Resampled_mat=[];
pulse_lengths=ceil(pulse_lengths);
for h=1:1:NumOfPulses
    if pulse_lengths(1,h)~=1
         resampled = interp1(linspace(0,1,pulse_lengths(1,h)),RotatedPulse(1:pulse_lengths(1,h),h) , (linspace(0,1,mode1))); 
         Resampled_mat=[Resampled_mat resampled']; 
    else
        h=h+1;
    end    
end

%  figure;
%  plot(Resampled_mat);
%  title('Pulse segments Resampled to the mode');
%  xlabel('Time/ ms'); ylabel('Amplitude');
%  
 
 new_NumOfPulses=size(Resampled_mat,2);


%     RotatedPulse(isnan(RotatedPulse))=0;
%     NON_ZeroColumns=find(any(RotatedPulse));  % find only columns that has data
%     pre_resampling=RotatedPulse(:,NON_ZeroColumns);
%     pre_Resam_time= Time_axis(:,NON_ZeroColumns);
%     Pre_pulse_lengths=pulse_lengths(:,NON_ZeroColumns);
%     Pulse_Resampledmat=zeros(ceil(mean(Pre_pulse_lengths)),length(NON_ZeroColumns));
%     %Pulse_Resampledmat=[];
% %    for q=1:1:length(NON_ZeroColumns)
% %        %q=5;
% %        %Pulse_resampled = interp1(linspace(0,Pre_pulse_lengths(1,q))/1000,Pre_pulse_lengths(1,q)),pre_resampling(1:Pre_pulse_lengths(1,q),1),...
% %        %   (linspace(0,ceil(mean(Pre_pulse_lengths))/1000, ceil(mean(Pre_pulse_lengths))));
% %       X=0:0.001:(pulse_lengths(:,NON_ZeroColumns(1,q))-1)/1000;
% %       V=pre_resampling(1:Pre_pulse_lengths(1,q),1);
% %       Xq=0:0.001:(ceil(mean(Pre_pulse_lengths))-1)/1000;
% %       Vq= interp1(X,V,Xq);
% %       Pulse_Resampledmat(:,q)= Vq;
% %    end 
%  
%   
% %       figure;  plot(Pulse_Resampledmat);   %plot(Xq,Vq); hold on; plot(X,V);  
%       
      %% resampling with resample function
%       Resampled=zeros(size(pulse_segments));
%       for z=1:1:length(NON_ZeroColumns)-1
%       new_pulses = resample(pre_resampling(:,z),ceil(mean(Pre_pulse_lengths)),Pre_pulse_lengths(1,z));
%       Resampled(1:length(new_pulses),z)= new_pulses; 
%       end 
%        figure;
%        plot(Resampled);    
%       

    %% pulse similarity measure with dtw to remove outliers
    
     % D=zeros(new_NumOfPulses,new_NumOfPulses);
     D1=zeros(new_NumOfPulses,new_NumOfPulses); 
     
      for  i=1:1:new_NumOfPulses           %new_NumOfPulses
          for j=1:1:new_NumOfPulses          %new_NumOfPulses
          %D(i,j)=dtw(Resampled_mat(:,i),Resampled_mat(:,j));
             D1(i,j)=dtw(Resampled_mat(:,i),Resampled_mat(:,j));
          end
      end
      
      %% DTW is not aligining the important features properly due to singularities
      
%        %[qqq,ix,iy]
%        %[Dist,D,k,w,rw,tw]
%        [qqq,ix,iy]=dtw(RotatedPulse(1:pulse_lengths(1,1),1),RotatedPulse(1:pulse_lengths(1,2),2));
%         figure; plot(RotatedPulse(ix,1));hold on;plot(RotatedPulse(iy,2));
%         title('DTW is not aligning pulse 1 and 2');
%         length(ix)
%         length(iy)
%        [qqq,ix,iy]=dtw(RotatedPulse(1:pulse_lengths(1,1),1),RotatedPulse(1:pulse_lengths(1,3),3));
%         figure; plot(RotatedPulse(ix,1));hold on;plot(RotatedPulse(iy,2));
%         title('DTW is not aligning pulse 1 and 3');
      %%
      P=sum(D1); % pulsle similarity measure
      Outlier_Threshold=mean(P);
      Similar_pulses=find(Outlier_Threshold>P);
      %Similar_Pmat=Resampled_mat(:,Similar_pulses);% similar pulses in the signal after outlier removal
      Similar_Pmat=Resampled_mat(:,Similar_pulses);% similar pulses in the signal after outlier removal

      %% Similar pulses and outliers 
%       
%       figure; subplot(211); plot(Similar_Pmat,'LineWidth',2);  
%       title('Similar pulses','Fontsize',18);
%       xlabel('Time (ms)','fontweight','bold','Fontsize',16);
%       ylabel('Amplitude (mV)','fontweight','bold','Fontsize',16);
%  
%       outliers=find(Outlier_Threshold<P);
%      subplot(212);   plot(Resampled_mat(:,outliers),'LineWidth',2);  %outliers in the signal
%       title('Outliers','Fontsize',18);
%       xlabel('Time (ms)','fontweight','bold','Fontsize',16);
%       ylabel('Amplitude (mV)','fontweight','bold','Fontsize',16);
%  
     %% amplitude normalization
     
        Amp_normalised_pulses=zeros(size(Similar_Pmat));
     for  i=1:1:size(Similar_Pmat,2)
       Amp_normalised_pulse=(Similar_Pmat(:,i)-min(Similar_Pmat(:,i)))./(max(Similar_Pmat(:,i))-min(Similar_Pmat(:,i)));
       Amp_normalised_pulses(:,i)=Amp_normalised_pulse;
     end
        
%      figure; plot(Amp_normalised_pulses); %hold on;  plot(Similar_Pmat);
%      title('Similar Pulses after Amplitude Normalization');
%      xlabel('Time/ ms'); ylabel('Amplitude');
     
     
     
     
     %% ensemble average
     Ensemble=mean(Amp_normalised_pulses');
     Ensemble=Ensemble';
      figure; plot(Ensemble,'LineWidth',3);
     title('Ensemble average- kapha','Fontsize',16);
     xlabel('Time (ms)','fontweight','bold','Fontsize',14);
     ylabel('Amplitude (mV)','fontweight','bold','Fontsize',14);
    
  ensemble = interp1(linspace(0,1,length(Ensemble)),Ensemble , (linspace(0,1,1000))); 
%   ENSEMBLES(n,:)= ensemble;
         
 %% plot of ensemble average
     figure; plot(ensemble,'k-','LineWidth',4);
    % title('Ensemble average- kapha','Fontsize',16);
     xlabel('Time (ms)','fontweight','bold','Fontsize',14);
     ylabel('Amplitude (mV)','fontweight','bold','Fontsize',14);

%% Obtaining Non-periodic space ; D=X-F 
X=Amp_normalised_pulses;  % combined pulses
F=repmat(Ensemble,1,size(X,2));
D=X-F;
% figure; plot(D);
[v,d]=eigs(D*D');
dd=diag(d)
end
% figure; plot(Y); hold on; plot(V(:,39));

%  figure;
%       plot( pulse_segments_df,'LineWidth',2);
%       xlabel('Time (ms)','fontweight','bold','Fontsize',16);
%       ylabel('Voltage (mV)','fontweight','bold','Fontsize',16);
%       title('Pulse segments with first derivative local maximums as onset','Fontsize',18);
%       hold on;
%       plot(Ensemble,'color','r','LineWidth',3);

ERR=var(pulse_segments_df');
% figure;   %plot(Ensemble,'color','r','LineWidth',3);
% errorbar(1:50:950,Ensemble , ERR);
% 
% 
% figure
% 
% subplot(2,1,1)
% boxplot(pulse_segments_df')
% 
% subplot(2,1,2)
% boxplot(pulse_segments_df','PlotStyle','compact')
% 
% 

