with date_age_cte as (
    select
        t.*,
        extract(year from t.started_at) - extract(year from u.birth_date) as age
    from
        {{ ref("trips_prep") }} as t
    inner join
        {{ source("scooters_raw", "users") }} as u
        on t.user_id = u.id
)
select
    "date",
    age,
    count(*) as trips,
    sum(price_rub) as revenue_rub
from
    date_age_cte
group by
    1,
    2

-- my old solution from trips_stat_age.sql

-- with cte as (
--    select cast(tr.started_at as date) as dt
--         , (cast(tr.started_at as date) - cast(us.birth_date as date)) / 365 as age
--         , count(1) as cnt
--    	 from scooters_raw.trips as tr
--      join scooters_raw.users as us
-- 	   on us.id = tr.user_id		
--     group by cast(tr.started_at as date)
--            , (cast(tr.started_at as date) - cast(us.birth_date as date)) / 365 
-- )

--   select src.age
--   	   , avg(src.cnt) as avg_trip_count
-- 	from cte as src
--    group by src.age