function [ output ] = CanSimulation( handles )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% �ú������ڼ���Ƿ����еĲ����������������������������������true������
% ����false
if handles.W0 == false
    output = false;
elseif handles.J0 == false
    output = false;
elseif handles.T == false
    output = false;
elseif handles.J == false
    output = false;
else
    output = true;
end

