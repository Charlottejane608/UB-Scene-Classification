function [filterBank, dictionary] = getFilterBankAndDictionary(imPaths)
% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   filterBank: N filters created using createFilterBank()
%   dictionary: a dictionary of visual words from the filter responses using k-means.

    filterBank  = createFilterBank();
    
    % TODO Implement your code here
    alpha=70;
    K=150;
    T=length(imPaths);
    filterResponse=zeros(T,alpha,60); %creating an empty matrix for storing filter responses
    
    for i=1:T %Scanning all the images 
	    img=imread(imPaths{i});
	    % imshow(img);
	    if size(img,3)==1 %Checking for grayscale images
	        % img=repmat(img,[1 1 3]);
	        img=cat(3,img,img,img);  %duplicating channels for grayscale images that generally have only channel.
        end
        
        %h=size(img,1);
        %w=size(img,2);
	   	[h,w,~]=size(img);
	    % img=reshape(img,a*b,3);
    	    img=reshape(img,h*w,3);
	    matrix(i,:,:)=img(randperm(h*w,alpha),:); %Selecting alpha number of random values from the image
	    % matrix=reshape(matrix,1,alpha,3);
	    % [x,y]=ind2sub([h w], randperm(h*w,alpha))
	    % img1=img(x,y,:);
	    % sum=size(img1,1)*size(img1,2)*size(img1,3)
	    % img=reshape(img1,1,alpha,3)
	    
	    
	    % size(filter_response)
	    % filterResponse(i,:,:)=filter_response;
    	end
	size(matrix); %Checking
	filter_response=extractFilterResponses(matrix,filterBank);
	filter_response=reshape(filter_response,T*alpha,60);
	[~, dictionary]=kmeans(filter_response, K, 'EmptyAction','drop');
    size(dictionary);
	% size(filterResponse)
	% filterResponse

end 
