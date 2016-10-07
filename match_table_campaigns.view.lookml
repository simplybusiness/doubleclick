- view: match_table_campaigns
  sql_table_name: | 
       (select * from `ekoblov-test.dcm1684.match_table_campaigns_1684` where _LATEST_DATE = _DATA_DATE)
  fields:

  - dimension: advertiser_id
    type: string
    hidden: true
    sql: ${TABLE}.Advertiser_ID

  - dimension: billing_invoice_code
    type: string
    sql: ${TABLE}.Billing_Invoice_Code

  - dimension: campaign_name
    type: string
    sql: ${TABLE}.Campaign

  - dimension: campaign_end
    type: time
    datatype: yyyymmdd
    timeframes: [date, week, month, year]
    sql: ${TABLE}.Campaign_End_Date

  - dimension: campaign_id
    hidden: true
    type: string
    sql: ${TABLE}.Campaign_ID

  - dimension: campaign_start
    type: time
    datatype: yyyymmdd
    timeframes: [date, week, month, year]
    sql: ${TABLE}.Campaign_Start_Date
