CREATE OR REPLACE VIEW sampling_days_view AS
SELECT
  deployment_id,
  project_id,
  COUNT(DISTINCT DATE(date_taken)) AS distinct_date_count
FROM public.images
GROUP BY deployment_id, project_id;
