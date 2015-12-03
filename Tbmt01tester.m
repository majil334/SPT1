
EKG = EKG2;
fs = 250;
 
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
plot(EKGnice,'b')
plot(mvec,'r')


%%
minpeakheight = max(findpeaks(-EKGnice))-0.8*max(findpeaks(-EKGnice));
EKG_inverted = -EKGnice;
Swaves=[];
for i=1:length(Rwave)
[~,Swave] = findpeaks(EKG_inverted(Rwave(i):Rwave(i)+40));%,'MinPeakHeight',minpeakheight,...
                                        %'MinPeakProminence',5);
  Swaves=Swave;                                      %'MinPeakDistance', 100);
end
    

figure(12)
hold on
plot(EKGnice);
plot(Swaves,EKGnice(Swaves),'rv','MarkerFaceColor','r');

%%

EKGdiv = zeros(70,length(Rwave));

for i=1:length(Rwave)
    EKGdiv(:,i) = EKGnice(Rwave(i)-30:Rwave(i)+39);
end

% figure(15)
% plot(EKGdiv(:,:))

EKGinv = -EKGdiv;
for i=1:lenght(EKGinv)
Swave=findpeaks(EKGinv(:,i);
end


