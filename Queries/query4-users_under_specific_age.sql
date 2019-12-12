# Users under a specific age -Use the age 23.

select count(*) as user_aged_less_than_23

from user

where date_of_birth > '1996-12-31'