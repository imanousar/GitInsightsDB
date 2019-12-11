clc
clear

repoIDownerID = [1	1;
    2	1;
    3	2;
    4	2;
    5	1;
    6	2;
    7	3;
    8	3;
    9	3;
    10	7;
    11	7;
    12	7;
    13	9;
    14	5;
    15	6;
    16	18;
    17	18;
    18	18;
    19	20;
    20	28;
    21	28;
    22	17;
    23	23;
    24	23;
    25	24;
    26	24;
    27	8;
    28	8;
    29	7;
    30	24;
    31	20;
    32	30;
    33	30;
    34	19;
    35	16;
    36	11;
    37	26;
    38	22;
    39	29;
    40	22];

teamIDuserID = [1	5;
    1	6;
    2	8;
    3	2;
    3	4;
    4	3;
    4	4;
    5	4;
    5	5;
    6	6;
    6	7;
    7	3;
    7	4;
    8	2;
    9	2;
    9	3;
    10	2;
    10	3;
    11	2;
    11	3;
    12	1;
    12	10;
    13	3;
    14	4;
    15	5;
    15	6;
    16	2;
    16	5;
    16	6;
    16	10;
    17	7;
    17	9;
    18	1;
    18	2;
    18	3;
    18	7;
    18	9;
    18	10;
    19	5;
    20	2;
    20	3];

repo_id = randi([1,40],1,120)';
user_id = zeros(size(repo_id));

for i = 1:length(repo_id)
    tempUsers = repo2user(repoIDownerID,teamIDuserID,repo_id(i));
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
    fprintf("%02d-%02d-%02d %02d:%02d:%02d\n",y,m,d,h,min,s)
end

function X = repo2user(repoIDownerID,teamIDuserID,i)

if repoIDownerID(i,2)>10 %team_id = owner_id + 10
    y = find((repoIDownerID(i,2)==10+teamIDuserID(1:end,1))==1);
    X = teamIDuserID(y,2);
else
    X = repoIDownerID(i,2);
end

end