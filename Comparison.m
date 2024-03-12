function[indexk,indexm,indexn] = Comparison(image, target)
% 输入：
% image：图片库中所有图片
% target：目标图片
% 
% 输出：
% indexk：1*20的数组，储存前20相似度的图片在image中的k坐标位置
% indexm：1*20的数组，储存前20相似度的图片在image中的m坐标位置
% indexn：1*20的数组，储存前20相似度的图片在image中的n坐标位置
% 
% 功能：作为中间连接，连接主函数和比较的函数。接收主函数的所有图片数据，并运用相似度计算的函数两两比较得到相似度，
% 比较相似度得到相似度前20的图片坐标并返回给主函数

Similarity=zeros(34,8,57);
for k = 1:32
    for m=1:6
        for n=1:55
            Similarity(k,m,n) = histogram(image(:,:,k,m,n), target)*0.3+edge(image(:,:,k,m,n), target)*0.4+differ(image(:,:,k,m,n), target)*0.15+pixeldoublication(image(:,:,k,m,n),target)*0.15;
            
        end
    end
end

indexk=zeros(1,20);
indexm=zeros(1,20);
indexn=zeros(1,20);
%在三维矩阵中找出最大值
for cnt=1:20
    m=max(Similarity(:));
    index0=find(Similarity==m);
    [indexk(cnt),indexm(cnt),indexn(cnt)]=ind2sub(size(Similarity),index0(1));
    Similarity(indexk(cnt),indexm(cnt),indexn(cnt))=0;
end
