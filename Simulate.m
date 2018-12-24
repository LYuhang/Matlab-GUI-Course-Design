function [ weight_array, delta_weight_array, heat_array] = Simulate( W0, T, A1, A2, B1, B2, J, J0, Period)
% Simulate函数用于输入参数后仿真出在0~Period时间段内的
% 体重曲线，返回值为长度为Period的一维向量。
%   W0 : 初始体重
%   T  : 每周运动时间
%   A1 : 吸收热量与增加体重的关系
%   A2 : 消耗热量与减少体重的关系
%   B1 : 1kg体重每周正常代谢热量kcal
%   B2 : 1kg体重每小时跑步消耗热量kcal
%   J  : 每周吸收热量减少量
%   J0 : 第一周吸收的热量
%   Period : 仿真的时间段
weight_array = zeros(1, Period);   % 用于记录体重随时间变化
delta_weight_array = zeros(1, Period); % 用于记录体重减少量
heat_array = zeros(1, Period);  % 用于记录吸收热量
weight_array(1) = W0;

for K = 1:Period
    % 第K+1周吸收的热量
    if K <= (J0-10000) / J
        J_K_plus_1 = J0 - J * (K-1);
    else
        J_K_plus_1 = 10000;
    end
    heat_array(K) = J_K_plus_1;
    % 正常代谢产生热量
    J1_K_plus_1 = weight_array(K) * B1;
    % 运动代谢产生热量
    J2_K_plus_1 = weight_array(K) * T * B2;
    % 代谢产生总热量
    J_gen_K_plus_1 = J1_K_plus_1 + J2_K_plus_1;
    % 如果吸收热量大于代谢热量，那么增重
    if J_K_plus_1 >= J_gen_K_plus_1
        delta_W = (J_K_plus_1 - J_gen_K_plus_1) * A1;
        delta_weight_array(K) = delta_W;
        weight_array(K+1) = weight_array(K) + delta_W;
    % 如果吸收热量小于代谢热量，那么减重
    else
        delta_W = (J_gen_K_plus_1 - J_K_plus_1) * A2;
        delta_weight_array(K) = -delta_W;
        weight_array(K+1) = weight_array(K) - delta_W;
    end
end

