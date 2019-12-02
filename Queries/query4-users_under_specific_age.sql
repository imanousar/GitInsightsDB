# Users under a specific age -Use the age 23 because under 18 there is no user

select count(*) as user_aged_less_than_23

from user

where date_of_birth > '1997-01-01'