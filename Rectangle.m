function [  ] = Rectangle( pic, ltX, ltY, rbX, rbY, color)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
% 该函数用于画长方形
% pic   : 指定画长方形的图
% ltX   : 左上角横坐标
% ltY   : 左上角纵坐标
% rbX   : 右下角横坐标
% rbY   : 右下角纵坐标

% 选中图片
axes(pic);
% 画线
% top
x = ltX:0.01:rbX;
y = linspace(ltY, ltY, length(x));
plot(x, y, color);
hold on;
% down
x = ltX:0.01:rbX;
y = linspace(rbY, rbY, length(x));
plot(x, y, color);
hold on;
% left
y = rbY:0.01:ltY;
x = linspace(ltX, ltX, length(y));
plot(x, y, color);
hold on;
% right
y = rbY:0.01:ltY;
x = linspace(rbX, rbX, length(y));
plot(x, y, color);
end

