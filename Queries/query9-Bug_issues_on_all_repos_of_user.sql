# Bug issues on repos owned by a user - Apply for user konsletr

SELECT issue.*, repo.name, user.username
FROM 
    repo 
        JOIN 
    user on repo.owner_id = user.id
        JOIN 
    issue on repo.id = issue.repo_id
WHERE
    user.username = "konsletr" and issue.label = "bug";