clc;clear;

fs = 1024; % 采样频率
N = 251; % 滤波器阶数
Ts = 1/fs; % 采样周期
t = 0:Ts:1; % 时间序列

x = t.* cos(10*pi*t+0.01*t); % 连续时间信号

% 采样
xn = x;
w = -fs/2:fs/2;
Xw = fft(xn);
% FIR滤波器构造
Hw = -1i * sign(w);
E = ones(fs,N);
for i = 1:fs+1
    for j = 1:N
        E(i,j) = base(w(i)/(2*pi*(fs+1)),(j-1));
    end
end
EH = E'*E;
b = E'*Hw.';
A = EH\b;
Hp = E*A;

% 绘图
figure(1);
subplot(2,1,1);
plot(w,abs(Hp));
title('FIR滤波器幅度特性');
subplot(2,1,2);
plot(w,angle(Hp));
title('FIR滤波器相位特性');

Yw = Xw.*Hw;
Yp = Xw.*Hp.';
yw = real(ifft(Yw));
yp = real(ifft(Yp));

figure(2);
subplot(2,1,1);
plot(t,sqrt(yp.^2+x.^2));
title("测试函数②的幅度");
subplot(2,1,2);
plot(t,atan(yp./x));
title("测试函数②的相位");





