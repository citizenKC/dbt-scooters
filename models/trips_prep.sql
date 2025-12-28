  SELECT id
  	   , user_id
  	   , scooter_hw_id
  	   , started_at
  	   , finished_at
  	   , start_lat
  	   , start_lon
  	   , finish_lat
  	   , finish_lon
  	   , distance as distance_m
  	   , cast(price / 100 as decimal(20,2)) as price_rub
  	   , EXTRACT(EPOCH FROM (finished_at - started_at))/60 as duration_s
  	   , price = 0 and EXTRACT(EPOCH FROM (finished_at - started_at)) > 0 as is_free
  	   , cast(started_at as date) as date 
    FROM {{ source("scooters_raw", "trips") }}