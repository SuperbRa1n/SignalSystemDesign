clear all;clc;close all;
n0=31;
N=2*n0+1;
T=0.01;
t=0:T:100;       %采样
hn=zeros(1,N);
%向右平移解决非因果问题
for i=1:N
    if i==n0+1
        hn(i)=0;
    else
        if mod(i-(n0+1),2)==1
            hn(i)=2/(pi*(i-1-n0));
        end
    end
end
hn=hn.*hamming(length(hn))';
figure(1);
subplot(3,1,1);
stem(hn);title('h[n]');
Np=1001;
hn=[hn,zeros(1, Np-length(hn))];
[w1,y1] = calculateDiscreteFourierTransform(hn)
subplot(3,1,2);
plot(w1,abs(y1));
title('幅度');
subplot(3,1,3);
plot(w1,angle(y1));
title('相位');
hold on;