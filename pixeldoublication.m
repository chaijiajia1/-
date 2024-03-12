function[similarity] = pixeldoublication(A,B)
% 输入：
% A为图片库中图片
% B为目标图片
% 
% 输出：两图片相似度
% 
% 功能：通过相同像素在图片中占的比例得到相似度，范围在（0，1）；
cnt = 0.0;

for i = 1:256
    for j = 1:256
        if (A(i,j) == B(i,j))
            cnt = cnt + 1;
        end
    end
end

similarity = double(cnt/256/256);