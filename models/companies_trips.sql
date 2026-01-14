with trips_per_company as (
    select sc.company, count(1) as trips
      from {{ref("trips_prep")}} as tp
 left join {{ref("scooters")}} as sc 
		on sc.hardware_id = tp.scooter_hw_id  
     group by sc.company   
)

select tpc.company
	 , tpc.trips
	 , c.models 
	 , c.scooters 
	 , tpc.trips / cast(c.scooters as float) as trips_per_scooter
from trips_per_company as tpc
left join {{ref("companies")}} as c
	   on c.company = tpc.company