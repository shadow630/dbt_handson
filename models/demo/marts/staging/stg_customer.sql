{{ config(materialized='view') }}
select * from {{source('music_db','customer')}}