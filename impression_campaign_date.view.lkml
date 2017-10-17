include: "impression.view.lkml"
view: impression_campaign_date {
  extends: [impression]
  sql_table_name: ( SELECT * FROM
    acdc.com_google_doubleclick_data_transfer_impression_1 WHERE
    {% condition campaign_date_table.calendar_date %} TIMESTAMP(_DATA_DATE) {% endcondition %}
    )
     ;;
}
