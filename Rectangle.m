function [  ] = Rectangle( pic, ltX, ltY, rbX, rbY, color)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% �ú������ڻ�������
% pic   : ָ���������ε�ͼ
% ltX   : ���ϽǺ�����
% ltY   : ���Ͻ�������
% rbX   : ���½Ǻ�����
% rbY   : ���½�������

% ѡ��ͼƬ
axes(pic);
% ����
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

