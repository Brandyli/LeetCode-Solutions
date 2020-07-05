select w1.id as 'Id' from weather w1 join weather w2 
on datediff(w1.recorddate, w2.recorddate) = 1
and w1.temperature > w2.temperature;
