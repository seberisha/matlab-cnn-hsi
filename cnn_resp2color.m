function labels = cnn_resp2color(cnn_resp)
%generate label from cnn response matrix
%input: probability matrix of size r x c x classes
%output: label matrix of size r x c
ncr = reshape(cnn_resp, size(cnn_resp,1)*size(cnn_resp,2),size(cnn_resp,3));
temp = sum(cnn_resp,3);
[~, labels] = max(ncr,[],2);
labels(temp==0) = 0;
labels = reshape(labels, size(cnn_resp,1), size(cnn_resp,2));