from django.template.response import TemplateResponse

def index(request):
     return TemplateResponse(request, 'index.html')

def addCommit(request):
     return TemplateResponse(request, 'addCommit.html')

def addIssue(request):
     return TemplateResponse(request, 'addIssue.html')

def addOrganization(request):
     return TemplateResponse(request, 'addOrganization.html')

def addRepo(request):
     return TemplateResponse(request, 'addRepo.html')

def addTeam(request):
     return TemplateResponse(request, 'addTeam.html')

def addUser(request):
     return TemplateResponse(request, 'addUser.html')

def searchCommit(request):
     return TemplateResponse(request, 'searchCommit.html')

def searchIssue(request):
     return TemplateResponse(request, 'searchIssue.html')

def searchOrganization(request):
     return TemplateResponse(request, 'searchOrganization.html')

def searchRepo(request):
     return TemplateResponse(request, 'searchRepo.html')

def searchTeam(request):
     return TemplateResponse(request, 'searchTeam.html')

def searchUser(request):
     return TemplateResponse(request, 'searchUser.html')

def contact(request):
     return TemplateResponse(request, 'contact.html')
