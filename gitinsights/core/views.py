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
        return render(request, 'selectedUser.html', {"user": user, "repos": repos})


class reposView():

    def get(request):
        repos = Repo.objects.all()
        context = {"repos": repos}
        return render(request, 'repos.html', context)

    def selected(request, id):
        repo = Repo.objects.get(id=id)
        return render(request, 'selectedRepo.html', {"repo": repo})


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


class organizationView():

    def addOrganization(request):
        return TemplateResponse(request, 'addOrganization.html')

    def searchOrganization(request):
        return TemplateResponse(request, 'searchOrganization.html')


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
