- view: match_table_designated_market_areas_1684_20160724
  sql_table_name: dcm1684.match_table_designated_market_areas_1684_20160724
  fields:

  - dimension: designated_market_area_dma
    type: string
    sql: ${TABLE}.Designated_Market_Area_DMA

  - dimension: designated_market_area_dma_id
    type: string
    sql: ${TABLE}.Designated_Market_Area_DMA_ID

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: []

