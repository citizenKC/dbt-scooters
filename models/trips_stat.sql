select count(1) as trips,
	   count(distinct tr.user_id) as users,
       AVG(tr.duration_s) / 60  as avg_duration_min,
       SUM(tr.price_rub) as revenue_rub,
       (SUM(case when tr.is_free = True
	     		then 1
	     	    else 0
	     		end)::numeric / count(1)::numeric) * 100 as free_trips_pct,
		SUM(tr.distance_m)/1000 AS sum_distance_km 
from {{ ref("trips_prep") }} as tr