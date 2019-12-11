% USE THIS SCRIPT AFTER CREATING THE commit.csv FILE
clc

% Taken from Commit.csv
repo_id = [ ...
    3
    21
    14
    8
    9
    37
    28
    19
    37
    5
    30
    30
    23
    8
    24
    12
    6
    9
    36
    3
    10
    3
    18
    1
    36
    8
    4
    13
    19
    5
    40
    14
    12
    3
    12
    2
    21
    31
    26
    4
    4
    32
    37
    22
    5
    34
    14
    12
    30
    1
    2
    27
    25
    22
    30
    29
    32
    12
    28
    23
    16
    3
    32
    14
    25
    30
    5
    6
    22
    20
    36
    32
    30
    3
    3
    4
    32
    38
    28
    6
    29
    5
    5
    26
    14
    27
    30
    24
    30
    10
    30
    39
    35
    4
    15
    15
    28
    24
    32
    15
    9
    4
    31
    9
    16
    23
    10
    26
    20
    7
    32
    5
    12
    10
    22
    4
    17
    5
    5
    32
    ];

% Enum List
strings = [
 "create"
 "update"
 "rename"
 "delete"
];

strings2 = [
 "update"
 "rename"    
];

% Create Random Enum List
% N = 120;
% index = randi([1,length(strings)],N,1);
% enum = strings(index)

arr = zeros(1,length(repo_id));
arr = string(arr);

for i = 1 : 40
   vec = find(repo_id==i);
   if(length(vec)<=length(strings))
        arr(vec)=strings(1:length(vec));
   else
        arr(vec(1:length(strings)-1))=strings(1:length(strings)-1);
        r = randi([1,2],1);
        arr(vec(length(strings):length(vec))) = strings2(r);
   end
end

arr'