

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Preprocessing of the Naadi signal
%and extracting clear part
%Finding Features of the naadi signals 
% features from periodic and non-periodic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
 close all;
 clc;
 
%% Import the data
[~, ~, raw] = xlsread('H:\naadi\Project\Week 5\database_friends\ruvini.xlsx','Sheet1','A40000:C70000');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};

%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
vata = data(:,1);
pita = data(:,2);
kapha = data(:,3);

%% Clear temporary variables
clearvars data raw R;

Vata=vata;
Pita=-pita;
Kapha=kapha/10;
naadi=[Vata,Pita,Kapha];
name={'Vata raw signal','Pita raw signal','Kapha raw signal'};

%time and frequency setting
t1=[1:30001]'; 
Fs=1000;  %sampling frequency
t=0:1/Fs:(size(naadi,1)-1)/Fs;   %time scale
t=t';

figure(1);
plot(t,vata);
hold on;
plot(t,pita);
hold on;
plot(t,kapha/10);
title('Raw signal');
legend('Vata','Pita','Kapha');
xlabel('Time /s');
ylabel('Voltage /V ');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Remove this part and add in the VI to select the same lenght
%%
%obtaining portion of signal for processing 
% t1=[1:40001]'; 
% Vata=vata(20000:60000);
% Pita=-pita(20000:60000);
% Kapha=kapha(20000:60000)/10;
% naadi=[Vata,Pita,Kapha];
% name={'Vata raw signal','Pita raw signal','Kapha raw signal'};
% xlabel('Time samples');
% ylabel('Voltage /V ');
%%

Ensemble=[];
newZ=nan(length(550:1650),3);
maxpks=nan(1,3);
en_mean=nan(1,3);
en_sigma=nan(1,3);
en_energy=nan(1,3);
en_rms=nan(1,3);
en_absdc=nan(1,3);
en_pwr=nan(1,3);
absdc=nan(length(550:1650),3);


for n=1:1:3
   
n=1;

%raw data 
figure(2);
subplot(3,1,n);
plot(t,naadi(:,n));
title(name(n));

%removing baseline 
% removing a 10th order polinomial baseline from data

name1={'Vata signal with fitted baseline','Pita signal with fitted baseline','Kapha signal with fitted baseline'};
opol = 10;
[p,s,mu] = polyfit(t,naadi(:,n),opol);
bsline = polyval(p,t,[],mu);
hold on;
plot(t,bsline);
title(name1(n));

%  obtaining pre processed signal
B(:,n) = naadi(:,n) - bsline;

% % first derivative of the signal B to find feature matrix
% % sB = smooth(B,5);
%  dB= diff(B);% diff Difference and approximate derivative.

%%
% Seperating naadi pulses in the signal considered
%method 1- findpeaks
[pks,locs,W,P] = findpeaks(B(:,n),'MinPeakDistance',500); % locs in indices instead of seconds
name2={'Vata signal with peak locations','Pita signal with peak locations','Kapha signal with peak locations'};
figure(3);
subplot(3,1,n);
plot(t,B(:,n));
hold on
stem(locs/1000,pks) %pks plotted in {location/1000+t1(1)} intervals
%title('Original signal and peak locations');
title(name2(n));
xlabel('Time /s');
ylabel('Voltage /V ');

b=diff(locs);   % difference between two stems
frqlocsdiff=mode(b);  % mode of stem differences
maxlocsdiff=max(b);   %maximum of  stem differences
%same_L_mat=zeros(length(b),maxlocsdiff);   %matrix with same length as max width if a pulse

% obtaining the pulse rate using stems
beats=length( locs/1000+t1(1));
time=length(t1)/1000;
Pulse_rate=round((beats/time)*60)


BB=sort(b);
B1=BB(end)+BB(end-1);

%peakdet=size(naadi);
allpulse=zeros(B1,length(locs)-2);
%T=1:length(allpulse);
% 
figure(4)
for i=1:(length(locs)-2)
    pulsepk=length(B(locs(i):locs(i+2)));
allpulse(1:pulsepk,i)=B(locs(i):locs(i+2),n);
subplot(1,3,n);
    plot(B(locs(i):locs(i+2),n))
     hold on;
  
