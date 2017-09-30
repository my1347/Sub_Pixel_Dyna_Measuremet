%##################################################
%Copyright Jiantao Liu, email:liujiantao@gmail.com

%##################################################
%length = Length of the signal
function [ output_args ] = ljtfft( tagname,tgprty,avesgl)

%Get vibro source and Video var from workspace
pjname = evalin('base','pjname');
source = evalin('base',[tagname,'_',tgprty,'_',avesgl,'_',pjname]);
% length = evalin('base','VD');
samplerate = evalin('base','VFR');
%Begin
L = length(evalin('base','hf'));
Fs = samplerate;
% L = round(length*samplerate);
% Fs = round(samplerate);

Y = fft(source);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
%Define the frequency domain f and plot the single-sided amplitude spectrum P1. The amplitudes are not exactly at 0.7 and 1, as expected, because of the added noise. On average, longer signals produce better frequency approximations.
f = Fs*(0:(L/2))/L;
plot(f,P1)
title([tagname,'_',tgprty,'_ave_',pjname])%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
% %Disp the max Y coresponding to X location
% [ymax,loc] = max(P1);
% disp(f(loc));
% %Store the value"peak to freq location"
%  assignin('base',['PF',tagname,'_',tgprty,'_',avesgl,'_',pjname],f(loc))
end

