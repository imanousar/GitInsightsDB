# Organizations of a specific user or organizations in which a specific user belongs to - Apply for Batman 

(SELECT 
    organization.name AS 'Organizations of Batman'
FROM
    user
        JOIN
    organization_user ON user.user_id = organization_user.user_id
        JOIN
    organization ON organization_user.org_name = organization.name
WHERE
    username = 'batman') UNION (SELECT 
    organization.name AS org
FROM
    user
        JOIN
    user_team ON user_team.user_id = user.user_id
        JOIN
    team ON team.team_id = user_team.team_id
        JOIN
    organization ON organization.name = team.organization
WHERE
    username = 'batman')
    
