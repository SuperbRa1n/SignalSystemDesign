function out = base(omega, k)
% @brief 用于构造基底e^{-jwk}
% @param omega-频率w，k-基向量下标
out = exp(-1i*omega*k);
end

