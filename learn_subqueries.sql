-- Learning SQL Subqueries often called nested query or inner query --

-- Example -- 
SELECT Language, Percentage
FROM CountryLanguage
WHERE Percentage > 5.3
    (SELECT Percentage 
    FROM CountryLanguage
    WHERE CountryCode = 'ABW'
        AND IsOfficial = 'T');
        