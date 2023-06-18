for i=-10:10
    n=i+11;
    if(mod(n,2) == 0) h(n) = 2/pi/i;
       else h(n) = 0;
    end
end
i=-10:10;
w=-2*pi:0.01:2*pi;
H=-j*(w<pi|w>=2*pi)+j*(w>=pi&w<2*pi);   % 计算离散希尔伯特变换器的频率响应
subplot(2,1,1);stem(i,h,'linewidth',1.3);
title('理想希尔伯特数字滤波器的h(n)');axis([-10,10,-0.8,0.8]);
subplot(2,1,2);plot(w,H/j,'linewidth',1.3);
title('理想希尔伯特数字滤波器的H(w)的幅值');axis([0,2*pi,-1.2,1.2]);