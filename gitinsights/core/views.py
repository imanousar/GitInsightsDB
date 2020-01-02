from django.template.response import TemplateResponse
from django.shortcuts import render
from .forms import *
from .models import *
from django.http import HttpResponseRedirect, HttpResponse


class usersView():

    def get(request):
        users = User.objects.all()
        context = {"users": users}

        return render(request, 'users.html', context)

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

        commits = Commit.objects.filter(repo=repo.id)
        commits = commits.all()
        return render(request, 'selectedRepo.html', {"repo": repo, "owner_name":owner_name, "commits":commits})

    def commitSelected(request, id, hash):
        #if (Commit.objects.get(repo = Repo.objects.get(id=id)).hash == ' '+hash+' '):
        commit = Commit.objects.get(hash=' '+hash+' ')
        #else:
        #  return HttpResponseRedirect(request, 'index.html')
        return render(request, 'selectedCommit.html', {"commit": commit})



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

class indexView():

    def index(request):
        return TemplateResponse(request, 'index.html')





class contactView():

    def contact(request):
        return TemplateResponse(request, 'contact.html')

class searchView():

    def get(request):
        return TemplateResponse(request, 'search.html')
