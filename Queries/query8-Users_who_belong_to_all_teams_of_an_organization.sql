# Users who belong to all teams of an organization - Apply for Facebook.

# Table A
create table a as select
organization.id, team.name
from team 
join organization on team.org_id = organization.id
where organization.name = "Facebook" ;

# Table B
create table b as select
a.id, a.name, user_team.user_id
from a
join user_team on (a.name = user_team.team_name and a.id = user_team.org_id)
;

# Table t = B/A
create temporary table t as select distinct x.user_id
from b as x
where not exists (
                  select *
                  from  a AS y
                  where not exists (
                                     select *
                                     from b as z
                                     where (z.user_id=x.user_id) and (z.name=y.name)
                                   )
                 );

# Final Result
select username,fullname
from user 
join t on user.id = t.user_id;

# Drop Tables
drop table a;
drop table b;
drop table t;