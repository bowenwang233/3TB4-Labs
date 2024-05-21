[x, fs] = audioread('C:\Users\bowen\OneDrive\Documents\School\Winter 2024\3TB4\Lab\Lab3\Tut3\L01_Group16.wav');
L=length(x);
NFFT=2^nextpow2(L);
X=fft(x,NFFT)/fs;
fs
f=fs/2*linspace(0,1,NFFT/2+1);
plot(f,2*abs(X(1:NFFT/2+1)));
fkill=2000/(fs/2);
coeff=firgr(70,[0,fkill-0.1, fkill, fkill+0.1, 1], [1,1,0,1,1],{'n','n','s','n','n'});
freqz(coeff,1);
%coeff*32768
fid=fopen('C:\Users\bowen\OneDrive\Documents\School\Winter 2024\3TB4\Lab\Lab3\Tut3\output.txt','w');
for i=1:length(coeff)
fprintf(fid,'coeff[%3.0f]=%10.0f;\n',i-1,32768*coeff(i));
end
fclose(fid);
y=filtfilt(coeff,1,x);
Y=fft(y,NFFT)/L;
sound(3*x,fs);
pause(5);
sound(3*y,fs);
subplot(2,1,1);
plot(f,2*abs(X(1:NFFT/2+1)));
xlabel('frequency (Hz)');
ylabel('|X(f)|');
subplot(2,1,2);
plot(f, 2*abs(Y(1:NFFT/2+1)));
xlabel('frequency(Hz)');
audiowrite('C:\Users\bowen\OneDrive\Documents\School\Winter 2024\3TB4\Lab\Lab3\Tut3\L01_Group16_filtered.wav',y,fs);