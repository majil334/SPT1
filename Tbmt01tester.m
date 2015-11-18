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
med=mean(EKG2);


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
 minpeakheight = max(findpeaks(EKGnice))-150;



[~,locs_Rwave] = findpeaks(EKGnice,'MinPeakHeight',minpeakheight,...
                                    'MinPeakDistance',80);

% size(pks)
figure(2)
plot(locs_Rwave)
size(locs_Rwave)

%%

figure
hold on
plot(EKGnice);
plot(locs_Rwave,EKGnice(locs_Rwave),'rv','MarkerFaceColor','r');
xlabel('Samples')
title('R-wave and S-wave in Noisy ECG Signal')

 
