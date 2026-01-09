select distinct ev.user_id
     , ev.timestamp
     , ev.type_id
from {{ source("scooters_raw", "events") }} as ev
{% if is_incremental() %}
where ev.timestamp > (select max("timestamp") from {{this}}) 
{% else %}
where ev.timestamp < '2023-08-01'
{% endif %}

