- view: match_table_campaigns
  sql_table_name: | 
        (SELECT * FROM TABLE_QUERY(
        [ekoblov-test:dcm1684], 
        'table_id= (Select MAX(table_id) 
                              FROM [ekoblov-test:dcm1684.__TABLES__]
                              where table_id contains "match_table_campaigns_1684_")'
        )
        )  
  fields:

  - dimension: advertiser_id
    type: string
    sql: ${TABLE}.Advertiser_ID

  - dimension: billing_invoice_code
    type: string
    sql: ${TABLE}.Billing_Invoice_Code

  - dimension: campaign
    type: string
    sql: ${TABLE}.Campaign

  - dimension: campaign_end_date
    type: string
    sql: ${TABLE}.Campaign_End_Date

  - dimension: campaign_id
    type: string
    sql: ${TABLE}.Campaign_ID

  - dimension: campaign_start_date
    type: string
    sql: ${TABLE}.Campaign_Start_Date

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: []

