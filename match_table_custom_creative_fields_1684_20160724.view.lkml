view: match_table_custom_creative_fields_1684_20160724 {
  sql_table_name: dcm1684.match_table_custom_creative_fields_1684_20160724 ;;

  dimension: advertiser_id {
    type: string
    sql: ${TABLE}.Advertiser_ID ;;
  }

  dimension: creative_field_name {
    type: string
    sql: ${TABLE}.Creative_Field_Name ;;
  }

  dimension: creative_field_number {
    type: number
    sql: ${TABLE}.Creative_Field_Number ;;
  }

  dimension: creative_field_value {
    type: string
    sql: ${TABLE}.Creative_Field_Value ;;
  }

  dimension: creative_id {
    type: string
    sql: ${TABLE}.Creative_ID ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [creative_field_name]
  }
}
