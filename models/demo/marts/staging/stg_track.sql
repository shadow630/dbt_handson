{{ config(materialized='view') }}
select * from `music_db.track`