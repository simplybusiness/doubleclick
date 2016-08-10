- view: match_table_advertisers
  sql_table_name: | 
        (SELECT * FROM TABLE_QUERY(
        [ekoblov-test:dcm1684], 
        'table_id= (Select MAX(table_id) 
                              FROM [ekoblov-test:dcm1684.__TABLES__]
                              where table_id contains "match_table_advertisers_1684_")'
        )
        )
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

