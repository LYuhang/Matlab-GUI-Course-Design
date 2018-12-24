function [ output ] = CanSimulation( handles )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
% 该函数用于检查是否所有的参数都符合条件，如果都符合条件，返回true，否则
% 返回false
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

