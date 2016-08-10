- view: match_table_browsers
  sql_table_name: | 
        (SELECT * FROM TABLE_QUERY(
        [ekoblov-test:dcm1684], 
        'table_id= (Select MAX(table_id) 
                              FROM [ekoblov-test:dcm1684.__TABLES__]
                              where table_id contains "match_table_browsers_1684_")'
        )
        )
  fields:

  - dimension: browser_platform
    type: string
    sql: ${TABLE}.Browser_Platform

  - dimension: browser_platform_id
    primary_key: true
    hidden: true
    type: string
    sql: ${TABLE}.Browser_Platform_ID

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: []