end
name3={'Vata-Realizations peak not aligned','Pita-Realizations peak not aligned','Kapha-Realizations peaks not aligned'};
%title('Realizations peaks not centered ');
title(name3(n));
%  figure();
xlabel('Time /s');
ylabel('Voltage /V ');
% plot(mean(allpulse))
% plot(mean(allpulse'),'LineWidth',2); % ensemble average


% aligning the peaks of each realization
aligned=nan(2*max(b)+1,length(locs)-2);
orig=max(b)+1;

for  i=1:(length(locs)-2)
    
  X=orig-b(i);
  Y=length(locs(i+1):locs(i+2));
 aligned(X:orig,i)=B(locs(i):locs(i+1),n);
 aligned(orig:Y+orig-1,i)=B(locs(i+1):locs(i+2),n);     
end

name3={'Vata-Realizations peaks aligned','Pita-Realizations peaks aligned','Kapha-Realizations peaks aligned'};
figure(5);
subplot(1,3,n);
 plot(aligned);
%title('Realizations with peaks aligned');
title(name3(n));
xlabel('Time /s');
ylabel('Voltage /V ');


locsdiff=size(length(locs-1));
for i=1:(length(locs)-1)
    locsdiff(i)=locs(i+1)-locs(i);
end

%pulse rate
beats=length( locs/1000+t1(1));
time=length(t1)/1000;
Pulse_rate=round((beats/time)*60);

%T=1:length(U);

%ensemble average 
 Z=nanmean(aligned');
 %Z'
 %Ensemble(:,n)=Z;
%   figure(5);
%  plot(Z);
%  title('Ensemble Average');  
 name4={'Ensemble average-Vata','Ensemble average-Pita','Ensemble average-Kapha'};
figure(9)
%hold on;
subplot(1,3,n);
 plot(Z,'LineWidth',2); % ensemble average
%plot(T,STD,'c','LineWidth',2);
%title('Ensemble average ');
title(name4(n));
hold on;  
% ax = gca; % current axes
% ax.FontSize = 12;
% ax.TickDir = 'out';
% ax.TickLength = [0.002 0.002];
 %ax.YLim = [-0.02 0.02];   %y axis scaling
 xlabel('Time /s');
ylabel('Voltage /V ');
 axis([550 1650 -0.005 0.015]) ; %x and y axis scaling


 figure(10);
 plot(Z,'LineWidth',2); % ensemble average
%plot(T,STD,'c','LineWidth',2);
title('Ensemble averages of Vata, Pita and Kapha ');
legend('Vata','Pita','Kapha');
axis([550 1650 -0.005 0.015]) ; %x and y axis scaling
hold on; 
xlabel('Time /s');
ylabel('Voltage /V ');

%new ensemble extraction
newZ(:,n)=Z(550:1650);
figure(15);
subplot(1,3,n);
plot(newZ(:,n));
hold on;
[pks,locs,W,P] = findpeaks(newZ(:,n));
hold on;
stem(locs,pks);
maxpks(1,n)=max(pks);
en_mean(1,n)=mean(newZ(:,n));
en_sigma(1,n)=std(newZ(:,n));
en_rms(1,n)=rms(newZ(:,n))

[negpks,neglocs,W,P] = findpeaks(-newZ(:,n));
valleys=-negpks;
hold on;
stem(neglocs,valleys);

%absolute dc value
absdc(:,n)=abs(newZ(:,n));
figure(99);
subplot(1,3,n);
plot(absdc(:,n));
en_absdc(1,n)=mean(absdc(:,n));


figure(16);
subplot(1,3,n)
plot(-newZ(:,n));
hold on;
stem(neglocs,negpks);

%power of ensemble pulse
E1=fft(newZ(:,n));
Enrgy=E1.*conj(E1);
totenergy=sum(Enrgy);
en_energy(1,n)=totenergy;

%non periodic components
reptensemble=repmat(Z,size(aligned,2),1);
nonperiod=aligned'-reptensemble;
non= (nonperiod)';  % finding the number of realizations (columns)

 name5={'Non-periodic Realizations-Vata','Non-periodic Realizations-Pita','Non-periodic Realizations-Kapha'};
figure(19);
subplot(1,3,n);
plot(non);      %plot smoothed function
%hold on;
%title('All non-periodic Realizations'); 
title(name5(n));
sum(mean(non));


%features of non periodic components
maxpks(1,n)=max(pks);
en_mean(1,n)=mean(newZ(:,n));
en_sigma(1,n)=std(newZ(:,n));
en_rms(1,n)=rms(newZ(:,n))

absdc(:,n)=abs(newZ(:,n));
en_absdc(1,n)=mean(absdc(:,n));
[Pxx,W] = pwelch(newZ(:,n),10,2,10);
 en_pwr(1,n)=Pxx(1)/Pxx(2);

%Extracting features
%DR= diff(aligned);
deri=diff(newZ);
%deri = smooth(DR,5);
J=size(newZ) ;

 upcross= find(deri(1:J(1)-2)<=0&deri(2:J(1)-1)>0);
 downcross= find(deri(1:J(1)-2)>=0&deri(2:J(1)-1)<0);
 
 H=zeros(length(upcross),2); % T and Z values for upcrossing  
     for j=1:length(upcross)
         H(j,1)=t1(upcross(j));
           H(j,2)=newZ(upcross(j));   
          
     end

 G=zeros(length(downcross),2);  % T and Z values for downcrossing  
 
     for j=1:length(downcross)
         G(j,1)=t1(downcross(j));
           G(j,2)=newZ(downcross(j)); 
           
     end 
 name6={'PSD values-Vata','PSD values-Pita','PSD values-Kapha'};
   %psd component ratio
   [Pxx,W] = pwelch(newZ(:,n),10,2,10);
   en_pwr(1,n)=Pxx(1)/Pxx(2);
    figure(22);
    subplot(1,3,n);
    stem(W,Pxx);
    title(name6(n));
    xlabel('Frequency');
    ylabel('PSD ');
    hold on;   
    
     figure(21);
subplot(1,3,n);
stem(spectrum(newZ(:,n)));




end
    Qloc=zeros(length(downcross)+length(downcross),2);
    Feature_matrix=[H;G] %feature matrix







