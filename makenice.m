function [ EKGnice ] = makenice( EKG, fs )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
f = 0.5/fs;
[b,a]=butter(4,f, 'high');
% 



filtered = filtfilt(b,a,EKG);

% figure(2)
% plot(filtered)


[d,c]=butter(4,0.2,'low');

EKGnice = filtfilt(d,c,filtered);

figure(1)
subplot(2,1,1)
plot(EKG)
title ('raw EKG')
subplot(2,1,2)
plot(EKGnice)
title ('filtered EKG')
% figure(3)
% plot(EKGnice)
% title ('EKG nice')

end

