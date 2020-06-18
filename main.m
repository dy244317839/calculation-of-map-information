%%核心公式来源：栅格地图栅格地图信息量计算方法的验证分析
%%info_pixel=(1/n)*∑|C_p-C_i|(像素信息)     info_map=∑info_pixel（总信息）
clc
clear
%% 将必要信息加载到环境路径中 add path in
p = fileparts(mfilename('fullpath'));
addpath(fullfile(p,'Algorithms'));
addpath(fullfile(p,'Images'));

%% 待计算信息的种类
info_type='grid';%栅格信息

%% 加载图像
image = double(imread('allgrd.tif'));  
%% 主函数
if strcmp(info_type,'grid')
   out=pixel_calculate( image );%
   info_map=sum(sum(out));
    figure;%结果显示
    subplot(1,1,1);imagesc(uint8(image));title(sprintf('此栅格地图信息含量为%.1f%', info_map))
else
    figure;
    subplot(1,1,1);imagesc(uint8(image));title(sprintf('算不出'));
end

