view: match_table_keyword_value_1684_20160724 {
  sql_table_name: dcm1684.match_table_keyword_value_1684_20160724 ;;

  dimension: ad_id {
    type: string
    sql: ${TABLE}.Ad_ID ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.Keyword ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: []
  }
}
