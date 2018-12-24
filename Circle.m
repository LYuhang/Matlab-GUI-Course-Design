function [ ] = Circle( pic, pointX, pointY, rou, color)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
% 该函数用于画圆
% handles : GUI句柄
% axes    : 在该图上画圆
% pointX  : 圆心坐标X
% pointY  : 圆心坐标Y
% rou     : 圆的半径

% 选中该图
axes(pic);
% 得到x和y向量
x = 0:0.001:2*pi;
y = rou * sin(x) + pointX;
z = rou * cos(x) + pointY;
plot(y, z, color);
end

