cd Iris_dataset
data = csvread("data - Copy.csv");
attr_data = data(2:end,2:5);
class_data = [ones(50,1);2*ones(50,1);3*ones(50,1)];
k = 17

pred_class = [];
for i = 1:rows(attr_data)
  attr_point = attr_data(i,:);
  dists = norm(attr_data - attr_point,"rows");
  dists_max = max(dists);
  
  mean_classes =[];
  for j = 1:k
    [_,idx] = min(dists,[],1);
    
    dists(idx) = dists_max ;
    cl = class_data(idx);
    mean_classes = [mean_classes;cl];
  end
  pred_class =[pred_class;mode(mean_classes)];
end
acurracy = sum(pred_class==class_data)/rows(attr_data)

cd ..


