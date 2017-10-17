view: match_table_custom_floodlight_variables_1684_20160724 {
  sql_table_name: acdc.com_google_doubleclick_data_transfer_match_table_custom_floodlight_variables_1;;

  dimension: floodlight_configuration {
    type: string
    sql: ${TABLE}.Floodlight_Configuration ;;
  }

  dimension: floodlight_variable_id {
    type: string
    sql: ${TABLE}.Floodlight_Variable_Id ;;
  }

  dimension: floodlight_variable_name {
    type: string
    sql: ${TABLE}.Floodlight_Variable_Name ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [floodlight_variable_name]
  }
}
