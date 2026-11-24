select
    cast(o.order_ts as date) as order_date,
    o.truck_id,
    t.primary_city,
    count(o.order_id) as order_count,
    sum(o.order_total) as total_revenue
from {{ ref('stg_orders') }} o
inner join {{ ref('stg_trucks') }} t
    on o.truck_id = t.truck_id
group by
    cast(o.order_ts as date),
    o.truck_id,
    t.primary_city
