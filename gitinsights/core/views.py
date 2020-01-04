from django.template.response import TemplateResponse
from django.shortcuts import render
from .forms import *
from .models import *
from django.http import HttpResponseRedirect, HttpResponse
from django.db.models import Q
from datetime import *
from django.urls import reverse


class statsView():

    def get(request):
        oldest_user = User.objects.all().order_by("date_of_birth")[0]
        youngest_user = User.objects.all().order_by("-date_of_birth")[0]
        No_of_Users = len(User.objects.all())
        No_of_Orgs = len(Org.objects.all())
        No_of_Repos = len(Repo.objects.all())
        No_of_Teams = len(Team.objects.all())
        No_of_Commits = len(Commit.objects.all())
        No_of_Langs = len(LanguageRepo.objects.all())

        user_most_commits, number_of_commits = statsView.user_most_commits()
        owner_most_repos, number_of_repos, type = statsView.owner_most_repos()
        org_most_teams, number_of_teams = statsView.org_most_teams()
        commits_year, commtis_six_months, commits_last_month = statsView.commits_counter()

        context = {"oldest_user": oldest_user, "No_of_Users": No_of_Users,
                   "youngest_user": youngest_user, "No_of_Orgs": No_of_Orgs,
                   "No_of_Teams": No_of_Teams, "No_of_Commits": No_of_Commits,
                   "No_of_Repos": No_of_Repos, "No_of_Langs": No_of_Langs,
                   "user_most_commits": user_most_commits,
                   "number_of_commits": number_of_commits,
                   "owner_most_repos": owner_most_repos,
                   "number_of_repos": number_of_repos,
                   "type": type, "org_most_teams": org_most_teams,
                   "number_of_teams": number_of_teams,
                   "commits_year": commits_year,
                   "commtis_six_months": commtis_six_months,
                   "commits_last_month": commits_last_month,
                 }
        return render(request, 'stats.html', context)

    def user_most_commits():

        users_all = User.objects.all()
        orgs_all = Org.objects.all()
        users_commits_by_id = []

        for i in range(1,len(users_all)+len(orgs_all)+1):
            users_commits_by_id.append(Commit.objects.filter(user = i).count())

        max_commits = max(users_commits_by_id)
        maxpos = users_commits_by_id.index(max(users_commits_by_id))
        user = User.objects.get(id=maxpos)

        return user.username, max_commits

    def owner_most_repos():

        users_all = User.objects.all()
        orgs_all = Org.objects.all()
        owner_by_repos = []

        for i in range(1,len(users_all)+len(orgs_all)+1):
            owner_by_repos.append(Repo.objects.filter(owner=i).count())

        max_repos = max(owner_by_repos)
        maxpos = owner_by_repos.index(max(owner_by_repos))

        if(Owner.objects.get(id=maxpos).type == "org"):
            org = Org.objects.get(id=maxpos)
            return org.name, max_repos, "org"
        else:
            user = User.objects.get(id=maxpos)
            return user.username, max_repos, "user"

    def org_most_teams():

        users_all = User.objects.all()
        orgs_all = Org.objects.all()
        teams_by_orgs = []
        orgs_IDs = []
        for i in range(1,len(users_all)+len(orgs_all)+1):
            if(Owner.objects.get(id=i).type == "org"):
                teams_by_orgs.append(Team.objects.filter(org=i).count())
                orgs_IDs.append(i)

        max_teams = max(teams_by_orgs)

        maxpos = teams_by_orgs.index(max(teams_by_orgs))
        max_ID = orgs_IDs[maxpos]
        org = Org.objects.get(id=max_ID)

        return org.name, max_teams

    def commits_counter():
        now = datetime.now()
        six_months_month = now.month-6 if now.month-6 > 0 else now.month+6
        year_six_months_month = now.year-1  if now.month-6 <= 0 else now.year

        last_years_month = now.month-1 if now.month-1 > 0 else now.month+11
        year_last_months_month = now.year-1  if now.month-1 <= 0 else now.year


        year = datetime(now.year-1, now.month, now.day, now.hour, now.minute, now.second)
        six_months = datetime(year_six_months_month, six_months_month, now.day, now.hour, now.minute, now.second)
        last_month = datetime(year_last_months_month, last_years_month, now.day, now.hour, now.minute, now.second)

        commits_year = len(Commit.objects.filter(created_at__range=(year, now)))
        commtis_six_months = len(Commit.objects.filter(created_at__range=(six_months, now)))
        commits_last_month = len(Commit.objects.filter(created_at__range=(last_month, now)))

        return commits_year, commtis_six_months, commits_last_month

class usersView():

    def get(request):
        if request.method == 'POST':
            u = UserForm(request.POST)
            print(u.is_valid())
            print(u.cleaned_data)
            if u.is_valid():
                u = u.cleaned_data
                owner = Owner(type='user')
                owner.save()
                user = User(
                    id=owner,
                    username=u['username'],
                    fullname=u['fullname'],
                    date_of_birth=u['date_of_birth'],
                    email=u['email'],
                    created_at=datetime.utcnow()
                )
                user.save()
                return HttpResponseRedirect(reverse('selectedUserUrl', args=[user.username]))
        else:
            users = User.objects.all()
            form = UserForm()
            context = {"users": users, "form": form}
            return render(request, 'users.html', context)

    def selected(request, username):
        user = User.objects.get(username=username)
        repos = Repo.objects.filter(owner=user.id)
        form = RepoForm(initial={'owner': user.id.id})
        context = {
            "user": user,
            "repos": repos,
            "form": form
        }
        return render(request, 'selectedUser.html', context)

    def search(request):
        query = request.GET.get('q')
        users = User.objects.filter(Q(username__icontains=query))
        context = {"users": users}
        return render(request, 'users.html', context)


