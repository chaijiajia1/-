function[similarity]=histogram(A,B)
% 输入：
% A为图片库中图片
% B为目标图片
% 
% 输出：两图片相似度
% 
% 功能：把图片分为25块，分别得到每个区域中黑色像素的占比，得到两个向量，再计算其余弦相似度，范围在（0，1）；
cntA=double(zeros(5,5));cntB=double(zeros(5,5));
segment=[1,50,100,150,200,256];
for cubea=1:5
    for cubeb=1:5
        for i=segment(cubea):segment(cubea+1)
            for j=segment(cubeb):segment(cubeb+1)
                if A(i,j)==255
                    cntA(cubea,cubeb)=cntA(cubea,cubeb)+1;
                end
                if B(i,j)==255
                    cntB(cubea,cubeb)=cntB(cubea,cubeb)+1;
                end
            end
        end
    end
end
lengA=0;lengB=0;
for i=1:5
    for j=1:5
        lengA=lengA+cntA(i,j)*cntA(i,j);
      
        lengB=lengB+cntB(i,j)*cntB(i,j);
    end
end

similarity=sum(cntA(:).*cntB(:))/(sqrt(lengA*lengB)+1);
