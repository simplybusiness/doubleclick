view: match_table_custom_rich_media_1684_20160724 {
  sql_table_name: acdc.com_google_doubleclick_data_transfer_match_table_custom_rich_media_1 ;;

  dimension: advertiser_id {
    type: string
    sql: ${TABLE}.Advertiser_ID ;;
  }

  dimension: rich_media_event {
    type: string
    sql: ${TABLE}.Rich_Media_Event ;;
  }

  dimension: rich_media_event_id {
    type: string
    sql: ${TABLE}.Rich_Media_Event_ID ;;
  }

  dimension: rich_media_event_type {
    type: string
    sql: ${TABLE}.Rich_Media_Event_Type ;;
  }

  dimension: rich_media_event_type_id {
    type: string
    sql: ${TABLE}.Rich_Media_Event_Type_ID ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: []
  }
}
