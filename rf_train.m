function rf = rf_train(n_threads, n_trees, train_samples, train_labels)

%% train with random forest

%parallelize if specified
if n_threads > 1
    p = parpool('local', n_threads);
    paraoptions = statset('UseParallel', 'always');
end

%train the classifier
disp('Creating a Random Forest classifier...');
train_time = tic;
rf = TreeBagger(n_trees, train_samples, train_labels,'method','classification','options',paraoptions);
disp(['Time: ' num2str(toc(train_time)) 's']);

if n_threads > 1
    delete(p)
end
