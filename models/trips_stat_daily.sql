select
    trp.date as date,
    count(*) as trips,
    max(trp.price_rub) / 100 as max_price_rub,
    avg(trp.distance_m) / 1000 as avg_distance_km,
    avg(price_rub / NULLIF(duration_s,0)) * 60 as avg_price_rub_per_min
from
    {{ref("trips_prep")}} as trp
group by
    1
order by
    1