- view: match_table_ad_placement_assignments
  sql_table_name: | 
        (select * from `ekoblov-test.dcm1684.match_table_ad_placement_assignments_1684` where _LATEST_DATE = _DATA_DATE)
        
  fields:

  - dimension: ad_id
    type: string
    sql: ${TABLE}.Ad_ID

  - dimension: placement_id
    type: string
    sql: ${TABLE}.Placement_ID

  - dimension: pk
    hidden: true
    primary_key: true
    sql: CONCAT(${ad_id},'-',${placement_id})