class reposView():

    def get(request):
        if (request.method == 'POST'):
            r = RepoForm(request.POST)
            if r.is_valid():
                r = r.cleaned_data
                repo = Repo(
                    name=r['name'],
                    owner=Owner.objects.get(id=r['owner']),
                    stars=r['stars'],
                    forks=r['forks'],
                    is_public=r['is_public'],
                    created_at=datetime.utcnow()
                )
                repo.save()
                return HttpResponseRedirect(reverse('selectedRepoUrl',args=[repo.id]))
        else:
            repos = Repo.objects.all()
            context = {"repos": repos}
            return render(request, 'repos.html', context)

    def selected(request, id):
        repo = Repo.objects.get(id=id)
        if(repo.owner.type == "user"):
            owner_name = User.objects.get(id=repo.owner)
        else:
            owner_name = Org.objects.get(id=repo.owner)

        commits = Commit.objects.filter(repo=repo.id)
        issues = Issue.objects.filter(repo=repo.id)
        issue_form = IssueForm(initial={'repo': id})
        progLanguages = LanguageRepo.objects.filter(repo=repo.id)

        context = {"repo": repo,
                   "owner_name": owner_name,
                   "commits": commits,
                   "issues": issues,
                   "progLanguages": progLanguages,
                   "issue_form": issue_form
                   }

        return render(request, 'selectedRepo.html', context)

    def issues(request, id):
        if (request.method == 'POST'):
            i = IssueForm(request.POST)
            print("dasdas")
            print(i.is_valid())
            print(i.cleaned_data)
            if i.is_valid():
                print("dsdasda")
                i = i.cleaned_data
                issue = Issue(
                    title=i['title'],
                    repo=Repo.objects.get(id=id),
                    description=i['description'],
                    state=i['state'],
                    label=i['label'],
                    created_at=datetime.utcnow()
                )
                issue.save()
                print("fsdfsdfsd")
                return HttpResponseRedirect(reverse('selectedRepoIssueUrl',args=[id, issue.title]))

    def issueSelected(request, id, title):
        repo = Repo.objects.get(id=id)
        issue = Issue.objects.get(Q(repo=repo), Q(title=title))

        return render(request, 'selectedIssue.html', {"issue": issue})


    def search(request):
        query = request.GET.get('q')
        repos = Repo.objects.filter(Q(name__icontains=query))
        context = {"repos": repos}
        return render(request, 'repos.html', context)



class orgsView():

    def get(request):
        orgs = Org.objects.all()
        context = {"orgs": orgs}
        return render(request, 'orgs.html', context)

    def selected(request, org_name):
        org = Org.objects.get(name=org_name)
        repos = Repo.objects.filter(owner=org.id.id)
        repo_form = RepoForm(initial={'owner': org.id.id})
        teams = Team.objects.filter(org=org.id.id)
        team_form = TeamForm(initial={'org': org.id.id})
        context = {
            "org": org,
            "repos": repos,
            "teams": teams,
            "repo_form": repo_form,
            "team_form": team_form
        }
        return render(request, 'selectedOrg.html', context)

    def teams(request, org_name):
        print("yo")
        if (request.method == 'POST'):
            print("yi")
            t = TeamForm(request.POST)
            if t.is_valid():
                print("ya")
                t = t.cleaned_data
                print(t)
                team = Team(
                    name=t['name'],
                    org=Org.objects.get(name=org_name),
                    description=t['description'],
                    created_at=datetime.utcnow()
                )
                team.save()
                return HttpResponseRedirect(reverse('selectedOrgTeamUrl',args=[org_name, team.name]))

    def teamSelected(request, org_name, team_name):
        org = Org.objects.get(name=org_name)
        team = Team.objects.get(org=org.id.id, name=team_name)
        return render(request, 'selectedTeam.html', {"team": team, "org": org})

    def search(request):
        query = request.GET.get('q')
        orgs = Org.objects.filter(Q(name__icontains=query))
        context = {"orgs": orgs}
        return render(request, 'orgs.html', context)

class commitView():

    def get(request, id, hash):
        repo = Repo.objects.get(id=id)
        commit = Commit.objects.get(hash=hash)
        commitFiles = CommitFile.objects.filter(commit=commit)
        context = {
            "repo": repo,
            "commit": commit,
            "commitFiles": commitFiles,
        }
        return render(request, 'selectedCommit.html', context)

    def commitSelected(request, id, hash, filename):
        repo = Repo.objects.get(id=id)
        commit = Commit.objects.get(hash=hash)
        commitFiles = CommitFile.objects.get(
            Q(commit=commit), Q(filename=filename))

        context = {
            "repo": repo,
            "commitFiles": commitFiles,
        }
        return render(request, 'selectedFile.html', context)


class indexView():

    def index(request):
        return TemplateResponse(request, 'index.html')


class contactView():

    def contact(request):
        return TemplateResponse(request, 'contact.html')
