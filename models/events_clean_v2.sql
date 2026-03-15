select distinct
    user_id,
    "timestamp",
    type_id,
    {{ updated_at() }},
    "date"
from
    {{ ref("events_prep") }}
where
    {{ incremental_date_condition(
        model=this,
        date=var('date', none),
        start_date=var('start_date', none),
        days_max=var('days_max', none)
    ) }}

-- {% if is_incremental() %}
--     {% if date %}
--         "date" = date '{{ date }}'
--     {% else %}
--         "date" > (select max("date") from {{ this }})
--     {% endif %}
-- {% else %}
--     "date" < date '2023-08-01'
-- {% endif %}