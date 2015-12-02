f=0.5/360;

[b,a]=butter(4,f, 'high');

fvtool(b,a)

fftad = fft(EKG3);

figure(1)
plot(EKG2)

filtered = filtfilt(b,a,EKG3);

figure(2)
plot(abs(filtered))

% timeagain = ifft(filtered,'symmetric');
% 
% figure(3)
% plot(timeagain)

[d,c]=butter(4,0.2,'low');

lp = filtfilt(d,c,filtered);

figure(3)
plot(lp)




%%
med=mean(EKG1);


 for  i = 1 : 1 : length(EKG2) 
     if  i == 1 
         m(i)=EKG2(i+1)-EKG2(i); 
     end
     if  i > 1 
         m(i)= EKG2(i)-EKG2(i-1); 
     end
 end
 m=smooth(smooth(m));
 plot(m);
 
 %%

EKG = EKG3;
fs = 360;
 
EKGnice = makenice(EKG, fs);

time = length(EKG)/fs

figure(1)
plot(EKGnice)
 
%%
minpeakheight = max(findpeaks(EKGnice))-0.8*max(findpeaks(EKGnice));


[~,locs_Rwave] = findpeaks(EKGnice,'MinPeakHeight',minpeakheight,...
    'MinPeakDistance',150);

% size(pks)
figure(2)
% plot(locs_Rwave)
size(locs_Rwave)
beatspermin = length(locs_Rwave)/time*60


%%


figure (5)
hold on
plot(EKGnice);
plot(locs_Rwave,EKGnice(locs_Rwave),'rv','MarkerFaceColor','r');



%%
A = [];

for n=1:(length(locs_Rwave)- 1)
    A(n) = locs_Rwave(n + 1)- locs_Rwave(n) ;
end
Rmean = mean(A);
%% 
arrythmias = 0;

for n=1:(length(locs_Rwave)- 1)
    if locs_Rwave(n + 1)- locs_Rwave(n) > Rmean + Rmean*0.2;
        %display "arrythmia"
        arrythmias = arrythmias +1;
    end
     if locs_Rwave(n + 1)- locs_Rwave(n) < Rmean - Rmean*0.2;
  %display "arrythmia"
         arrythmias = arrythmias +1;
     end
end

            arrythmias

