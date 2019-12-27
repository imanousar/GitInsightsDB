from django.db import models

class Owner(models.Model):
    OWNER_TYPE_CHOICES=[
        ('u', 'user'),
        ('o', 'org')
    ]
    id = models.BigAutoField(primary_key=True)
    type = models.CharField(max_length=4, choices=OWNER_TYPE_CHOICES)

    def __str__(self):
        return f"{self.id}: {self.type}"


class User(models.Model):
    id = models.OneToOneField(Owner, models.CASCADE, db_column='id', primary_key=True)
    username = models.CharField(unique=True, max_length=45)
    fullname = models.CharField(max_length=45)
    date_of_birth = models.DateField()
    email = models.CharField(unique=True, max_length=45)
    created_at = models.DateTimeField()

    def __str__(self):
        return f"{self.username}"


class Org(models.Model):
    id = models.OneToOneField(Owner, models.CASCADE, db_column='id', primary_key=True)
    owners = models.ManyToManyField(User)
    description = models.TextField(blank=True, null=True)
    name = models.CharField(unique=True, max_length=45)
    created_at = models.DateTimeField() 
    
    def __str__(self):
        return f"{self.name}"


class Team(models.Model):
    org = models.ForeignKey(Org, on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    members = models.ManyToManyField(User)
    created_at = models.DateTimeField()
    description = models.TextField(blank=True, null=True)

    class Meta:
        unique_together = (('org', 'name'))
    
    def __str__(self):
        return f"{self.org}/{self.name}"


class Repo(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=45)
    owner = models.ForeignKey(Owner, models.CASCADE)
    stars = models.IntegerField()
    forks = models.IntegerField()
    is_public = models.BooleanField()
    created_at = models.DateTimeField()

    class Meta:
        unique_together = (('name', 'owner'))
    
    def __str__(self):
        return f"{self.name}"


class LanguageRepo(models.Model):
    language = models.CharField(max_length=45)
    repo = models.ForeignKey('Repo', models.CASCADE)
    lines_of_code = models.IntegerField()

    class Meta:
        unique_together = (('language', 'repo'))
    
    def __str__(self):
        return f"{self.language}: {self.lines_of_code} loc"


class Commit(models.Model):
    hash = models.CharField(primary_key=True, max_length=45)
    user = models.ForeignKey('User', models.DO_NOTHING, blank=True, null=True)
    repo = models.ForeignKey('Repo', models.CASCADE)
    created_at = models.DateTimeField()
    branch = models.CharField(max_length=45)

    class Meta:
        unique_together = (('hash', 'repo'),)
    
    def __str__(self):
        return f"{self.hash} - {self.created_at}"


class CommitFile(models.Model):
    ACTION_CHOICES = [
        ('c', 'create'),
        ('u', 'update'),
        ('r', 'rename'),
        ('d', 'delete'),
        ('h', 'help'),
        ('o', 'other')
    ]
    commit = models.ForeignKey(Commit, models.CASCADE)
    filename = models.CharField(max_length=45)
    action = models.CharField(max_length=6, choices=ACTION_CHOICES)

    class Meta:
        unique_together = (('commit', 'filename'))
    
    def __str__(self):
        return f"{self.filename}: {self.action}"


class Issue(models.Model):
    STATE_CHOICES = [
        ('o', 'open'),
        ('c', 'closed')
    ]
    LABEL_CHOICES = [
        ('b', 'bug'),
        ('f', 'feature'),
        ('d', 'documentation'),
        ('h', 'help'),
        ('o', 'other')
    ]
    repo = models.ForeignKey('Repo', models.CASCADE)
    title = models.CharField(max_length=45)
    description = models.TextField()
    state = models.CharField(max_length=6, choices=STATE_CHOICES)
    created_at = models.DateTimeField()
    label = models.CharField(max_length=13, choices=LABEL_CHOICES)
    user = models.ForeignKey('User', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        unique_together = (('repo', 'title'))
    
    def __str__(self):
        return f"{self.title}"
