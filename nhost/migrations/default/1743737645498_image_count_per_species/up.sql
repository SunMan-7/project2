CREATE VIEW image_count_per_species AS
SELECT
    s.id,
    s.common_name,
    s.genus,
    s.species,
    s.taxonomy_subtype,
    i.project_id,
    COUNT(i.file_id) AS image_count
FROM
    public.species s
JOIN public.image_species isp ON s.id = isp.species_id
JOIN public.images i ON isp.image_file_id = i.file_id
GROUP BY
    i.project_id, s.id
HAVING COUNT(i.file_id) > 0;
