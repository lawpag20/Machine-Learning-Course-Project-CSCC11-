%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CSC C11 - Assignment 3 - Dimensionality reduction by PCA
%
% In this function you will apply PCA to an input dataset to
% return a low-dimensional representation for the input data.
%
% Inputs:
% 
% input_data    -   Input dataset, one sample PER ROW
% k             -   Number of dimensions for the low-dimensional data
%
% Return values:
%
% LodWim_data   -   The low-dimensional representation of the dataset
%                   one sample per row
% V             -   The matrix with the PCA directions (one per column)
% mu            -   The mean of the input data (needed for reconstruction)
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [LowDim_data,V,mu]=datasetPCA(input_data, k);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TO DO: Complete the code below to find the PCA directions.
%        
%        Note: Use the eigs() function for computing the 
%              eigenvalues and eigenvectors.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M = size(input_data,1);
mu = mean(input_data);
new_data = input_data-mu;
cov_data = cov(new_data);
[V, d] = eigs(cov_data,k);
LowDim_data = new_data * V;

end
