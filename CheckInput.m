function [ output ] = CheckInput( hObject, tipObject, max, min, wrong_color, right_color, string)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% ���ڼ���ı���ȷ�ԣ���֤Ϊ���ֶ����ں���Χ��
text = get(hObject, 'string');
text = str2double(text);
% ����ı��������
if isnan(text)
    set(hObject, 'backgroundcolor', wrong_color);
    message = sprintf('����%s�����Ϲ淶�����������룡', string);
    set(tipObject, 'string', message);
    output = false;
% �����ֵ��С�������з�Χ
elseif text > max
    set(hObject, 'backgroundcolor', wrong_color);
    message = sprintf('����%s�������������룡���ʵķ�ΧΪ%0.5f��%0.5f֮��', string, min, max);
    set(tipObject, 'string', message);
    output = false;
elseif text < min
    set(hObject, 'backgroundcolor', wrong_color);
    message = sprintf('����%s��С�����������룡���ʵķ�ΧΪ%0.5f��%0.5f֮��', string, min, max);
    set(tipObject, 'string', message);
    output = false;
else
    set(hObject, 'backgroundcolor', right_color)
    set(tipObject, 'string', '')
    output = true;
end

