function[filterResponses]=extractFilterResponses(img,filterBank)


imagecount=0;
img=im2double(img);
img=rgb2lab(img);
for e=1:size(filterBank,1)
       for colorchannel=1:3
           imagecount=imagecount+1;
           filterResponses(:,:,imagecount)=imfilter(img(:,:,colorchannel),cell2mat(filterBank(e))); %For number of filter times the number of color channels.
       end
end
       
           