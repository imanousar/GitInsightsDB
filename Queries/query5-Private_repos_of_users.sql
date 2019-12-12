# Private repos of specific users. Apply for batman and superman 

Select count(repo.id) as 'private_repos_of_batman_&_superman'

From user
	join owner on owner.id= user.id
    join repo on owner.id = repo.owner_id
where (username = 'batman' or username='superman') and is_public = '0'
