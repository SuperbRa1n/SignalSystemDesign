clf;n=60;                 %滤波器阶数
f=[0.05 0.95];m=[1 1];    %理想滤波器的幅频特性
b=remez(n,f,m,'h');       %采用remez设计Hilbert变换器
t=0:0.01:100;
x=cos(2*pi*0.01*t).*cos(2*pi*10*t);      %输入信号
Ad=abs(cos(2*pi*0.01*t));
y=filter(b,1,x);                         %希尔伯特变换
A=(abs(x).^2+abs(y).^2).^0.5;            %计算幅度
p=atan2(y,x);                            %计算相位
pd=atan2(sin(2*pi*10*t),cos(2*pi*10*t)); %理论相位
q=x+1j*y;                                %解析信号
f=zeros(1,length(q));                    %计算频率
temp=diff(q);
for n=1:length(f)-1
    f(n)=imag(100*temp(n)/q(n))/2/pi;
end
f(end)=imag(100*temp(n)/q(n))/2/pi;
for n=1:length(f)
    fd(n)=10+0.01/2/pi;                  %理论频率
end
figure(1)
subplot(2,1,1);
plot(t,y,'linewidth',1);axis([0,100,-1,1]);hold on;
subplot(2,1,2);
plot(t,x,'b','linewidth',1);xlabel('时间');title('输入输出信号');axis([0,100,-1,1]);
figure(2)
subplot(3,1,1);
plot(t,A);title('包络幅度');axis([0,100,0,1.3]);hold on;
plot(t,Ad,'b','linewidth',2);axis([0,100,0,1.3]);
subplot(3,1,2);
plot(t,p);title('相位');axis([0,2,-3.15,3.15]);hold on;
plot(t,pd,'b','linewidth',2);axis([0,2,-3.15,3.15]);
subplot(3,1,3);
plot(t,f);title('瞬时频率');axis([0,100,-10,30]);hold on;
plot(t,fd,'b','linewidth',2);axis([0,100,-10,30]); 