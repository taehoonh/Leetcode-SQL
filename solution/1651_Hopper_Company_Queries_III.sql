# Write your MySQL query statement below
select month,
    coalesce(round(sum(ride_distance)/3,2),0) as average_ride_distance,
    coalesce(round(sum(ride_duration)/3,2),0) as average_ride_duration
from
(
    select months.month, ride_id
    from Rides
    right join
    (
        select "2020-1-1" as start, "2020-3-31" as last, 1 as month
        union select "2020-2-1", "2020-4-30", 2
        union select "2020-3-1", "2020-5-31", 3
        union select "2020-4-1", "2020-6-30", 4
        union select "2020-5-1", "2020-7-31", 5
        union select "2020-6-1", "2020-8-31", 6
        union select "2020-7-1", "2020-9-30", 7
        union select "2020-8-1", "2020-10-31", 8
        union select "2020-9-1", "2020-11-30", 9
        union select "2020-10-1", "2020-12-31", 10
    ) as months
    on months.start <= requested_at and months.last >= requested_at
) total
left join AcceptedRides as a
on total.ride_id=a.ride_id
group by month
order by month;