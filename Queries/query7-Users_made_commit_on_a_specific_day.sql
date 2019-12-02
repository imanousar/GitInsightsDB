# Users who made a commit on a specific day - Apply for 2018-10-21

select distinct username 
from user
	join commit on user.user_id = commit.user_id
where commit.timestamp between '2018-10-21 00:00:00' and '2018-10-21 23:59:59'
