view: match_table_campaigns {
  sql_table_name: acdc.com_google_doubleclick_data_transfer_match_table_campaigns_1;;

  dimension: advertiser_id {
    type: string
    hidden: yes
    sql: ${TABLE}.Advertiser_ID ;;
  }

  dimension: billing_invoice_code {
    type: string
    sql: ${TABLE}.Billing_Invoice_Code ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.Campaign ;;
  }

  dimension_group: campaign_end {
    type: time
    datatype: yyyymmdd
    timeframes: [date, week, month, year]
    sql: ${TABLE}.Campaign_End_Date ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: string
    sql: ${TABLE}.Campaign_ID ;;
  }

  dimension_group: campaign_start {
    type: time
    datatype: yyyymmdd
    timeframes: [date, week, month, year]
    sql: ${TABLE}.Campaign_Start_Date ;;
  }
}
