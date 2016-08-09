- view: match_table_creatives_1684_20160724
  sql_table_name: dcm1684.match_table_creatives_1684_20160724
  fields:

  - dimension: advertiser_id
    type: string
    sql: ${TABLE}.Advertiser_ID

  - dimension: creative
    type: string
    sql: ${TABLE}.Creative

  - dimension: creative_id
    type: string
    sql: ${TABLE}.Creative_ID

  - dimension: creative_image_url
    type: string
    sql: ${TABLE}.Creative_Image_URL

  - dimension: creative_last_modified_date
    type: string
    sql: ${TABLE}.Creative_Last_Modified_Date

  - dimension: creative_pixel_size
    type: string
    sql: ${TABLE}.Creative_Pixel_Size

  - dimension: creative_type
    type: string
    sql: ${TABLE}.Creative_Type

  - dimension: creative_version
    type: number
    sql: ${TABLE}.Creative_Version

  - dimension: rendering_id
    type: string
    sql: ${TABLE}.Rendering_ID

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: []

