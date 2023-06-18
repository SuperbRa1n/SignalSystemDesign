N=21;
Hd=[-1j*ones(1,10),0,1j*ones(1,10)];
k = 0:N-1;
A = exp(-1j*pi*k*(N-1)/N);
Hd = Hd.*A;%频率采样，得到希尔伯特变换器的频域表示
h1 = real(ifft(Hd));%做傅里叶反变换
T=0.01;
t=0:T:100;
x=cos(2*pi*0.01*t).*cos(2*pi*10*t);
%使用自己搭建的离散希尔伯特变换器进行计算
y=conv(x,h1,'same');
A=(abs(x).^2+abs(y).^2).^0.5;
p=atan2(y,x);%计算相位
q=x+1j*y;
f = zeros(1,length(q));%计算频率
temp = diff(q);
for n=1:length(f)-1
f(n)=imag(100*temp(n)/q(n))/2/pi;
end
f(end)=p(end)/2/pi;
%计算输入信号的理论值
Ad=abs(cos(2*pi*0.01*t));%理论幅度
pd=atan2(sin(2*pi*10*t),cos(2*pi*10*t));%理论相位
for i=1:length(x)
fd(i)=10+0.01/2/pi;%理论频率
end
figure(1);
subplot(2,1,1);
plot(t,y,'linewidth' ,1);xlabel('时间');title('输入输出信号');axis([0,100,-1,1]);hold on;
legend('计算');
subplot(2,1,2);
plot(t,x, 'b' , 'linewidth' ,1);xlabel('时间');title('输入输出信号');axis([0,100,-1,1]);
legend('理论');
figure(2);
subplot(3,1,1);
plot(t,A);title('包络幅度');axis([0,100,0,1.3]);hold on;
plot(t,Ad, 'b' , 'linewidth' ,2);axis([0,100,0,1.3]);
legend('计算','理论');
subplot(3,1,2);
plot(t,p);title('相位');axis([0,2,-3.15,3.15]);hold on;
plot(t,pd, 'b' , 'linewidth' ,2);axis([0,2,-4,4]);
legend('计算','理论');
subplot(3,1,3);
plot(t,f);title('瞬时频率');axis([0,100,-10,30]);hold on;
plot(t,fd, 'b' , 'linewidth' ,2);axis([0,100,-100,100]);
legend('计算','理论');