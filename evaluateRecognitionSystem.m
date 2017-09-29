function [conf] = evaluateRecognitionSystem()
% Evaluates the recognition system for all test-images and returns the confusion matrix

	load('vision.mat');
	load('../data/traintest.mat');

	% TODO Implement your code here
count=zeros(length(mapping),length(mapping));

number_of_training_images=length(test_imagenames); %for final evaluation

for i = 1:50 %for initial testing. Should be replaced with number_of_training_images though 
	test_file=['../data/',test_imagenames{i,1}];
	approximation=find(strcmp(guessImage(test_file),mapping));
	count(test_labels(i),approximation)=count(test_labels(i),approximation) + 1;

		if test_labels(i)~=approximation
			fprintf('The system failed to classify this image correctly. The correct answer is %s \n', mapping{1, test_labels(i)});
        end

    		fprintf('Accuracy of the classification system is %0.2f%% \n ', 100 * trace(count)/sum(count(:)));

fprintf('The confusion matrix is as follows \n\n\n\n');
disp(count);
end