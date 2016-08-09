- view: match_table_activity_types
  sql_table_name: | 
      ( SELECT * FROM {% table_date_range date_filter dcm1684.match_table_activity_types_1684_ %})
  
  fields:
  
  - filter: date_filter
    type: date

  - dimension: activity_group
    type: string
    sql: ${TABLE}.Activity_Group

  - dimension: activity_group_id
    type: string
    sql: ${TABLE}.Activity_Group_ID

  - dimension: activity_type
    type: string
    sql: ${TABLE}.Activity_Type

  - dimension: floodlight_configuration
    type: string
    sql: ${TABLE}.Floodlight_Configuration

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: []

