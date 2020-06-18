function info_matrix= pixel_calculate( inputimage )
%PIXEL_calculate 此处显示有关此函数的摘要
%   此处显示详细说明:info_pixel=(1/n)*∑|C_p-C_i|(像素信息)
%% 加一圈0
m=size(inputimage,1);
n=size(inputimage,2);
for i=m:1
    inputimage(i+1,:)=inputimage(i,:);
    for j=n:1
        inputimage(i,j+1)=inputimage(:,j);
    end
end
inputimage(1,:)=0;
inputimage(m+2,:)=0;
inputimage(:,1)=0;
inputimage(:,n+2)=0;
%% 计算
m=size(inputimage,1);
n=size(inputimage,2);
K=2000;
info_matrix=zeros(K,K);
for i=2:m-1
    for j=2:n-1
        p1=abs(inputimage(i,j)-inputimage(i-1,j-1));
        p2=abs(inputimage(i,j)-inputimage(i-1,j));
        p3=abs(inputimage(i,j)-inputimage(i-1,j+1));
        p4=abs(inputimage(i,j)-inputimage(i,j-1));
        p5=abs(inputimage(i,j)-inputimage(i,j+1));
        p6=abs(inputimage(i,j)-inputimage(i+1,j-1));
        p7=abs(inputimage(i,j)-inputimage(i+1,j));
        p8=abs(inputimage(i,j)-inputimage(i+1,j+1));
        info_matrix(i,j)=(p1+p2+p3+p4+p5+p6+p7+p8)/8;
    end
end

