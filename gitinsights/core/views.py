from django.template.response import TemplateResponse
from django.shortcuts import render
from .forms import *
from .models import *
from django.http import HttpResponseRedirect, HttpResponse
from django.db.models import Q


class usersView():

    def get(request):
        users = User.objects.all()
        context = {"users": users}

        return render(request, 'users.html', context)

    def selected(request, username):
        user = User.objects.get(username=username)
        repos = Repo.objects.filter(owner=user.id)
        # orgs = Org.objects.filter(owners=user.id)
        return render(request, 'selectedUser.html', {"user": user, "repos": repos})

    def search(request):
        query = request.GET.get('q')
        users = User.objects.filter(Q(username__icontains=query))
        context = {"users": users}
        return render(request, 'users.html', context)


class reposView():

    def get(request):
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
        progLanguages = LanguageRepo.objects.filter(repo=repo.id)

        context = {"repo": repo,
                   "owner_name": owner_name,
                   "commits": commits,
                   "issues": issues,
                   "progLanguages": progLanguages,
                   }

        return render(request, 'selectedRepo.html', context)

    def issueSelected(request, id, title):
        repo = Repo.objects.get(id=id)
        issue = Issue.objects.get(Q(repo=repo), Q(title=title))

        return render(request, 'selectedIssue.html', {"issue": issue})

    def languageSelected(request, id, language):
        repo = Repo.objects.get(id=id)
        progLanguages = LanguageRepo.objects.get(
            Q(language=language), Q(repo=repo))

        context = {
            "repo": repo,
            "progLanguages": progLanguages
        }
        return render(request, 'selectedLanguage.html', context)

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
        repos = Repo.objects.filter(id=org.id.id)
        teams = Team.objects.filter(org=org.id.id)
        return render(request, 'selectedOrg.html', {"org": org, "repos": repos, "teams": teams})

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
