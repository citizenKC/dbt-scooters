    SELECT tp.id
        , tp.user_id
        , tp.scooter_hw_id
        , tp.started_at
        , tp.finished_at
        , tp.start_lat
        , tp.start_lon
        , tp.finish_lat
        , tp.finish_lon
        , tp.distance_m
        , tp.price_rub
        , tp.duration_s
        , tp.is_free
        , tp.date
        , srt.sex
        , extract(year from tp.started_at) - extract(year from srt.birth_date) as age
        , {{ updated_at() }}
    FROM {{ref("trips_prep")}} as tp
LEFT JOIN {{ source("scooters_raw", "users") }} as srt
        ON srt.id = tp.user_id
{% if is_incremental() %}
    where tp.id > (Select max(id) from {{ this }})
    order by tp.id
    limit 75000
{% else %}
    where tp.id <= 75000
{% endif %}    
