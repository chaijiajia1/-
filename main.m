clear;close all;clc;

%读入所有图片
dataPath = input('请输入图片库的位置:','s');

[target,image,flag,originalrgb]=READIN(dataPath);

[indexk,indexm,indexn] = Comparison(image,target);

%输出相似度前20的
figure();
for i = 1:20
    subplot(5,4,i)
     if flag(indexk(i),indexm(i),indexn(i))==0
        imshow(image(:,:,indexk(i),indexm(i),indexn(i)));
    else
    
        imshow(originalrgb(:,:,:,indexk(i),indexm(i),indexn(i)));
     end
end




