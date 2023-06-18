clear all; clc; close all;
N=256;                          % 窗长度             
x=boxcar(N);                   % 设置矩形窗
y=hanning(N);
z=hamming(N);
u=kaiser(N);
v=triang(N);
w=blackman(N);
%时域波形图
figure(1);
subplot(6,1,1);
plot(boxcar(N));xlim([-2*N 3*N]);hold on;title('矩形窗');
subplot(6,1,2);
plot(hanning(N));xlim([-2*N 3*N]);hold on;title('汉宁窗');
subplot(6,1,3);
plot(hamming(N));xlim([-2*N 3*N]);hold on;title('汉明窗');
subplot(6,1,4);
plot(kaiser(N));xlim([-2*N 3*N]);hold on;title('凯泽窗');
subplot(6,1,5);
plot(triang(N));xlim([-2*N 3*N]);hold on;title('三角形窗');
subplot(6,1,6);
plot(blackman(N));xlim([-2*N 3*N]);hold on;title('布莱克曼窗');
%补零前FFT谱图
figure(2);
freq1=(-N/2:N/2-1)/N;
X1=fft(x);X1_abs=abs(fftshift(X1));
Y1=fft(y);Y1_abs=abs(fftshift(Y1));
Z1=fft(z);Z1_abs=abs(fftshift(Z1));
U1=fft(u);U1_abs=abs(fftshift(U1));
V1=fft(v);V1_abs=abs(fftshift(V1));
W1=fft(w);W1_abs=abs(fftshift(W1));
subplot(6,1,1);
plot(freq1,X1_abs);xlim([-0.1 0.1]);hold on;ylabel('相位');title('矩形窗');
subplot(6,1,2);
plot(freq1,Y1_abs);xlim([-0.1 0.1]);hold on;ylabel('相位');title('汉宁窗');
subplot(6,1,3);
plot(freq1,Z1_abs);xlim([-0.1 0.1]);hold on;ylabel('相位');title('汉明窗');
subplot(6,1,4);
plot(freq1,U1_abs);xlim([-0.1 0.1]);hold on;ylabel('相位');title('凯泽窗');
subplot(6,1,5);
plot(freq1,V1_abs);xlim([-0.1 0.1]);hold on;ylabel('相位');title('三角形窗');
subplot(6,1,6);
plot(freq1,W1_abs);xlim([-0.1 0.1]);hold on;ylabel('相位');title('布莱克曼窗');
xlabel('归一化频率');
%补零后FFT谱图
figure(3);
freq2=(-N*4:N*4-1)/(N*8);
X2=fft(x,N*8);X2_abs=abs(fftshift(X2));
Y2=fft(y,N*8);Y2_abs=abs(fftshift(Y2));
Z2=fft(z,N*8);Z2_abs=abs(fftshift(Z2));
U2=fft(u,N*8);U2_abs=abs(fftshift(U2));
V2=fft(v,N*8);V2_abs=abs(fftshift(V2));
W2=fft(w,N*8);W2_abs=abs(fftshift(W2));
subplot(6,1,1);
plot(freq2,X2_abs);xlim([-0.1 0.1]);hold on;ylabel('相位');title('矩形窗');
subplot(6,1,2);
plot(freq2,Y2_abs);xlim([-0.1 0.1]);hold on;ylabel('相位');title('汉宁窗');
subplot(6,1,3);
plot(freq2,Z2_abs);xlim([-0.1 0.1]);hold on;ylabel('相位');title('汉明窗');
subplot(6,1,4);
plot(freq2,U2_abs);xlim([-0.1 0.1]);hold on;ylabel('相位');title('凯泽窗');
subplot(6,1,5);
plot(freq2,V2_abs);xlim([-0.1 0.1]);hold on;ylabel('相位');title('三角形窗');
subplot(6,1,6);
plot(freq2,W2_abs);xlim([-0.1 0.1]);hold on;ylabel('相位');title('布莱克曼窗');
xlabel('归一化频率');
%补零后FFT谱图-分贝值
figure(4);
X2_dB=20*log10(X2_abs/(max(X2_abs))+eps);
Y2_dB=20*log10(Y2_abs/(max(Y2_abs))+eps);
Z2_dB=20*log10(Z2_abs/(max(Z2_abs))+eps);
U2_dB=20*log10(U2_abs/(max(U2_abs))+eps);
V2_dB=20*log10(V2_abs/(max(V2_abs))+eps);
W2_dB=20*log10(W2_abs/(max(W2_abs))+eps);
t = tiledlayout(2,3);
nexttile
plot(freq2,X2_dB);title('矩形窗');axis([0 0.1 -120 5]);ylabel('幅值/dB');
nexttile
plot(freq2,Y2_dB);title('汉宁窗');axis([0 0.1 -120 5]);ylabel('幅值/dB');
nexttile
plot(freq2,Z2_dB);title('汉明窗');axis([0 0.1 -120 5]);ylabel('幅值/dB');
nexttile
plot(freq2,U2_dB);title('凯泽窗');axis([0 0.1 -120 5]);ylabel('幅值/dB');
nexttile
plot(freq2,V2_dB);title('三角形窗');axis([0 0.1 -120 5]);ylabel('幅值/dB');
nexttile
plot(freq2,W2_dB);title('布莱克曼窗');axis([0 0.1 -120 5]);ylabel('幅值/dB');
xlabel(t,'归一化频率')
