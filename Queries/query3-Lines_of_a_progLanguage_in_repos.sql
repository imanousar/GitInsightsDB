# Lines of a language appear - Apply for Java

SELECT 
    sum(lines_of_code) as 'total lines of Java'
FROM
    language_repo
WHERE
    language = 'Java';