SELECT ct.name
FROM CITY ct, 
    COUNTRY co
WHERE ct.CountryCode = co.Code AND
    co.Continent = 'Africa'