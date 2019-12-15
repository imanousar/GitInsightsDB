# Organizations of a specific user or organizations in which a specific user belongs to - Apply for Batman 

(SELECT 
    organization.name AS 'Organizations of Batman'
FROM
    user
        JOIN
    organization_user ON user.id = organization_user.user_id
        JOIN
    organization ON organization_user.org_id= organization.id
WHERE
    username = 'batman') UNION (SELECT 
    organization.name AS org
FROM
    user
        JOIN
    user_team ON user_team.user_id = user.id
        JOIN
    organization ON organization.id = user_team.org_id
WHERE
    username = 'batman');
    
