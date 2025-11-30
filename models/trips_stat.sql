select count(1) as trips,
	   count(distinct tr.user_id) as users,
       AVG(EXTRACT(EPOCH FROM (tr.finished_at - tr.started_at))/60) as avg_duration_m,
       SUM(tr.PRICE) / 100 as revenue_rub,
       (SUM(case when tr.PRICE = 0
	     		then 1
	     	    else 0
	     		end)::numeric / count(1)::numeric) * 100 as free_trips_pct 
from scooters_raw.trips as tr