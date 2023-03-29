{{ config(materialized='view') }}
select *  from `music_db.invoice_line`