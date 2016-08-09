- view: match_table_cities_1684_20160724
  sql_table_name: dcm1684.match_table_cities_1684_20160724
  fields:

  - dimension: city
    type: string
    sql: ${TABLE}.City

  - dimension: city_id
    type: string
    sql: ${TABLE}.City_ID

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: []

