%%CART决策树算法Matlab实现
clear all;
close all;
clc;

data = {
    1, 2, 1, 2, 2, 1, 0.697, 0.460, 1;
    2, 2, 3, 2, 2, 1, 0.774, 0.376, 1;
    2, 2, 1, 2, 2, 1, 0.634, 0.264, 1;
    1, 2, 3, 2, 2, 1, 0.608, 0.318, 1;
    3, 2, 1, 2, 2, 1, 0.556, 0.215, 1;
    1, 1, 1, 2, 1, 3, 0.403, 0.237, 1;
    2, 1, 1, 1, 1, 3, 0.481, 0.149, 1;
    2, 1, 1, 2, 1, 1, 0.437, 0.211, 1;
    2, 1, 3, 1, 1, 1, 0.666, 0.091, 0;
    1, 3, 2, 2, 3, 3, 0.243, 0.267, 0;
    3, 3, 2, 3, 3, 1, 0.245, 0.057, 0;
    3, 2, 1, 3, 3, 3, 0.343, 0.099, 0;
    1, 1, 1, 1, 2, 1, 0.639, 0.161, 0;
    3, 1, 3, 1, 2, 1, 0.657, 0.198, 0;
    2, 1, 1, 2, 1, 3, 0.360, 0.370, 0;
    3, 2, 1, 3, 3, 1, 0.593, 0.042, 0;
    1, 2, 3, 1, 1, 1, 0.719, 0.103, 0
};

tbl = cell2table(data, 'VariableNames', {'color', 'root', 'sound', 'texture', 'navel', 'touch', 'density', 'sweet', 'isgood'});

predictorVars = {'color', 'root', 'sound', 'density', 'sweet'};
responseVars = {'texture', 'navel', 'touch', 'isgood'};

% 构建第一个决策树模型
t1 = fitrtree(tbl, 'texture', 'PredictorNames', predictorVars);
view(t1, 'mode', 'graph');

% 构建第二个决策树模型
t2 = fitrtree(tbl, 'navel', 'PredictorNames', predictorVars);
view(t2, 'mode', 'graph');

% 构建第三个决策树模型
t3 = fitrtree(tbl, 'touch', 'PredictorNames', predictorVars);
view(t3, 'mode', 'graph');

% 构建第四个决策树模型
t4 = fitrtree(tbl, 'isgood', 'PredictorNames', predictorVars);
view(t4, 'mode', 'graph');


new_sample = {
    1, 3, 3, 0.526, 0.200};

tbl_new_sample = cell2table(new_sample, 'VariableNames', predictorVars);

predicted_texture = predict(t1, tbl_new_sample);
predicted_navel = predict(t2, tbl_new_sample);
predicted_touch = predict(t3, tbl_new_sample);
predicted_isgood = predict(t4, tbl_new_sample);
% 打印预测结果
disp('预测结果:');
disp(predicted_texture);
disp(predicted_navel);
disp(predicted_touch);
disp(predicted_isgood);


