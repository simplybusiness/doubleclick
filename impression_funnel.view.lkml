view: impression_funnel {
  derived_table: {
    sql: select user_impression_metrics.*
                  , first_click
                  , latest_click
                  , count_clicks
                  , first_activity
                  , latest_activity
                  , count_conversions
                  , count_postview_conversions
                  , count_postclick_conversions
                  , revenue
            from
            (select user_id
                , campaign_id
                , ad_id
                , advertiser_id
                , min(zip_postal_code) as zip_code
                , min(state_region) as state_region
                , min(country_code) as country_code
                , min(event_time_timestamp) as first_impression
                , max(event_time_timestamp) as latest_impression
                , count(distinct site_id_dcm) as site_count
                , count(*) as count_impressions
            from acdc.com_google_doubleclick_data_transfer_impression_1
            where user_id <> '' and user_id is not null
            group by 1,2,3,4) as user_impression_metrics

            left join

            (select user_id
                , campaign_id
                , ad_id
                , advertiser_id
                , min(event_time_timestamp) as first_click
                , max(event_time_timestamp) as latest_click
                , count(*) as count_clicks
            from acdc.com_google_doubleclick_data_transfer_click_1
            where user_id <> '' and user_id is not null
            group by 1,2,3,4) as user_click_metrics

            on user_impression_metrics.user_id = user_click_metrics.user_id
            and user_impression_metrics.campaign_id = user_click_metrics.campaign_id
            and user_impression_metrics.ad_id = user_click_metrics.ad_id
            and user_impression_metrics.advertiser_id = user_click_metrics.advertiser_id


            left join

            (select  user_id
                , campaign_id
                , ad_id
                , advertiser_id
                , min(event_time_timestamp) as first_activity
                , max(event_time_timestamp) as latest_activity
                , count(*) as count_conversions
                , sum(case when event_sub_type = 'POSTVIEW' THEN 1 ELSE 0 END) as count_postview_conversions
                , sum(case when event_sub_type = 'POSTCLICK' THEN 1 ELSE 0 END) as count_postclick_conversions
                , sum(total_revenue) as revenue
                from acdc.com_google_doubleclick_data_transfer_activity_1
                where user_id <> '' and user_id is not null
                and event_type = 'CONVERSION'
                group by 1,2,3,4) as user_activity_metrics
            on user_impression_metrics.user_id = user_activity_metrics.user_id
            and user_impression_metrics.campaign_id = user_activity_metrics.campaign_id
            and user_impression_metrics.ad_id = user_activity_metrics.ad_id
            and user_impression_metrics.advertiser_id = user_activity_metrics.advertiser_id
 ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.zip_code ;;
  }

  dimension: state_region {
    map_layer_name: us_states
    sql: ${TABLE}.state_region ;;
  }

  dimension: country_code {
    map_layer_name: countries
    sql: ${TABLE}.country_code ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
    view_label: "Users"
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
    view_label: "Campaigns"
  }

  dimension: ad_id {
    type: string
    sql: ${TABLE}.ad_id ;;
    view_label: "Ads"
  }

  dimension: advertiser_id {
    type: string
    sql: ${TABLE}.advertiser_id ;;
    view_label: "Advertisers"
  }

  dimension: creative_version {
    type: number
    sql: ${TABLE}.creative_version ;;
    view_label: "Ads"
  }

  dimension_group: first_ad_impression {
    type: time
    sql: ${TABLE}.first_impression ;;
    timeframes: [date, week, month, year]
    view_label: "Users"
  }

  dimension_group: latest_ad_impression {
    type: time
    datatype: epoch
    sql: ${TABLE}.latest_impression ;;
    timeframes: [date, week, month, year]
    view_label: "Users"
  }

  dimension: site_count {
    type: number
    hidden: yes
    sql: ${TABLE}.site_count ;;
  }

  dimension: count_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.count_impressions ;;
    view_label: "Impressions"
  }

  dimension_group: first_ad_click {
    type: time
    sql: ${TABLE}.first_click ;;
    timeframes: [date, week, month, year]
    view_label: "Users"
  }

  dimension_group: latest_ad_click {
    type: time
    sql: ${TABLE}.latest_click ;;
    timeframes: [date, week, month, year]
    view_label: "Users"
  }

  dimension: count_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.count_clicks ;;
    view_label: "Clicks"
  }

  dimension_group: first_ad_activity {
    type: time
    view_label: "Users"
    sql: ${TABLE}.first_activity ;;
    timeframes: [date, week, month, year]
  }

  dimension_group: latest_ad_activity {
    type: time
    view_label: "Users"
    sql: ${TABLE}.latest_activity ;;
    timeframes: [date, week, month, year]
  }

  dimension: time_to_conversion {
    type: number
    sql: datediff(d, ${TABLE}.first_impression,${TABLE}.first_activity ) ;;
  }

  dimension: count_conversions {
    type: number
    sql: ${TABLE}.count_conversions ;;
  }

  dimension: count_postview_conversions {
    type: number
    sql: ${TABLE}.count_postview_conversions ;;
  }

  dimension: count_postclick_conversions {
    type: number
    sql: ${TABLE}.count_postclick_conversions ;;
  }

  dimension: revenue {
    type: number
    hidden: yes
    sql: ${TABLE}.revenue ;;
  }

  measure: total_impressions {
    type: sum
    sql: ${count_impressions} ;;
  }

  measure: total_clicks {
    type: sum
    sql: ${count_clicks} ;;
  }

  measure: total_conversions {
    type: sum
    sql: ${count_conversions} ;;
  }

  measure: total_post_view_conversions {
    type: sum
    sql: ${count_postview_conversions} ;;
  }

  measure: total_post_click_conversions {
    type: sum
    sql: ${count_postclick_conversions} ;;
  }

  measure: count_users {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: count_users_who_clicked {
    type: count_distinct
    sql: ${user_id} ;;

    filters: {
      field: first_ad_click_date
      value: "-NULL"
    }
  }

  measure: count_users_converted {
    type: count_distinct
    sql: ${user_id} ;;

    filters: {
      field: first_ad_activity_date
      value: "-NULL"
    }
  }

  measure: action_rate {
    type: number
    sql: 1.00* ${total_conversions}/NULLIF(${total_impressions},0) ;;
    value_format_name: decimal_4
    description: "Total Conversions/Total Impressions"
  }

  measure: action_rate_x_1000 {
    type: number
    sql: 1000.00 *${action_rate} ;;
    value_format_name: decimal_2
    description: "1000 * Total Conversions/Total Impressions"
  }

  measure: total_revenue {
    type: sum
    sql: ${revenue} ;;
  }

  measure: conversion_rate {
    type: number
    sql: 1.00*  ${total_post_click_conversions}/NULLIF(${total_clicks},0) ;;
    value_format_name: percent_2
    description: "Total Post Click Conversions/Total Clicks"
  }

  measure: click_through_rate {
    type: number
    sql: 1.00 * ${total_clicks}/NULLIF(${total_impressions},0) ;;
    value_format_name: percent_2
    description: "Total Clicks/Total Impressions"
  }

  measure: impressions_per_user {
    type: number
    sql: 1.00 * ${total_impressions}/NULLIF(${count_users},0) ;;
    value_format_name: decimal_1
  }

  set: detail {
    fields: [user_id, campaign_id, ad_id, advertiser_id, creative_version, site_count, count_impressions, count_clicks, count_conversions, total_conversions, revenue]
  }
}
