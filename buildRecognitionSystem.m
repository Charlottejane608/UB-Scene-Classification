function buildRecognitionSystem()
% Creates vision.mat. Generates training features for all of the training images.

	load('dictionary.mat');
	load('../data/traintest.mat');

	imagenumber=length(train_imagenames);
	for i=1:imagenumber
		traininglabels{i}=mapping(train_labels(i));
		wordMapII=load(char(strcat('../data/',strrep(train_imagenames(i,1),'.jpg','.mat'))));
		train_features(:,i)=getImageFeaturesSPM(3,wordMapII.wordMap,size(dictionary,1)); %For three layers.

	end

	save('vision.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels');

%train_labels(1)
end