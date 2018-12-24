function [ output ] = CheckInput( hObject, tipObject, max, min, wrong_color, right_color, string)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
% 用于检查文本正确性，保证为数字而且在合理范围内
text = get(hObject, 'string');
text = str2double(text);
% 如果文本输入错误
if isnan(text)
    set(hObject, 'backgroundcolor', wrong_color);
    message = sprintf('输入%s不符合规范，请重新输入！', string);
    set(tipObject, 'string', message);
    output = false;
% 如果数值大小超过可行范围
elseif text > max
    set(hObject, 'backgroundcolor', wrong_color);
    message = sprintf('输入%s过大，请重新输入！合适的范围为%0.5f至%0.5f之间', string, min, max);
    set(tipObject, 'string', message);
    output = false;
elseif text < min
    set(hObject, 'backgroundcolor', wrong_color);
    message = sprintf('输入%s过小，请重新输入！合适的范围为%0.5f至%0.5f之间', string, min, max);
    set(tipObject, 'string', message);
    output = false;
else
    set(hObject, 'backgroundcolor', right_color)
    set(tipObject, 'string', '')
    output = true;
end

