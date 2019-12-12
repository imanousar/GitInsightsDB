# Users who made a commit on a specific day - Apply for 2018-10-21

select distinct username 
from user
	join commit on user.id = commit.user_id
where commit.created_at between '2018-10-19 00:00:00' and '2018-10-19 23:59:59'
