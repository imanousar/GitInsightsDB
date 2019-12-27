import csv
import os, django

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "gitinsights.settings")
django.setup()

from core.models import *

BASE_DIR = "csv_dump/"

def migrate_owner():
    filename = BASE_DIR + "owner.csv"
    with open(filename) as csv_file:
        csv_reader = csv.DictReader(csv_file, delimiter=',')
        for row in csv_reader:
            o = Owner(**row)
            o.save()

def migrate_user():
    filename = BASE_DIR + "user.csv"
    with open(filename) as csv_file:
        csv_reader = csv.DictReader(csv_file, delimiter=',')
        for row in csv_reader:
            row['id'] = Owner.objects.get(id=row['id'])
            u = User(**row)
            u.save()


def migrate_org():
    filename = BASE_DIR + "organization.csv"
    with open(filename) as csv_file:
        csv_reader = csv.DictReader(csv_file, delimiter=',')
        for row in csv_reader:
            row['id'] = Owner.objects.get(id=row['id'])
            o = Org(**row)
            o.save()

    filename = BASE_DIR + "organization_user.csv"
    with open(filename) as csv_file:
        csv_reader = csv.DictReader(csv_file, delimiter=',')
        for row in csv_reader:
            u = User.objects.get(id=row['user'])
            o = Org.objects.get(id=row['org'])
            o.owners.add(u)
            o.save()

def migrate_team():
    filename = BASE_DIR + "team.csv"
    with open(filename) as csv_file:
        csv_reader = csv.DictReader(csv_file, delimiter=',')
        for row in csv_reader:
            row['org'] = Org.objects.get(id=row['org'])
            t = Team(**row)
            t.save()

    filename = BASE_DIR + "user_team.csv"
    with open(filename) as csv_file:
        csv_reader = csv.DictReader(csv_file, delimiter=',')
        for row in csv_reader:
            t = Team.objects.get(name=row['team'], org=Org.objects.get(id=row['org']))
            t.members.add(User.objects.get(id=row['user']))
            t.save()
    
def migrate_repo():
    filename = BASE_DIR + "repo.csv"
    with open(filename) as csv_file:
        csv_reader = csv.DictReader(csv_file, delimiter=',')
        for row in csv_reader:
            row['is_public'] = False if row['is_public'] == 0 else True
            row['owner'] = Owner.objects.get(id=row['owner'])
            r = Repo(**row)
            r.save()

    filename = BASE_DIR + "language_repo.csv"
    with open(filename) as csv_file:
        csv_reader = csv.DictReader(csv_file, delimiter=',')
        for row in csv_reader:
            row['repo'] = Repo.objects.get(id=row['repo'])
            lr = LanguageRepo(**row)
            lr.save()
    

def migrate_commit():
    filename = BASE_DIR + "commit.csv"
    with open(filename) as csv_file:
        csv_reader = csv.DictReader(csv_file, delimiter=',')
        for row in csv_reader:
            row['user'] = User.objects.get(id=row['user'])
            row['repo'] = Repo.objects.get(id=row['repo'])
            c = Commit(**row)
            c.save()

    filename = BASE_DIR + "commit_file.csv"
    with open(filename) as csv_file:
        csv_reader = csv.DictReader(csv_file, delimiter=',')
        for row in csv_reader:
            row['commit'] = Commit.objects.get(hash=row['commit'])
            cf = CommitFile(**row)
            cf.save()

def migrate_issue():
    filename = BASE_DIR + "issue.csv"
    with open(filename) as csv_file:
        csv_reader = csv.DictReader(csv_file, delimiter=',')
        for row in csv_reader:
            row['repo'] = Repo.objects.get(id=row['repo'])
            row['user'] = User.objects.get(id=row['user'])
            i = Issue(**row)
            i.save()


if __name__ == "__main__":
    migrate_owner()
    migrate_user()
    migrate_org()
    migrate_team()
    migrate_repo()
    migrate_commit()
    migrate_issue()
