
{{ config(materialized='table') }}
with
    demo as (
        select distinct email, first_name, last_name
        from {{ref('stg_customer')}} cus
        join {{ref('stg_invoice')}} inv on cus.customer_id = inv.customer_id
        join {{ref('stg_invoice_line')}} inv_ln on inv.invoice_id = inv_ln.invoice_id
        where
            track_id in (
                select track_id
                from {{ref('stg_track')}} track
                join {{ref('stg_genre')}} genre on track.genre_id = genre.genre_id
                where genre.name = 'Rock'
            )
        order by email
    )

select *
from demo
