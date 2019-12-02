# Organizations of Batman or organization in which Batman belong to

(select organization.name as 'Organizations of Batman'
 from user
	join organization_user on user.user_id = organization_user.user_id
	join organization on organization_user.org_name = organization.name
where username = 'batman')

	union(

    select organization.name as org
	from user
		join user_team on user_team.user_id = user.user_id
		join team on team.team_id = user_team.team_id
		join organization on organization.name = team.organization
	where username = 'batman')