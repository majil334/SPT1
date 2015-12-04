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

k=0;
for i=1:length(widths)
    
    if widths(i)/fs > 0.08
        k=k+1;
    end
    
end

if k == 0
    disp('no number two')
end

if k>0
    fprintf('%d arrythmias of type 2 found \n',k)
end

end
