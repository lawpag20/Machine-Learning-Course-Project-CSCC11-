%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% CSC C11 - Assignment 3 - K-means clustering
%
% This function implements K-means clustering for a set of input
%  vectors, and an *initial* set of cluster centers.
%
% function [centers,labels]=kmeans(data,cent_init,k)
%
% Example calls (assuming data contains vectors of length 3 in each row)
%
% [centers,labels]=kmeans(data,[1 2 3; 4 5 6],2);  % use initial centers
%                                                  % [1 2 3] and [4 5 6]
% 
%
% Inputs: data - an array of input data points size n x d, with n 
%                input points (one per row), each of length d.
%         k - number of clusters
%         cent_init - an array of size k x d, with k initial cluster centers
%
% Outputs: centers - Final cluster centers
%          labels - An array of size n x 1, with labels indicating
%                   which cluster each input point belongs to.
%                   e.g. if data point i belongs to cluster j,
%                   then labels(i)=j
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [centers,labels]=kmeans(data,cent_init,k)

centers=zeros(k,size(data,2));
labels=zeros(size(data,1),1);

if (size(cent_init,1)~=k | size(cent_init,2)~=size(data,2) | isempty(cent_init))
  fprintf(2,'Initial centers array has wrong dimensions.\n');
  return;
end;

centers=cent_init;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TO DO: Complete the function by implementing the k-means algorithm
%        below.
% 
%        As a reminder, this is a loop that:
%          * Assigns data points to the closest cluster center
%          * Re-computes cluster centers based on the data points
%            assigned to them.
%          * Update the labels array to contain the index of the
%            cluster center each point is assigned to
%        Loop ends when the labels do not change from one iteration
%         to the next. 
%
%  DO NOT compute distances from data points to cluster centers
%   with a for loop over data points. Doing so will cause you to wait
%   forever for this thing to converge. Your TA certainly won't
%   wait that long.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

current_labels = ones(size(data,1),1);

while(isequal(current_labels, labels) ~= 1)
  current_labels = labels;
  dist = [];
  
  for i = 1:size(centers,1)
    dist = [dist sqrt(sum((data-centers(i,:)).^2,2))];
  end
  
  [v, labels] = min(dist,[],2);
  for (j = 1:size(centers,1))
    centers(j,:) = sum(data(labels(:,1)==j,:))/size(data(labels(:,1)==j,:),1);
  end
end

end
