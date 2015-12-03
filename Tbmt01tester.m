
EKG = EKG3;
fs = 360;
 
EKGnice = makenice(EKG, fs);

time = length(EKG)/fs

figure(1)
plot(EKGnice)
 
%%
minpeakheight = max(findpeaks(EKGnice))-0.8*max(findpeaks(EKGnice));


[~,Rwave] = findpeaks(EKGnice,'MinPeakHeight',minpeakheight,...
    'MinPeakDistance',150);

% size(pks)
size(Rwave)
beatspermin = length(Rwave)/time*60


%%


figure (5)
hold on
plot(EKGnice);
plot(Rwave,EKGnice(Rwave),'rv','MarkerFaceColor','r');



%%

A = diff(Rwave);

Rmean = mean(A);
%% 
arrythmias = 0;
loc_arr = zeros(length(Rwave),1);
for n=1:(length(Rwave)- 1)
    if Rwave(n + 1)- Rwave(n) > Rmean + Rmean*0.15;
        %display "arrythmia"
        arrythmias = arrythmias +1;
        loc_arr(n) = Rwave(n);
        loc_arr(n+1) = Rwave(n+1);
    end
     if Rwave(n + 1)- Rwave(n) < Rmean - Rmean*0.15;
  %display "arrythmia"
         arrythmias = arrythmias +1;
                 loc_arr(n) = Rwave(n);
        loc_arr(n+1) = Rwave(n+1);
     end
end

figure (6)
hold on
plot(EKGnice);
plot(loc_arr,EKGnice(Rwave),'rv','MarkerFaceColor','r');
%plot(loc_arr,EKGnice(loc_arr),'Marker','+','MarkerFaceColor','b');

            arrythmias
            
%%

m=mean(EKGnice(6*floor(beatspermin*time/fs):7*floor(beatspermin*time/fs))); %-0.07*Rmean;
mvec = m*ones(length(EKGnice),1);

figure(8)
hold on
plot(EKGnice(6*floor(beatspermin*time/fs):7*floor(beatspermin*time/fs)),'b')
%plot(mvec,'r')

%%
N=127;%beatspermin*time/60;
M=ceil(length(EKGnice)/N);
beat=reshape(EKGnice,[N,M]);

stem3(beat)