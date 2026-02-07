    select tp.date
        , sum(tp.price_rub) as revenure_rub
        -- , now() AT TIME ZONE 'utc' as updated_at -- was
        , {{ updated_at() }}
    from {{ ref("trips_prep") }} as tp
    {% if is_incremental() %}
    where tp.date >= (select max(date) - INTERVAL '2' day from {{this}})
 {% endif %}
    group by tp.date
           , updated_at
    order by tp.date
   

-- dbt ls -s config.materialized:incremental -  найти все инкрементальные модели в проекте

--dbt build -s config.materialized:incremental - Запускаем инкрементальные модели, чтобы убедиться, что все работает