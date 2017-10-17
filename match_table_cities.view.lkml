view: match_table_cities {
  sql_table_name: acdc.com_google_doubleclick_data_transfer_match_table_cities_1
     ;;

    dimension: city {
      type: string
      sql: ${TABLE}.City ;;
    }

    dimension: city_id {
      type: string
      sql: ${TABLE}.City_ID ;;
    }

    measure: count {
      type: count
      approximate_threshold: 100000
      drill_fields: []
    }
  }
