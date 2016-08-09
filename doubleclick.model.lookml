- connection: doubleclick

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

# NOTE: please see https://www.looker.com/docs/r/dialects/bigquery
# NOTE: for BigQuery specific considerations

- explore: activity
  always_filter: 
    date_filter: '30 Days'

- explore: click
  always_filter: 
    date_filter: '30 Days'

- explore: impression
  always_filter: 
    date_filter: '30 Days'

- explore: match_table_ads
  always_filter: 
    date_filter: '30 Days'

