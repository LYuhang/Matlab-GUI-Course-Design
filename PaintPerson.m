function [ ] = PaintPerson(pic, now, weight_array, color)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
% 计算出放大的倍数
cla;
times = sqrt(weight_array(now) / 70);
Circle(pic, 0.8, 2, 0.2, color);   % 脑袋
hold on;
Rectangle(pic, 0.8-0.4*times, 1.8, 0.8 + 0.4*times, 0.8, color);  % 身体
hold on;
Rectangle(pic, 0.5, 0.8, 0.5+0.1*times, 0.1, color);  % 左腿
hold on;
Rectangle(pic, 1.1-0.1*times, 0.8, 1.1, 0.1, color);  % 右腿
set(pic, 'XLim', [0 1.6], 'YLim', [0 2.4]);
end

