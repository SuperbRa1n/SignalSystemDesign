clf;n=60;                 %滤波器阶数
f=[0.05 0.95];m=[1 1];    %理想滤波器的幅频特性
b=remez(n,f,m,'h');       %采用remez设计Hilbert变换器
[h,w]=freqz(b,1,512);             %计算滤波器的脉冲响应
t=0:1/100:3;x=sin(2*pi*(-10)*t);     %时间序列和输入信号
figure(1)
subplot(2,1,1),plot(t(1:100),x(1:100))
title('输入信号')
y=filter(b,1,x);                   %运用remez设计的Hilbert变换器进行滤波
subplot(2,1,2),
plot(t([1:100]+ 20/2),2*y([1:100]+ 20/2),'r-')
%绘制与输入信号对应的输出信号,考虑了延迟效应
xlabel('时间/s')
title('输出信号')
