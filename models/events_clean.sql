{% set date = var("date", none) %}
select distinct user_id, "timestamp", type_id, {{updated_at()}}
from {{ source("scooters_raw", "events") }} as ev
where
{% if is_incremental() %}
    {% if date %}
        date(ev.timestamp) = date '{{ date }}'
    {% else %}
        ev.timestamp > (select max("timestamp") from {{this}}) 
    {% endif %}
{% else %}
    ev.timestamp < timestamp '2023-08-01'
{% endif %}

-- преобразуем внешнюю переменную во внутреннюю для модели. 
-- Для этого надо считать переменную date извне с помощью макроса var() 
-- и командой set записать ее в локальную переменную date, которую будем использовать дальше.
-- select distinct ev.user_id
--      , ev.timestamp
--      , ev.type_id
--      , {{ updated_at() }}
-- from {{ source("scooters_raw", "events") }} as ev
-- {% if is_incremental() %}
-- where ev.timestamp > (select max("timestamp") from {{this}}) 
-- {% else %}
-- where ev.timestamp < '2023-08-01'
-- {% endif %}

