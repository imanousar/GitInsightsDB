from django.template.response import TemplateResponse
from django.shortcuts import render
from .forms import *
from .models import *
from django.http import HttpResponseRedirect, HttpResponse


class usersView():

    def get(request):
        users = User.objects.all()
        context = {"users": users}

        return render(request, 'user.html', context)

    def selected(request, username):
        user = User.objects.get(username=username)
        repos = Repo.objects.filter(owner=user.id)
        #orgs = Org.objects.filter(owners=user.id)
        return render(request, 'selectedUser.html', {"user": user, "repos": repos})


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
        return render(request, 'selectedRepo.html', {"repo": repo, "owner_name":owner_name})


class orgsView():

    def get(request):
        orgs = Org.objects.all()
        context = {"orgs": orgs}
        return render(request, 'org.html', context)

    def selected(request, org_name):
        org = Org.objects.get(name=org_name)
        repos = Repo.objects.filter(id=org.id.id)
        teams = Team.objects.filter(org=org.id.id)
        return render(request, 'selectedOrg.html', {"org": org, "repos": repos, "teams": teams})

    def teamSelected(request, org_name, team_name):
        org = Org.objects.get(name=org_name)
        team = Team.objects.get(org=org.id.id, name=team_name)
        return render(request, 'selectedTeam.html', {"team": team, "org": org})

class indexView():

    def index(request):
        return TemplateResponse(request, 'index.html')


class commitView():

    def addCommit(request):
        return TemplateResponse(request, 'addCommit.html')

    def searchCommit(request):
        return TemplateResponse(request, 'searchCommit.html')


class issueView():
    def addIssue(request):
        return TemplateResponse(request, 'addIssue.html')

    def searchIssue(request):
        return TemplateResponse(request, 'searchIssue.html')




class teamView():
    def addTeam(request):
        return TemplateResponse(request, 'addTeam.html')

    def searchTeam(request):
        return TemplateResponse(request, 'searchTeam.html')


class userView():
    def addUser(request):
        return TemplateResponse(request, 'addUser.html')

    def searchUser(request):
         return TemplateResponse(request, 'searchUser.html')


class contactView():

    def contact(request):
        return TemplateResponse(request, 'contact.html')

class searchView():

    def get(request):
        return TemplateResponse(request, 'search.html')
