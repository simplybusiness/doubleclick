- view: match_table_ad_placement_assignments
  sql_table_name: | 
      ( SELECT * FROM {% table_date_range date_filter dcm1684.match_table_ad_placement_assignments_1684_ %})
  
  fields:
  
  - filter: date_filter
    type: date

  - dimension: ad_id
    type: string
    sql: ${TABLE}.Ad_ID

  - dimension: placement_id
    type: string
    sql: ${TABLE}.Placement_ID

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: []

