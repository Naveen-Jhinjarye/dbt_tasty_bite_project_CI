with days as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2022-01-01' as date)",
        end_date="cast('2026-01-01' as date)"
    ) }}
)

select
    cast(date_day as date)      as date_day,
    year(date_day)              as year,
    month(date_day)             as month,
    monthname(date_day)         as month_name,
    dayofweek(date_day)         as day_of_week,
    dayname(date_day)           as day_name,
    case when dayofweek(date_day) in (0, 6) then true else false end as is_weekend
from days