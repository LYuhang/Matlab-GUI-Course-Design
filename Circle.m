function [ ] = Circle( pic, pointX, pointY, rou, color)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% �ú������ڻ�Բ
% handles : GUI���
% axes    : �ڸ�ͼ�ϻ�Բ
% pointX  : Բ������X
% pointY  : Բ������Y
% rou     : Բ�İ뾶

% ѡ�и�ͼ
axes(pic);
% �õ�x��y����
x = 0:0.001:2*pi;
y = rou * sin(x) + pointX;
z = rou * cos(x) + pointY;
plot(y, z, color);
end

