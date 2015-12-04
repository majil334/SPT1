function [times, loc_arr] = checkarrythmia(EKG,fs)
minpeakheight = max(findpeaks(EKG))-0.8*max(findpeaks(EKG));

[~,Rwave,widths] = findpeaks(EKG,'MinPeakHeight',minpeakheight,...
    'MinPeakDistance',150);

A = diff(Rwave);

Rmean = mean(A);
arrythmias = 0;
loc_arr = [];%zeros(length(Rwave),1);
times=ones(2,[]);
j=1;
for n=1:(length(Rwave)- 1)
    if Rwave(n + 1)- Rwave(n) > Rmean + Rmean*0.15 ||...
            Rwave(n + 1)- Rwave(n) < Rmean - Rmean*0.15;
        %display "arrythmia"
        times(1,j)=j;
        times(2,j)=Rwave(n)/fs;
        arrythmias = arrythmias +1;
        loc_arr(j) = Rwave(n);
        loc_arr(j+1) = Rwave(n+1);
        j=j+1;
    end
end
arrythmias

figure (25)
hold on
plot(EKG);
plot(Rwave,EKG(Rwave),'rv','MarkerFaceColor','r');


if arrythmias == 0
   disp('no arrythmias')
   
else
    arrythmiatype(EKG,fs, widths)
end



end
