view: match_table_browsers {
  sql_table_name: acdc.com_google_doubleclick_data_transfer_match_table_browsers_1
    ;;

  dimension: browser_platform {
    type: string
    sql: ${TABLE}.Browser_Platform ;;
  }

  dimension: browser_platform_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.Browser_Platform_ID ;;
  }
}
