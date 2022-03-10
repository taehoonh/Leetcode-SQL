# Write your MySQL query statement below
select player_id, player_name,
	sum((if(Wimbledon = player_id,1,0) + 
		if(Fr_open = player_id,1,0) + 
		if(US_open = player_id,1,0) + 
		if(Au_open = player_id,1,0))) as grand_slams_count
from Players inner join Championships
on Wimbledon = player_id or Fr_open = player_id or US_open = player_id or Au_open = player_id
group by player_id;