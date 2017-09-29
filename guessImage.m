function calculatedimage = guessImage( imagename ) 
% Given a path to a scene image, guess what scene it is
% Input:
%   imagename - path to the image

	fprintf('[System loading..]\n');
	load('vision.mat');
	load('../data/traintest.mat','mapping');

	image = im2double(imread(imagename));

	% imshow(image);
	fprintf('[Loading the Visual Words..]\n');
	wordMap = getVisualWords(image, filterBank, dictionary);
	h = getImageFeaturesSPM(3, wordMap, size(dictionary,2));
	distances = distanceToSet(h, train_features);
	[~,maxdistances] = max(distances);
	calculatedimage = mapping{train_labels(maxdistances)};
	fprintf('[Approximation of image is ]:%s.\n',calculatedimage);

	figure(1);
	imshow(image);
	title('The image to be classified')

end
