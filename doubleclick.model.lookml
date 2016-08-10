- connection: doubleclick

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

# NOTE: please see https://www.looker.com/docs/r/dialects/bigquery
# NOTE: for BigQuery specific considerations

- explore: activity
  always_filter: 
    date_filter: '30 Days'
  joins: 
  - join: match_table_ads
    sql_on: ${activity.ad_id} = ${match_table_ads.ad_id}
    relationship: many_to_one

  - join: match_table_campaigns
    sql_on: ${activity.campaign_id} = ${match_table_campaigns.campaign_id}
    relationship: many_to_one
  
  - join: match_table_advertisers
    sql_on: ${activity.advertiser_id} = ${match_table_advertisers.advertiser_id}
    relationship: many_to_one
  
  - join: match_table_ad_placement_assignments
    sql_on: ${activity.ad_id} = ${match_table_ad_placement_assignments.ad_id} and ${activity.placement_id} = ${match_table_ad_placement_assignments.placement_id}
    relationship: many_to_one
   
  - join: match_table_browsers
    sql_on: ${activity.browser_platform_id} = ${match_table_browsers.browser_platform_id}
    relationship: many_to_one
    
- explore: click
  always_filter: 
    date_filter: '30 Days'
  joins: 
  - join: match_table_ads
    sql_on: ${click.ad_id} = ${match_table_ads.ad_id}
    relationship: many_to_one
  
  - join: match_table_campaigns
    sql_on: ${click.campaign_id} = ${match_table_campaigns.campaign_id}
    relationship: many_to_one
  
  - join: match_table_advertisers
    sql_on: ${click.advertiser_id} = ${match_table_advertisers.advertiser_id}
    relationship: many_to_one
  
  - join: match_table_ad_placement_assignments
    sql_on: ${click.ad_id} = ${match_table_ad_placement_assignments.ad_id} and ${click.placement_id} = ${match_table_ad_placement_assignments.placement_id}
    relationship: many_to_one
  
  - join: match_table_browsers
    sql_on: ${click.browser_platform_id} = ${match_table_browsers.browser_platform_id}
    relationship: many_to_one
    
- explore: impression
  always_filter: 
    date_filter: '30 Days'
  joins: 
  - join: match_table_ads
    sql_on: ${impression.ad_id} = ${match_table_ads.ad_id}
    relationship: many_to_one
  
  - join: match_table_campaigns
    sql_on: ${impression.campaign_id} = ${match_table_campaigns.campaign_id}
    relationship: many_to_one
  
  - join: match_table_advertisers
    sql_on: ${impression.advertiser_id} = ${match_table_advertisers.advertiser_id}
    relationship: many_to_one
  
  - join: match_table_ad_placement_assignments
    sql_on: ${impression.ad_id} = ${match_table_ad_placement_assignments.ad_id} and ${impression.placement_id} = ${match_table_ad_placement_assignments.placement_id}
    relationship: many_to_one
  
  - join: match_table_browsers
    sql_on: ${impression.browser_platform_id} = ${match_table_browsers.browser_platform_id}
    relationship: many_to_one