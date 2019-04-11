view: match_table_creative_ad_assignments_1684_20160724 {
  sql_table_name: com_google_doubleclick_data_transfer_match_table_creative_ad_assignments_1 ;;

  dimension: ad_click_url {
    type: string
    sql: ${TABLE}.Ad_Click_URL ;;
  }

  dimension: ad_id {
    type: string
    sql: ${TABLE}.Ad_ID ;;
  }

  dimension: creative_end_date {
    type: string
    sql: ${TABLE}.Creative_End_Date ;;
  }

  dimension: creative_groups_1 {
    type: string
    sql: ${TABLE}.Creative_Groups_1 ;;
  }

  dimension: creative_groups_2 {
    type: string
    sql: ${TABLE}.Creative_Groups_2 ;;
  }

  dimension: creative_id {
    type: string
    sql: ${TABLE}.Creative_ID ;;
  }

  dimension: creative_rotation_type {
    type: string
    sql: ${TABLE}.Creative_Rotation_Type ;;
  }

  dimension: creative_start_date {
    type: string
    sql: ${TABLE}.Creative_Start_Date ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: []
  }
}
