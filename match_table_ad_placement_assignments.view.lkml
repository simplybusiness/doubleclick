view: match_table_ad_placement_assignments {
  sql_table_name: acdc.com_google_doubleclick_data_transfer_match_table_ad_placement_assignments_1
    ;;

  dimension: ad_id {
    type: string
    sql: ${TABLE}.Ad_ID ;;
  }

  dimension: placement_id {
    type: string
    sql: ${TABLE}.Placement_ID ;;
  }

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${ad_id},'-',${placement_id}) ;;
  }
}
