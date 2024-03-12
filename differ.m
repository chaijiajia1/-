function[similarity]=differ(A,B)
% 输入：
% A为图片库中图片
% B为目标图片
% 
% 输出：两图片相似度
% 
% 功能：运用绝对值差得到A，B的差异矩阵，再除以图片大小等参数得到（0，1）的差异值，再用1减去差异值得到相似度，范围在（0，1）
similar=zeros(256,256);

similar=abs(A-B);
similarity=1-sum(similar(:))/256/256/255;
