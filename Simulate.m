function [ weight_array, delta_weight_array, heat_array] = Simulate( W0, T, A1, A2, B1, B2, J, J0, Period)
% Simulate�����������������������0~Periodʱ����ڵ�
% �������ߣ�����ֵΪ����ΪPeriod��һά������
%   W0 : ��ʼ����
%   T  : ÿ���˶�ʱ��
%   A1 : �����������������صĹ�ϵ
%   A2 : ����������������صĹ�ϵ
%   B1 : 1kg����ÿ��������л����kcal
%   B2 : 1kg����ÿСʱ�ܲ���������kcal
%   J  : ÿ����������������
%   J0 : ��һ�����յ�����
%   Period : �����ʱ���
weight_array = zeros(1, Period);   % ���ڼ�¼������ʱ��仯
delta_weight_array = zeros(1, Period); % ���ڼ�¼���ؼ�����
heat_array = zeros(1, Period);  % ���ڼ�¼��������
weight_array(1) = W0;

for K = 1:Period
    % ��K+1�����յ�����
    if K <= (J0-10000) / J
        J_K_plus_1 = J0 - J * (K-1);
    else
        J_K_plus_1 = 10000;
    end
    heat_array(K) = J_K_plus_1;
    % ������л��������
    J1_K_plus_1 = weight_array(K) * B1;
    % �˶���л��������
    J2_K_plus_1 = weight_array(K) * T * B2;
    % ��л����������
    J_gen_K_plus_1 = J1_K_plus_1 + J2_K_plus_1;
    % ��������������ڴ�л��������ô����
    if J_K_plus_1 >= J_gen_K_plus_1
        delta_W = (J_K_plus_1 - J_gen_K_plus_1) * A1;
        delta_weight_array(K) = delta_W;
        weight_array(K+1) = weight_array(K) + delta_W;
    % �����������С�ڴ�л��������ô����
    else
        delta_W = (J_gen_K_plus_1 - J_K_plus_1) * A2;
        delta_weight_array(K) = -delta_W;
        weight_array(K+1) = weight_array(K) - delta_W;
    end
end

