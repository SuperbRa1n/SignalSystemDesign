clf;n=60;                 %滤波器阶数
f=[0.05 0.95];m=[1 1];    %理想滤波器的幅频特性
fs=2000;                  %采样频率
b=remez(n,f,m,'h');       %采用remez设计Hilbert变换器
[h,w]=freqz(b,1,512,fs);  %计算Hilbert变换器的脉冲响应
figure(1);
plot(w,20*log10(abs(h)));grid; %计算幅频特性
axis([0 1000 -40 10]);         %绘制正半轴频谱
xlabel('频率/Hz');   
ylabel('幅值/dB');
title('Hilbert变换器的幅频特性');
figure(2);
plot(w,angle(h)/pi*180);grid;  %计算相频特性
xlabel('频率/Hz');
ylabel('相角/°');
title('Hilbert变换器的相频特性');