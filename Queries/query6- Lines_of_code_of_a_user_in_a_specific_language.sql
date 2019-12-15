# Lines of code of a user in a specific language. Apply for batman and Python.

Select sum(lines_of_code) as 'total lines of batman in Python'
From user
	join owner on owner.id = user.id
    join repo on owner.id = repo.owner_id
    join language_repo on repo.id = language_repo.repo_id
where username = 'batman' and language = 'Python';
