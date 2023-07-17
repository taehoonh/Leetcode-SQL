# Write your MySQL query statement below
SELECT 
    a.post_id, 
    COALESCE(array_to_string(array_agg(DISTINCT b.topic_id ORDER BY b.topic_id::text), ','), 'Ambiguous!') AS topic
FROM 
    posts a
LEFT JOIN 
    keywords b
ON 
    concat(' ', lower(a.content), ' ') LIKE concat('% ', lower(b.word), ' %')
GROUP BY 
    a.post_id;
