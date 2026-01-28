with precalc as (
    select tu.id
     , tu.user_id
     , tu.scooter_hw_id
     , tu.started_at
     , tu.finished_at
     , tu.start_lat
     , tu.start_lon
     , tu.finish_lat
     , tu.finish_lon
     , tu.distance_m
     , tu.price_rub
     , tu.duration_s
     , tu.is_free
     , tu.date
     , tu.sex
     , tu.age
     , ag.group as age_group
  from {{ref('trips_users')}} as tu
  left join {{ref('age_groups')}} as ag
	   on tu.age between ag.age_start and ag.age_end 
)

select
    age_group,
    count(*) as trips,
    sum(price_rub) as revenue_rub
from precalc
group by
    1

-- or another solution
-- select
--     ag."group" as age_group,
--     count(*) as trips,
--     sum(price_rub) as revenue_rub
-- from
--     {{ ref("trips_users") }} as tu
--     cross join {{ ref("age_groups") }} as ag
-- where
--     tu.age >= ag.age_start
--     and tu.age <= ag.age_end
-- group by
--     1