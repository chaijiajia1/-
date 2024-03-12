function[target,image,flag,originalrgb]=READIN(dataPath)
% 输入：
% datapath：图片库位置，由用户输入

% 输出：
% target:目标图片，要检测的图片
% image:图片库中所有图片，用于与目标图片比对
% flag：图片库中每张图片对应flag中的一个元素，值为1代表其原来是rgb图片，值为0代表原图是二值或灰度
% originalrgb：储存原图是rgb的图片并返回，使输出时可以输出原图


%判断是否是RGB
image=zeros(256,256,32,6,55);
flag=zeros(24,8,4);

%读入目标图片
 [file,path]=uigetfile('*.gif');
 target=imread(fullfile(path,file));
 target=imresize(target,[256,256]);
 if  numel(size(target))==3
     target=rgb2gray(target);
 end
 level1=graythresh(target);
 target=double(imbinarize(target,level1)*255);


%读入所有图片
A=dir(dataPath);
for k= 3:length(A)
    B=dir(fullfile(dataPath,A(k).name));
    for m = 3:length(B)
        C=dir(fullfile(dataPath,A(k).name,B(m).name,'\*.gif'));
        for n = 3:length(C) 
            I=imread(fullfile(dataPath,A(k).name,B(m).name,C(n).name));
            I1=imresize(I,[256,256]);
           
            if  numel(size(I1))==3
                I1=rgb2gray(I1);
                originalrgb(:,:,:,k,m,n)=I1;
                flag(k,m,n)=1;
            end
            level=graythresh(I1);
            image(:,:,k-2,m-2,n-2)=imbinarize(I1,level)*255;
        end
    end
end

