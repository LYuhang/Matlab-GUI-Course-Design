function [ ] = PaintPerson(pic, now, weight_array, color)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% ������Ŵ�ı���
cla;
times = sqrt(weight_array(now) / 70);
Circle(pic, 0.8, 2, 0.2, color);   % �Դ�
hold on;
Rectangle(pic, 0.8-0.4*times, 1.8, 0.8 + 0.4*times, 0.8, color);  % ����
hold on;
Rectangle(pic, 0.5, 0.8, 0.5+0.1*times, 0.1, color);  % ����
hold on;
Rectangle(pic, 1.1-0.1*times, 0.8, 1.1, 0.1, color);  % ����
set(pic, 'XLim', [0 1.6], 'YLim', [0 2.4]);
end

