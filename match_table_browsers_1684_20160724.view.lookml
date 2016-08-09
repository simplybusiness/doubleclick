- view: match_table_browsers_1684_20160724
  sql_table_name: dcm1684.match_table_browsers_1684_20160724
  fields:

  - dimension: browser_platform
    type: string
    sql: ${TABLE}.Browser_Platform

  - dimension: browser_platform_id
    type: string
    sql: ${TABLE}.Browser_Platform_ID

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: []

