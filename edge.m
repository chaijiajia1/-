function[similarity]=edge(A,B);
% 输入：
% A为图片库中图片
% B为目标图片
% 
% 输出：两图片相似度
% 
% 功能：先得到图片轮廓，再将图片分成25个区域，得到每个区域轮廓的白色像素多少
% ，并比较得A，B的差异值，最后25块取平均，并用1减去差异值得到相似值，范围在（0，1）；
A=bwperim(A);
B=bwperim(B);
segment=[1,50,100,150,200,256];

cntA=double(zeros(5,5));cntB=double(zeros(5,5));segsimi=double(zeros(5,5));
for cubea=1:5
    for cubeb=1:5
        for i=segment(cubea):segment(cubea+1)
            for j=segment(cubeb):segment(cubeb+1)
                if A(i,j)==1
                    cntA(cubea,cubeb)=cntA(cubea,cubeb)+1;
                end
                if B(i,j)==1
                    cntB(cubea,cubeb)=cntB(cubea,cubeb)+1;
                end
            end
        end
        segsimi(cubea,cubeb)=abs(double((cntA(cubea,cubeb)-cntB(cubea,cubeb)))/double((cntA(cubea,cubeb)+cntB(cubea,cubeb)+1)));
    end
end

similarity=1-(sum(segsimi(:)))/25;


