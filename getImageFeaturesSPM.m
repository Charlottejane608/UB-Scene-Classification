function [h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize)
% Compute histogram of visual words using SPM method
% Inputs:
%   layerNum: Number of layers (L+1)
%   wordMap: WordMap matrix of size (h, w)
%   dictionarySize: the number of visual words, dictionary size
% Output:
%   h: histogram of visual words of size {dictionarySize * (4^layerNum - 1)/3} (l1-normalized, ie. sum(h(:)) == 1)

    % TODO Implement your code here
count=0;

temporaryh=zeros(2^(layerNum-1),2^(layerNum-1)); %temporary histogram file

for layer=layerNum-1:-1:0
	cell_no=2^layer; %total number of cells
	cellsize=floor(size(wordMap)/ cell_no);
	for i=1:cell_no
		for j=1:cell_no
			count=count+1;
			if layer==layerNum-1
				cell=wordMap((i-1)*cellsize(1)+1):(i*cellsize),((j-1)*cellsize(2)+1):(j*cellsize(2));
				h(count,:)=getImageFeatures(cell,dictionarySize)/2;
			else
				h(count,:)=h(temporaryh(i*2-1,j*2-1),:) + h(temporaryh(i*2,j*2-1),:) + h(temporaryh(i*2-1,j*2),:) + h(temporaryh(i*2,j*2),:);
		if layer ~=0
			h(count,:)=h(count,:)/2;
		end 
	end

			temporaryh(i,j)=count;
		end
	end
end

h=h(:)/sum(h(:)); %summing up all the smaller histos to get a final histogram image.
end