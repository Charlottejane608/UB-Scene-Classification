function [wordMap] = getVisualWords(img, filterBank, dictionary)


warning('off','all') %simply cause they are annoying!
filterBank=createFilterBank();
load('dictionary.mat');
%img=imread('../data/imagedir/5.jpg'); For checking with individual images
row=size(img,1);
col=size(img,2);
imgsize=row*col;
wordMap=zeros(row*col,1);
filtsRes=extractFilterResponses(img,filterBank);
ds=size(dictionary);
%size(filtsRes)
filtsResponse=reshape(filtsRes,imgsize,60);
%y=size(filtsResponse);
%dictionary=dictionary;
%z=size(dictionary);


for i=1:row*col
    [a,b]=min(pdist2(filtsResponse(i,:),dictionary));
    wordMap(i,1)=b;
end
%minimumdistance=min(voldemort);
%imagesc(wordMap)

wordMap=reshape(wordMap,row,col);
%Testing individual codes here
%wordMap=reshape(minimumdistance,row,col);

%subplot(1,2,1), imagesc(img);
%subplot(1,2,2), imagesc(wordMap);
%wordHist=getImageFeaturesSPM(3,wordMap,ds);
%h=getImageFeatures(wordMap,size(dictionary))
%buildRecognitionSystem()
%evaluateRecognitionSystem()
%histogram(wordMap)
%normc(wordMap)
%imshow(h)
%image=imagesc(wordMap)
end
    