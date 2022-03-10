# Write your MySQL query statement below
select 
    platform, 
    experiment_name, 
    ifnull(num_experiments, 0) as num_experiments
from 
    (select "Android" as platform
     union
     select "IOS" as platform
     union
     select "Web" as platform) a 
    cross join (select "Reading" as experiment_name
                union 
                select "Sports" as experiment_name
                union
                select "Programming" as experiment_name) b
    left join (select platform, experiment_name, count(*) as num_experiments 
               from Experiments 
               group by 1, 2) c
    using (platform, experiment_name)
order by 1, 2;
