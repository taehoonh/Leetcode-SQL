# Write your MySQL query statement below
select months_drivers.month, round(coalesce(100 * coalesce(total_active_drivers, 0) / total_drivers, 0), 2) as working_percentage
from
(
    select month, count(driver_id) as total_drivers
    from Drivers as a
    right join
    (
        select "2020-1-31" as day, 1 as month
        union select "2020-2-29", 2
        union select "2020-3-31", 3
        union select "2020-4-30", 4
        union select "2020-5-31", 5
        union select "2020-6-30", 6
        union select "2020-7-31", 7
        union select "2020-8-31", 8
        union select "2020-9-30", 9
        union select "2020-10-31", 10
        union select "2020-11-30", 11
        union select "2020-12-31", 12
    ) as months
    on join_date <= day
    group by month
) months_drivers
left join
(
    select month, count(distinct b.driver_id) as total_active_drivers
    from
    (
        select ride_id, cast(substr(requested_at, 6, 2) as unsigned) as month
        from Rides
        where substr(requested_at, 1, 4) = "2020"
    ) month_rides
    join AcceptedRides as b
    on month_rides.ride_id = b.ride_id
    group by month
) months_active_drivers
on months_drivers.month = months_active_drivers.month;