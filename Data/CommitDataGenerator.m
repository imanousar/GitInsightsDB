clc
clear

% table: repo
% columns: id , owner_id
repoIDownerID = [ ...
    1     1
    2     1
    3     2
    4     2
    5     1
    6     2
    7     3
    8     3
    9     3
    10     7
    11     7
    12     7
    13     9
    14     5
    15     6
    16    15
    17    15
    18    15
    19    11
    20    16
    21    16
    22    16
    23    14
    24    14
    25    14
    26    14
    27     8
    28     8
    29     7
    30    14
    31    11
    32    11
    33    11
    34    11
    35    16
    36    12
    37    17
    38    16
    39    15
    40    16];

% table: user-team
% columns: org_id , user_id
orgIDuserID = [ ...
    12     5
    12     6
    13     8
    14     2
    14     4
    13     3
    13     4
    15     4
    15     5
    16     6
    16     7
    16     3
    16     4
    15     2
    11     2
    11     3
    11     2
    11     3
    11     2
    11     3
    16     1
    16    10
    14     3
    14     4
    12     5
    12     6
    17     2
    17     5
    17     6
    17    10
    17     7
    17     9
    16     1
    16     2
    16     3
    16     7
    16     9
    16    10
    15     5
    11     2
    11     3];

repo_id = randi([1,40],1,120)';
user_id = zeros(size(repo_id));

for i = 1:length(repo_id)
    tempUsers = repo2user(repoIDownerID,orgIDuserID,repo_id(i));
    user_id(i) = tempUsers(randi([1,length(tempUsers)]));
end

fprintf("Random users - repo_id's (user must be a collaborator of the corresponding repo) for Commit\n\n")

user_id
repo_id

fprintf("\nRandom Timestamps for Commit\n\n\n")
for i = 1 : length(repo_id)
    y=randi([2017,2019]);
    m=randi([1,12]);
    d=randi([1,28]);
    h=randi([0,23]);
    min=randi([0,59]);
    s=randi([0,59]);
    fprintf("%02d/%02d/%02d %02d:%02d:%02d\n",y,m,d,h,min,s)
end

function X = repo2user(repoIDownerID,orgIDuserID,i)

if repoIDownerID(i,2)>10 % org_id = owner_id + 10
    y = find((repoIDownerID(i,2)==orgIDuserID(1:end,1))==1);
    X = orgIDuserID(y,2);
else
    X = repoIDownerID(i,2);
end

end