function [ EKGnice ] = makenice( EKG, fs )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
f = 0.5/fs;
[b,a]=butter(4,f, 'high');

figure(1)
plot(EKG)

filtered = filtfilt(b,a,EKG);

figure(2)
plot(filtered)

[d,c]=butter(4,0.2,'low');

EKGnice = filtfilt(d,c,filtered);

figure(3)
plot(EKGnice)

end

