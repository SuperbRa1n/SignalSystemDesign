clear all; clc; close all;
n=-5000:20:5000;            % 样点设置
N=length(n);                % 信号样点数
nt=0:N-1;                   % 设置样点序列号
x=cos(0.02*pi*n) .* cos(100*pi*n + 0.01*n); % 设置信号
[up,down] = envelope(x,N,'analytic');
% 作图
plot(nt,x,'k',nt,2*up-1,'r');
xlabel('样点'); ylabel('幅值'); grid;
title('测试函数④求取包络曲线图')
set(gcf,'color','w');
