    select tp.date
        , sum(tp.price_rub) as revenure_rub
        , now() AT TIME ZONE 'utc' as updated_at
    from {{ ref("trips_prep") }} as tp
    {% if is_incremental() %}
    where tp.date >= (select max(date) - INTERVAL '2' day from {{this}})
 {% endif %}
    group by tp.date
           , updated_at
    order by tp.date
   

