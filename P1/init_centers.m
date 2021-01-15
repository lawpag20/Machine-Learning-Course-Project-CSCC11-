%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% CSC C11 - Assignment 3 - K-Means++ Center Initialization Algorithm
%
% This function implements K-Means++ center initialization algorithm 
% for a set of input vectors, and an *initial* set of cluster centers.
%
% function [centers]=init_centers(data,k,init_algo)
%
% Inputs: data - an array of input data points size n x d, with n 
%                input points (one per row), each of length d.
%         k - number of clusters
%         init_algo - the center initialization algorithm to use for 
%                     the k centers. The default is random initialization,
%		      but when init_algo is "kmeans++" it returns initial
%                     centers based on the kmeans++ alg.
%
% Outputs: centers - Initial cluster centers
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [centers] = init_centers(data,k,init_algo)
  centers = zeros(k, size(data, 2));

  if (strcmpi(init_algo, "kmeans++"))
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % TO DO: Complete this part so that your code chooses k initial
    %        centers using K-Means++ algorithm. 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % runs k-means++ initialization algorithm
    new_k = k - 1;
    [first_k, first_d] = size(data);
    first_k_val = randi(first_k);   
    current_cent = data(first_k_val,:);
    centers(1,:) = current_cent;
    sum_dist_tot = [];
    
    for i = 1:new_k
        curr_dist = data - current_cent(i,:);
        curr_dist = curr_dist.^2;
        sum_dist = sum(curr_dist, 2);
        sum_dist_tot = [sum_dist_tot sum_dist];
        sum_dist = min(sum_dist_tot, [], 2);
        distance_prob = sum_dist./(sum(sum_dist));
        v_size = length(distance_prob);
        newcenind = randsample(v_size, 1, true, distance_prob);
        next_cent = data(newcenind,:);
        centers((i+1),:) = next_cent;
        current_cent = [current_cent; next_cent];
    end
    
  else
    % choose initial centers randomly
    random_permutation = randperm(size(data, 1), k);
    centers = data(random_permutation, :);
  end;
