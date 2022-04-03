SELECT a.product_name, a.description, a.release_note_type, a.published_at
FROM `bigquery-public-data.google_cloud_release_notes.release_notes` AS a
LEFT JOIN `bigquery-public-data.google_cloud_release_notes.release_notes` AS b
ON SUBSTRING(a.description, 1, 20)=SUBSTRING(b.description, 1, 20) and a.product_id=b.product_id and a.release_note_type="ISSUE" and b.release_note_type="FIX"
WHERE b.description is null and a.published_at >= DATE_ADD(CURRENT_DATE(), INTERVAL -3 MONTH) and a.release_note_type="ISSUE"