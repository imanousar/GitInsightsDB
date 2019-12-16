# Commit history of a file at a repo of a specific user - Apply for file "d3d10sdklayers.dll" at "Test" repo owned by user "konsletr"

SELECT commit_file.hash, commit_file.filename, commit_file.action, commit.created_at as timestamp 
FROM 
    repo 
        JOIN 
    commit_file on repo.id = commit_file.repo_id 
        JOIN
    commit on (commit.hash = commit_file.hash and commit_file.repo_id = commit.repo_id) 
        JOIN user on user.id = repo.owner_id 
WHERE repo.name = "Test" and user.username = "konsletr" and commit_file.filename = "d3d10sdklayers.dll"
ORDER BY commit.created_at DESC;