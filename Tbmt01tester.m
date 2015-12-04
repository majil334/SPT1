
EKG2=EKG2(1:5000);

EKG = EKG2;
fs = 360;
 
EKGnice = makenice(EKG, fs);

time = length(EKG)/fs;

 

%%

[time,loc_arr]=checkarrythmia(EKGnice,fs);

%disp(time')
%%

[~,widepeaks]=findpeaks(EKGnice,...%'MinPeakHeight',minpeakheight,...
    'MinPeakDistance',150,...
'MinPeakWidth',30);


figure (23)
hold on
plot(EKGnice);
plot(loc_arr,EKGnice(loc_arr),'rv','MarkerFaceColor','r');
