 
Toppar = 0;
 
 for k=2:length(EKGnice)-1
     if (EKGnice(k) > EKGnice(k-1) & EKGnice(k) > EKGnice(k+1) & EKGnice(k) > 80)
         k;
                  display('R-toppar')
         Toppar = 1 + Toppar;
     end
 end
 
 Toppar
 % plot(EKGnice,'ro')
 N = length(EKGnice)
 tid_sekunder = N/fs;
 tid_minuter = tid_sekunder/60;
 BPM = Toppar/tid_minuter