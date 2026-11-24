select
    {{ dbt_utils.generate_surrogate_key(['m.menu_item_id']) }} as menu_item_key,
    m.menu_item_id,
    m.menu_item_name,
    m.menu_type,
    m.truck_brand_name,
    c.brand_category,
    m.item_category,
    m.item_subcategory,
    m.sale_price_usd
from {{ ref('stg_menu') }} m
left join {{ ref('truck_brand_category') }} c
    on m.truck_brand_name = c.truck_brand_name
