select (COUNT(*) FILTER (WHERE ef.type = 'cancel_search')::numeric / COUNT(*) FILTER (WHERE ef.type = 'start_search')) * 100 as cancel_pct
from {{ref("events_full")}} as ef 