
filterBank=createFilterBank();
k=150
alphad=50
load('../data/traintest.mat');
%{
image=imread('../data/imagedir/2.jpg')
lab=rgb2lab(image)
%imshow(I2)
[filterbank]=createFilterBank()
I3=imfilter(image,filterbank{10})
for i=1:20
    imagearray{i}=imfilter(lab,filterbank{i})
    imwrite(imagearray{i},sprintf('Z:/Sujith/filteredimages/%d.jpg',i))
    %imshow(imagearray{i})
       
    %finalimage=montage(imagearray)
    
    
    
end

myDir = 'Z:/Sujith/filteredimages/';
ext_img = '*.jpg';
a = dir([myDir ext_img]);

final=montage(cat(4,imagearray{:}),'Size', [4 5])

imshow(final)
%}
matrix=zeros(length(train_imagenames),alphad,60);
parfor i=1:length(train_imagenames)
    impath=strcat(['../data/'],train_imagenames);
    img=imread(impath{i});
    if size(img,3)==1
        img=repmat(img,[1 1 3]);
    end
    imglab=rgb2lab(img);
    [h, w ,~]=size(imglab);
    [filterResponses]=extractFilterResponses(imglab,filterBank);
    %imglab=rgb2lab(img);
    
    filter_response=reshape(filterResponses,h*w,60);
    
    %[x y]=ind2sub([h w], randperm(h*w,alphad));
    for j=1:h*w
        matrix(i,:,:)= filter_response(randperm(h*w,alphad),:);
    end
    
end
matrix=reshape(matrix,length(train_imagenames)*alphad,60);
%filterResponses=reshape(filterResponses,size(filterResponses,1)*size(filterResponses,2)*size(filterResponses,4),size(filterResponses,3));
[~,dictionary]=kmeans(matrix,k);
%}
