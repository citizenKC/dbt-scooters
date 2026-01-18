    select ec.*
         , et.type
     from {{ ref("events_clean")}} as ec
left join {{ref("event_types")}} as et
       on et.type_id = ec.type_id