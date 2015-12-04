
EKG5=EKG5(

EKG = EKG5;
fs = 250;
 
EKGnice = makenice(EKG, fs);

time = length(EKG)/fs

figure(1)
plot(EKGnice)
 

%%

[time,loc_arr]=checkarrythmia(EKGnice,fs);

[~,widepeaks]=findpeaks(EKGnice,...%'MinPeakHeight',minpeakheight,...
    'MinPeakDistance',150,...
'MinPeakWidth',30);

figure (23)
hold on
plot(EKGnice);
plot(widepeaks,EKGnice(widepeaks),'rv','MarkerFaceColor','r');
