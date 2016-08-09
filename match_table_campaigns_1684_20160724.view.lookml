- view: match_table_campaigns_1684_20160724
  sql_table_name: dcm1684.match_table_campaigns_1684_20160724
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

