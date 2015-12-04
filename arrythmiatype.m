function [type] = arrythmiatype(EKG,fs, widths)

k=0;
for i=1:length(widths)
    if widths(i)/fs > 0.08
        k=k+1;
    end
end

if k == 0
    disp('EKG3')
end

if k>0
      EKG = -EKG;
    minpeakheight1 = max(findpeaks(EKG))-0.75*max(findpeaks(EKG));
  [~,negpeaks] = findpeaks(EKG,'MinPeakHeight',minpeakheight1,...
    'MinPeakDistance',150);
    if mean(negpeaks) > 100000;
    fprintf('%d arrythmias of type 2 found \n',k)
    figure (24)
hold on
plot(EKG);
plot(negpeaks,EKG(negpeaks),'rv','MarkerFaceColor','r');
    else 
           disp('no number two, but wide')
    end
end

