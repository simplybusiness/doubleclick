- view: match_table_advertisers_1684_20160724
  sql_table_name: dcm1684.match_table_advertisers_1684_20160724
  fields:

  - dimension: advertiser
    type: string
    sql: ${TABLE}.Advertiser

  - dimension: advertiser_group
    type: string
    sql: ${TABLE}.Advertiser_Group

  - dimension: advertiser_group_id
    type: string
    sql: ${TABLE}.Advertiser_Group_ID

  - dimension: advertiser_id
    type: string
    sql: ${TABLE}.Advertiser_ID

  - dimension: floodlight_configuration
    type: string
    sql: ${TABLE}.Floodlight_Configuration

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: []

